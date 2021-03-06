
//
//  NuGameListRequest.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/22/11.
//  Copyright 2011 Srs Biznas, LLC. All rights reserved.
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//

#import "NuGameListRequest.h"
#import "JSONKit.h"
#import "NuGame.h"
#import "NuGame+Functionality.h"
#import "NuDataManager.h"
#import "NSMutableURLRequest+ParamDict.h"

#define kPlanetsNuGameListUrl @"http://api.planets.nu/games/list"

@interface NuGameListRequest(private) 

- (NSArray*) parseGamesFromResponse:(NSString*)response;

@end

@implementation NuGameListRequest

@synthesize gameStatus;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void)requestGamesFor:(NSString*)username
             withStatus:(enum GameStatus)status
           withDelegate:(id<NuGameListRequestDelegate>)delegateIncoming
{
    delegate = delegateIncoming;
    
    
    
    NSString* fullUrl = [NSString stringWithFormat:@"%@?username=%@&status=%d", kPlanetsNuGameListUrl, username, status];
    
    // Create the request.
    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:fullUrl]
                                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:60.0];
    
    [theRequest setHTTPMethod:@"GET"];
      
    // create the connection with the request
    // and start loading the data
    NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if (theConnection) {
        // Create the NSMutableData to hold the received data.
        // receivedData is an instance variable declared elsewhere.
        receivedData = [NSMutableData data];
    } else {
        // Inform the user that the connection failed.
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // This method is called when the server has determined that it
    // has enough information to create the NSURLResponse.
    
    // It can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    
    // receivedData is an instance variable declared elsewhere.
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Append the new data to receivedData.
    // receivedData is an instance variable declared elsewhere.
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
    // release the connection, and the data object
    // receivedData is declared as a method instance elsewhere
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
    [delegate gameRequest:self failedWith:[error localizedDescription]];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %lu bytes of data",[receivedData length]);
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    
     
    // TODO: check to see if this is the new dict style error messages
    
    
    if ([responseString hasPrefix:@"Error:"] == true)
    {
        [delegate gameRequest:self failedWith:[responseString substringFromIndex:6]];
        return;
    }
     
    NSArray* returnValue = [self parseGamesFromResponse:responseString];
    
    // TODO: fail if nil
    
    [delegate gameRequest:self succeededWith:returnValue];
}

- (NSArray*) parseGamesFromResponse:(NSString*)response
{
    NSMutableArray* retVal = nil;
    
    @autoreleasepool {
    
        retVal = [[NSMutableArray alloc] init];
        NSLog(@"%@", response);
        id decodedJson = [response objectFromJSONString];
        
        if ([decodedJson isKindOfClass:[NSArray class]] == false)
        {
            return nil;
        }
        
        NuDataManager* dm = [NuDataManager sharedInstance];
        
        NSArray* loaded = [NuGame allGames];
        
   
        for (NSDictionary* gameDict in decodedJson)
        {
            NuGame* game = nil;
            
            for (NuGame* g in loaded)
            {
                if (g.gameId == [[gameDict objectForKey:@"id"] intValue])
                {
                    [g updateContents:gameDict];
                    game = g;
                    break;
                }
            }
           
            if (game == nil)
            {
                game = [NuGame gameFromJson:gameDict
                                withContext:[dm mainObjectContext]];
            }
            
            
            [retVal addObject:game];
        }
         
        NSError* error = nil;
        [[dm mainObjectContext] save:&error];
    
    }
     
    return retVal;
} 

@end
