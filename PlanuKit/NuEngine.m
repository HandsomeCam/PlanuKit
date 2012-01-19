//
//  NuEngine.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/17/12.
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

#import "NuEngine.h"

@implementation NuEngine

@synthesize cost, duranium, engineId, molybdenum;
@synthesize name, techLevel, tritanium;

- (NSInteger)fuelFactorForWarp:(NSInteger)warpLevel
{
    if (warpLevel > 9)
    {
        return -1;
    }
    
    return fuelFactor[warpLevel-1];
}

- (void)loadFromDict:(NSDictionary*)input
{
    self.cost = [[input objectForKey:@"cost"] intValue];
    self.duranium = [[input objectForKey:@"duranium"] intValue];
    self.engineId = [[input objectForKey:@"id"] intValue];
    self.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    self.name = [input objectForKey:@"name"];
    self.techLevel = [[input objectForKey:@"techlevel"] intValue];
    self.tritanium = [[input objectForKey:@"tritanium"] intValue];
    
    fuelFactor[0] = [[input objectForKey:@"warp1"] intValue];
    fuelFactor[1] = [[input objectForKey:@"warp2"] intValue];
    fuelFactor[2] = [[input objectForKey:@"warp3"] intValue];
    fuelFactor[3] = [[input objectForKey:@"warp4"] intValue];
    fuelFactor[4] = [[input objectForKey:@"warp5"] intValue];
    fuelFactor[5] = [[input objectForKey:@"warp6"] intValue];
    fuelFactor[6] = [[input objectForKey:@"warp7"] intValue];
    fuelFactor[7] = [[input objectForKey:@"warp8"] intValue];
    fuelFactor[8] = [[input objectForKey:@"warp9"] intValue];
}

@end
