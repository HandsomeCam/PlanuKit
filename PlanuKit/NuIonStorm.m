//
//  NuIonStorm.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/24/11.
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

#import "NuIonStorm.h"

@implementation NuIonStorm

@synthesize heading, ionStormId, isGrowing, radius;
@synthesize voltage, warp, x, y;

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
    self.heading = [[input objectForKey:@"heading"] intValue];
    self.ionStormId = [[input objectForKey:@"id"] intValue];
    self.isGrowing = [[input objectForKey:@"isgrowing"] boolValue];
    self.radius = [[input objectForKey:@"radius"] intValue];
    self.voltage = [[input objectForKey:@"voltage"] intValue];
    self.warp = [[input objectForKey:@"warp"] intValue];
    self.x = [[input objectForKey:@"x"] intValue];
    self.y = [[input objectForKey:@"y"] intValue];
}

@end
