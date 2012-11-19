//
//  NuLoginRequest.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/21/11.
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

#import "NuLoginRequest.h"
#import "JSONKit.h"

#define kPlanetsNuLoginUrl @"http://api.planets.nu/login"

@implementation NuLoginRequest

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)performLoginWithUsername:(NSString*)username withPassword:(NSString*)password withDelegate:(id<NuLoginRequestDelegate>)delegateIncoming
{
    delegate = delegateIncoming;
    
    // Create the request.
    NSMutableURLRequest *theRequest=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:kPlanetsNuLoginUrl]
                                              cachePolicy:NSURLRequestUseProtocolCachePolicy
                                          timeoutInterval:60.0];
    
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:@"application/x-www-form-urlencoded;"
      forHTTPHeaderField:@"Content-Type"];
    
    NSString* postBody = [NSString stringWithFormat:@"username=%@&password=%@", username, password];
    
    [theRequest setHTTPBody:[postBody dataUsingEncoding:NSUTF8StringEncoding]];
    
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
    
    [delegate loginFailedWith:[error localizedDescription]];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //NSLog(@"Succeeded! Received %lu bytes of data",[receivedData length]);
    
    NSString *responseString = [[NSString alloc] initWithData:receivedData encoding:NSASCIIStringEncoding];
    
    //NSLog(@"Response: %@", responseString);
    
    // release the connection, and the data object
    
    
    if ([responseString hasPrefix:@"Error:"] == true)
    {
        [delegate loginFailedWith:[responseString substringFromIndex:6]];
        return;
    }
    
    id responseObject = [responseString objectFromJSONString];
    
    if ([responseObject isKindOfClass:[NSDictionary class]] == NO)
    {
        [delegate loginFailedWith:@"Invalid response from server"];
        return;
    }
    
    NSDictionary *responseData = (NSDictionary*)responseObject;
    
    if ([[responseData objectForKey:@"success"] boolValue] == NO)
    {
        NSString* errorString = [responseData objectForKey:@"error"];
        [delegate loginFailedWith:errorString];
        return;
    }
    
    NSString *apiKey = [responseData objectForKey:@"apikey"];
    
    [delegate loginSucceededWith:apiKey];
    
}

@end
