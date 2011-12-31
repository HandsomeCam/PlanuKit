//
//  NuMessage.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/30/11.
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

#import "NuMessage.h"

@implementation NuMessage

@synthesize body, headline, messageId, messageType;
@synthesize ownerId, target, turn, x, y;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)loadFromDict:(NSDictionary*)input
{
    self.body = [input objectForKey:@"body"];
    self.headline = [input objectForKey:@"headline"];
    self.messageId = [[input objectForKey:@"id"] intValue]; 
    self.messageType = [[input objectForKey:@"messagetype"] intValue];
    self.ownerId = [[input objectForKey:@"ownerid"] intValue]; 
    self.target = [[input objectForKey:@"target"] intValue]; 
    self.turn = [[input objectForKey:@"turn"] intValue]; 
    self.x = [[input objectForKey:@"x"] intValue]; 
    self.y = [[input objectForKey:@"y"] intValue]; 
}

@end
