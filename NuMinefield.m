//
//  NuMinefield.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/11/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
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

#import "NuMinefield.h"

@implementation NuMinefield

@synthesize friendlyCode, minefieldId, infoTurn, isWeb, radius, units;

- (void)loadFromDict:(NSDictionary*)input
{
    self.x = [[input objectForKey:@"x"] intValue];
    self.y = [[input objectForKey:@"y"] intValue];
    self.ownerId = [[input objectForKey:@"ownerid"] intValue];
    self.friendlyCode = [input objectForKey:@"friendlycode"];
    self.minefieldId = [[input objectForKey:@"id"] intValue];
    self.infoTurn = [[input objectForKey:@"infoturn"] intValue];
    self.isWeb = [[input objectForKey:@"isweb"] boolValue];
    self.radius = [[input objectForKey:@"radius"] intValue];
    self.units = [[input objectForKey:@"units"] intValue];
}


@end
