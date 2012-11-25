//
//  NSMutableURLRequest+ParamDict.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/23/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import "NSMutableURLRequest+ParamDict.h"

@implementation NSMutableURLRequest (ParamDict)

- (void)setHTTPParameters:(NSDictionary *)params;
{
    NSString* body = @"";
    
    for (id key in [params allKeys])
    {
        // TODO: each item needs to be URLencoded at this point
        body = [body stringByAppendingFormat:@"&%@=%@", key, [params objectForKey:key]];
    }
    
    // Trim leading ampersand
    body = [body substringFromIndex:1];

    
    [self setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
}

@end
