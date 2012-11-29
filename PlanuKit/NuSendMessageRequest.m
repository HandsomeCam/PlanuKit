//
//  NuSendMessageRequest.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/23/12.
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

#import "NuSendMessageRequest.h"
#import "NSString+NuEncoding.h"
#import "NSMutableURLRequest+ParamDict.h"
#import "JSONKit.h"
#import "NuGame+Functionality.h"
#import "NuTurn+Functionality.h"

#define kPlanetsNuLoginUrl @"http://api.planets.nu/game/sendmessage"

@interface NuSendMessageRequest ()
{
    NSMutableData *receivedData;
    NSInteger gameForMessages;
}
@end

@implementation NuSendMessageRequest

- (void)send:(NSString*)message
        from:(NSInteger)playerID
          to:(NSArray*)recipients
     forGame:(NSInteger)gameID
  withApiKey:(NSString*)apiKey;
{
    gameForMessages = gameID;
    
    // Create the request.
    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:kPlanetsNuLoginUrl]
                                                            cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                        timeoutInterval:60.0];
    
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded;"
      forHTTPHeaderField:@"Content-Type"];
    
    NSMutableDictionary* params = [NSMutableDictionary dictionary];
    
    // TODO: actually add the parameters
    [params setObject:[NSNumber numberWithInt:gameID] forKey:@"gameid"];
    [params setObject:[NSNumber numberWithInt:playerID] forKey:@"playerid"];
    [params setObject:apiKey forKey:@"apikey"];
    [params setObject:[message nuEncoded] forKey:@"body"];
    
    NSString* toPeeps = [recipients componentsJoinedByString:@","];
    toPeeps = [toPeeps stringByAppendingString:@","];
    
    [params setObject:toPeeps forKey:@"to"];
    
    [theRequest setHTTPParameters:params];
    
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
    
    [self.delegate sendMessage:self failedWith:[error localizedDescription]];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %lu bytes of data",[receivedData length]);
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    
    NSLog(@"Response: %@", responseString);
    
    // release the connection, and the data object
    
    
    if ([responseString hasPrefix:@"Error:"] == true)
    {
        // TODO: this
        [self.delegate sendMessage:self failedWith:[responseString substringFromIndex:6]];
        
        return;
    }
    
    id responseObject = [responseString objectFromJSONString];
    
    if ([responseObject isKindOfClass:[NSDictionary class]] == NO)
    {
        [self.delegate sendMessage:self failedWith:@"Invalid response from server"];
        return;
    }
    
    NSDictionary *responseData = (NSDictionary*)responseObject;
    
    if ([[responseData objectForKey:@"success"] boolValue] == NO)
    {
        NSString* errorString = [responseData objectForKey:@"error"];
        [self.delegate sendMessage:self failedWith:errorString];
        return;
    }
     
    // TODO: this should save the message data itself
    NuGame *game = [NuGame gameWithId:gameForMessages];
    NuTurn* turn = [game latestTurn];
    
    [turn updateDiplomaticMessages:responseData];
    
    [self.delegate sendMessage:self succeededWith:[responseData objectForKey:@"html"]];
}



@end
