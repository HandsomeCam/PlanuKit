//
//  NuTurnRequest.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/23/11.
//  Copyright 2011 Roboboogie Studios. All rights reserved.
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

#define kPlanetsNuLoadTurnUrl @"http://api.planets.nu/game/loadturn"

#import "NuTurnRequest.h"
#import "JSONKit.h"
#import "NuDataManager.h"
#import "NuGameSettings.h"
#import "NuTurn+Functionality.h"

@interface NuTurnRequest (private)

- (NuTurn*) parseTurnFromResponse:(NSString*)response;
- (NuTurn*) parseTurnFromResponse:(NSString *)response withTurn:(NuTurn*)t;

@end

@implementation NuTurnRequest

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)requestTurnFor:(NSInteger)gameId With:(NSString *)apiKey andDelegate:(id<NuTurnRequestDelegate>)delegateIncoming
{
    [self requestTurnNumber:-1
                    forGame:gameId
                    withKey:apiKey
                andDelegate:delegateIncoming];
}

- (void)updateAllTurnsForGame:(NuGame*)game
                      withKey:(NSString*)apiKey
                  andDelegate:(id<NuTurnRequestDelegate>)d
{
    turnsToUpdate = [[NSMutableSet set] retain];
    apiKeyInUse = [apiKey retain];
    gameToUpdate = [game retain];
    
    // Add every turn to the set
    for (int i=1; i <= game.turnNumber; i++)
    {
        [turnsToUpdate addObject:[NSNumber numberWithInt:i]];
    }
    
    for (NuTurn* turn in game.turns)
    {
        NSNumber* thisTurn = [NSNumber numberWithInt:turn.settings.turnNumber];
        [turnsToUpdate removeObject:thisTurn];
    }
    
    [turnsToUpdate removeObject:[NSNumber numberWithInteger:game.turnNumber]];
    
    [self requestTurnNumber:game.turnNumber 
                    forGame:game.gameId 
                    withKey:apiKey 
                andDelegate:d];
}

- (void)requestTurnNumber:(NSInteger)turnNumber forGame:(NSInteger)gameId withKey:(NSString *)apiKey andDelegate:(id<NuTurnRequestDelegate>)delegateIncoming
{
    delegate = delegateIncoming;
    
    NSString *turnOption = @"";
    
    if (turnNumber > 0)
    {
        turnOption = [NSString stringWithFormat:@"&turn=%ld", turnNumber];
    }
    
    NSString* fullUrl = [NSString stringWithFormat:@"%@?gameid=%d&apikey=%@", kPlanetsNuLoadTurnUrl, gameId, apiKey];
    
    fullUrl = [fullUrl stringByAppendingString:turnOption];
    
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
        receivedData = [[NSMutableData data] retain];
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
    [connection release];
    // receivedData is declared as a method instance elsewhere
    [receivedData release];
    
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSURLErrorFailingURLStringErrorKey]);
    
    [delegate turnRequestFailedWith:[error localizedDescription]];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %lu bytes of data",[receivedData length]);
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    
    //NSLog(@"Response: %@", responseString);
    
    // release the connection, and the data object
    [connection release];
    [receivedData release];
    
    
    if ([responseString hasPrefix:@"Error:"] == true)
    {
        [delegate turnRequestFailedWith:[responseString substringFromIndex:6]];
        [responseString release];
        return;
    }
    
    NuTurn* retVal = nil;
    
    if (gameToUpdate == nil)
    {
        retVal = [self parseTurnFromResponse:responseString];
        
        [delegate turnRequestSucceededWith:retVal];
    }
    else
    {
        NSDictionary* decodedJson = [responseString objectFromJSONString];
        
        NSDictionary* settings = [decodedJson objectForKey:@"settings"];
        
        NSInteger turnNumber = [[settings objectForKey:@"turn"] intValue];
        
        NuTurn* thisTurn = nil;

        for (NuTurn* t in gameToUpdate.turns)
        {
            if (t.settings.turnNumber == turnNumber)
            {
                thisTurn = t;
            }
        }
        
        NuTurn* updated = [self parseTurnFromResponse:responseString withTurn:thisTurn];
        [responseString release];
        
        if (updated != thisTurn) // New object
        {
            [gameToUpdate addTurnsObject:updated];
        }
        
        if (turnsToUpdate.count >= 1)
        {
            NSNumber* nextTurn = [turnsToUpdate anyObject];
            [turnsToUpdate removeObject:nextTurn];
            [self requestTurnNumber:[nextTurn intValue]
                        forGame:gameToUpdate.gameId
                        withKey:apiKeyInUse
                    andDelegate:delegate];
        }
        else
        {
            for (NuTurn* t in gameToUpdate.turns)
            {
                if (t.settings.turnNumber == gameToUpdate.turnNumber)
                {
                    retVal = t;
                }
            }
            [turnsToUpdate release];
            [apiKeyInUse release];
            [gameToUpdate release];
            
            NuDataManager* dm = [NuDataManager sharedInstance];
            [dm save];
            
            [delegate turnRequestSucceededWith:retVal];
        }
    }
}


- (NuTurn*) parseTurnFromResponse:(NSString*)response
{
    return [self parseTurnFromResponse:response withTurn:nil];
}

- (NuTurn*) parseTurnFromResponse:(NSString *)response withTurn:(NuTurn*)t
{ 
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    NuTurn* retVal = t;
    
    id decodedJson = [response objectFromJSONString];
    
    if ([decodedJson isKindOfClass:[NSDictionary class]] == false)
    {
        return nil;
    }
    
    NuDataManager* dm = [NuDataManager sharedInstance];
    
    if (retVal == nil)
    {
        retVal = [NuTurn turnFromJson:decodedJson
                      withContext:[dm mainObjectContext]];
    }
    else
    {
        [retVal updateContents:decodedJson
                   withContext:[dm mainObjectContext]];
    }
    
    [pool drain];
    
    return [retVal autorelease];
} 

@end
