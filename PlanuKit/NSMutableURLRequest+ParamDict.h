//
//  NSMutableURLRequest+ParamDict.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/23/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (ParamDict)

- (void)setHTTPParameters:(NSDictionary *)params;

@end
