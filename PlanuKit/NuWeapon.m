//
//  NuWeapon.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/16/12.
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

#import "NuWeapon.h"

@implementation NuWeapon

@synthesize cost, crewKill, damage, duranium;
@synthesize mass, molybdenum, name;
@synthesize techLevel, tritanium;


- (void)loadFromDict:(NSDictionary*)input
{
    self.cost = [[input objectForKey:@"cost"] intValue];
    self.crewKill = [[input objectForKey:@"crewkill"] intValue];
    self.damage = [[input objectForKey:@"damage"] intValue];
    self.duranium = [[input objectForKey:@"duranium"] intValue];
    self.mass = [[input objectForKey:@"mass"] intValue];
    self.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    self.name = [input objectForKey:@"name"];
    self.techLevel = [[input objectForKey:@"techlevel"] intValue];
    self.tritanium = [[input objectForKey:@"tritanium"] intValue];
}

@end
