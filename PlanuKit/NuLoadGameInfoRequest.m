//
//  NuLoadGameInfoRequest.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/27/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
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

#import "NuLoadGameInfoRequest.h"
#import "NuDataManager.h"
#import "JSONKit.h"
#import "NuGame+Functionality.h"

#define kPlanetsNuGameInfoUrl @"http://api.planets.nu/game/loadinfo"

@interface NuLoadGameInfoRequest ()
{
    id<NuLoadGameInfoRequestDelegate> delegate;
    NSMutableData* receivedData;
}

- (NuGame*)parseGameFromResponse:(NSString*)response;

@end

@implementation NuLoadGameInfoRequest

- (void)requestGameInfoFor:(NSInteger)gameID
              withDelegate:(id<NuLoadGameInfoRequestDelegate>)del
{
    delegate = del;
//    gameID = 999999;
    NSString* fullUrl = [NSString stringWithFormat:@"%@?&gameid=%d", kPlanetsNuGameInfoUrl, gameID];
    
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
    
    [delegate gameInfoRequest:self failedWith:[error localizedDescription]];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %lu bytes of data",[receivedData length]);
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    
    //NSLog(@"Response: %@", responseString);
    
    // release the connection, and the data object
    
    
    // TODO: check to see if this is the new dict style error messages
    
    if ([responseString hasPrefix:@"Error:"] == true)
    {
        [delegate gameInfoRequest:self failedWith:[responseString substringFromIndex:6]];
        return;
    }
    
    NuGame* returnValue = [self parseGameFromResponse:responseString];
    
    // TODO: check all nil results sent failure delegate
    if (returnValue == nil)
    {
        return;
    }
    
    [delegate gameInfoRequest:self succeededWith:returnValue];
}

- (NuGame*) parseGameFromResponse:(NSString*)response
{
    NuGame* retVal = nil;
    id decodedJson = nil;
    
    @autoreleasepool
    {
        NSLog(@"%@", response);
        decodedJson = [response objectFromJSONString];
        
        if ([decodedJson isKindOfClass:[NSDictionary class]] == false)
        {
            [delegate gameInfoRequest:self failedWith:@"Invalid response from server"];
            return nil;
        }
        
        NSDictionary* gameInfo = (NSDictionary*) decodedJson;

        id successResult = [gameInfo objectForKey:@"success"];
        
        if (successResult != nil)
        {
            BOOL result = [successResult boolValue];
            
            if (result == NO)
            {
                [delegate gameInfoRequest:self failedWith:[gameInfo objectForKey:@"error"]];
                return nil;
            }
        }
            
        
        NuDataManager* dm = [NuDataManager sharedInstance];
        
        NSArray* loaded = [NuGame allGames];
        
        NSDictionary* gameDict = [gameInfo objectForKey:@"game"];
                
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
        
          
        
        NSError* error = nil;
        [[dm mainObjectContext] save:&error];
        // TODO: catch errors
        
        retVal = game;
    }
    
    return retVal;
} 


@end
