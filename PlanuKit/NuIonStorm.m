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
    NSNumber* buf;
    
    buf = [input objectForKey:@"heading"];
    self.heading = [buf intValue];
    
    buf = [input objectForKey:@"id"];
    self.ionStormId = [buf intValue];
    
    buf = [input objectForKey:@"isgrowing"];
    self.isGrowing = [buf boolValue];
    
    buf = [input objectForKey:@"radius"];
    self.radius = [buf intValue];
    
    buf = [input objectForKey:@"voltage"];
    self.voltage = [buf intValue];
    
    buf = [input objectForKey:@"warp"];
    self.warp = [buf intValue];
    
    buf = [input objectForKey:@"x"];
    self.x = [buf intValue];
    
    buf = [input objectForKey:@"y"];
    self.y = [buf intValue];
}

@end
