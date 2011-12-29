//
//  NuHull.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/27/11.
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

#import "NuHull.h"

@implementation NuHull

@synthesize hullId, techLevel, name, mass;
@synthesize fuel, cargo, crew, engines;
@synthesize beams, torpedoes, fighterBays, cost;
@synthesize duranium, tritanium, molybdenum;
@synthesize canCloak, specialAbility;

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
    self.hullId = [[input objectForKey:@"hullId"] intValue];
     
    self.techLevel = [[input objectForKey:@"techlevel"] intValue];
    
    self.name = [input objectForKey:@"name"];
     
    self.mass = [[input objectForKey:@"mass"] intValue];
     
    self.fuel = [[input objectForKey:@"fuel"] intValue];
     
    self.cargo = [[input objectForKey:@"cargo"] intValue];
     
    self.crew = [[input objectForKey:@"crew"] intValue];
     
    self.engines = [[input objectForKey:@"engines"] intValue];
     
    self.beams = [[input objectForKey:@"beams"] intValue];
     
    self.torpedoes = [[input objectForKey:@"torps"] intValue];
     
    self.fighterBays = [[input objectForKey:@"bays"] intValue];
    
    self.cost = [[input objectForKey:@"cost"] intValue];
     
    self.duranium = [[input objectForKey:@"duranium"] intValue];
     
    self.tritanium = [[input objectForKey:@"tritanium"] intValue];
     
    self.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    
    self.canCloak = [[input objectForKey:@"hasCloak"] boolValue];
    
    self.specialAbility = [[input objectForKey:@"special"] intValue];
}

@end
