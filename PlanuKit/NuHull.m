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

@interface NuHull (private)

- (NSInteger)hullSpecialFromString:(NSString*)special;

@end


@implementation NuHull

@synthesize hullId, techLevel, name, mass;
@synthesize fuel, cargo, crew, engines;
@synthesize beams, torpedoes, fighterBays, cost;
@synthesize duranium, tritanium, molybdenum;
@synthesize canCloak, specialAbility, description;

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
    if ([input objectForKey:@"hullId"] != nil) // plist version
    {
        self.hullId = [[input objectForKey:@"hullId"] intValue];
    }
    else if ([input objectForKey:@"id"] != nil) // API version
    {
        self.hullId = [[input objectForKey:@"id"] intValue];
    }
    
    self.techLevel = [[input objectForKey:@"techlevel"] intValue]; //
    
    self.name = [input objectForKey:@"name"]; //
     
    self.mass = [[input objectForKey:@"mass"] intValue]; //
    
    if ([input objectForKey:@"fuel"] != nil) // plist version
    {
        self.fuel = [[input objectForKey:@"fuel"] intValue];
    }
    else if ([input objectForKey:@"fueltank"] != nil) // API version
    {
        self.fuel = [[input objectForKey:@"fueltank"] intValue];
    }
    
    self.cargo = [[input objectForKey:@"cargo"] intValue]; //
     
    self.crew = [[input objectForKey:@"crew"] intValue]; //
     
    self.engines = [[input objectForKey:@"engines"] intValue]; //
     
    self.beams = [[input objectForKey:@"beams"] intValue]; //
     
    if ([input objectForKey:@"torps"] != nil) // plist version
    {
        self.torpedoes = [[input objectForKey:@"torps"] intValue];
    }
    else if ([input objectForKey:@"launchers"] != nil) // API version
    {
        self.torpedoes = [[input objectForKey:@"launchers"] intValue];
    }
    
    if ([input objectForKey:@"bays"] != nil) // plist version
    {
        self.fighterBays = [[input objectForKey:@"bays"] intValue];
    }
    else if ([input objectForKey:@"fighterbays"] != nil) // API version
    {
        self.fighterBays = [[input objectForKey:@"fighterbays"] intValue];
    }
    
    self.cost = [[input objectForKey:@"cost"] intValue]; //
     
    self.duranium = [[input objectForKey:@"duranium"] intValue]; //
     
    self.tritanium = [[input objectForKey:@"tritanium"] intValue]; //
     
    self.molybdenum = [[input objectForKey:@"molybdenum"] intValue]; //
    
    if ([input objectForKey:@"hasCloak"] != nil) // plist version
    {
        self.canCloak = [[input objectForKey:@"hasCloak"] boolValue];
    }
    else if ([input objectForKey:@"cancloak"] != nil) // API version
    {
        self.canCloak = [[input objectForKey:@"cancloak"] boolValue];
    }
    
    id special = [input objectForKey:@"special"];
    
    if ([special isKindOfClass:[NSNumber class]] == YES)
    {
        self.specialAbility = [special intValue];
    }
    else
    {
        self.specialAbility = [self hullSpecialFromString:special];
    }
    
    self.description = [input objectForKey:@"description"]; // API only
}

- (NSInteger)hullSpecialFromString:(NSString *)special
{
    NSInteger retVal = 0;
    
    if ([special length] == 0)
    {
        return retVal;
    }
    
    NSRange textRange;
    
    // Terraform
    textRange = [special rangeOfString:@"Terraform"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialTerraform;
    }
    
    // Radiation Shielding -- Not tested
    textRange = [special rangeOfString:@"Radiation"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialRadiationShielding;
        NSLog(@"Rad Shld: %@", special);
    }
    
    // Tachyon
    textRange = [special rangeOfString:@"Tachyon"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialTachyonDevice;
    }
    
    // Bioscan
    textRange = [special rangeOfString:@"Bioscan"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialBioscanner;
    }
    
    // Nebula Scanner -- Not tested
    textRange = [special rangeOfString:@"Nebula"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialNebulaScanner;
        NSLog(@"NBSC: %@", special);
    }
    
    // Advanced Cloak
    textRange = [special rangeOfString:@"Advanced Cloak"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialAdvancedCloak;
    }
    
    // Glory Device
    textRange = [special rangeOfString:@"Glory Device"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialGloryDevice;
    }
    
    // Gambling
    textRange = [special rangeOfString:@"Gambling"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialGambling;
    }
    
    // Gravitonic
    textRange = [special rangeOfString:@"Gravitonic"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialGravitonic;
    }
    
    // Hyperjump
    textRange = [special rangeOfString:@"Hyperjumping"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialHyperjump;
    }
    
    // Warp Chunnel
    textRange = [special rangeOfString:@"Chunnel"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialWarpChunnel;
    } 
    
    // Imperial Assault
    textRange = [special rangeOfString:@"Imperial Assault"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialImperialAssault;
    }
     
    // Advanced Bioscanner
    textRange = [special rangeOfString:@"Advanced Bioscan"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialAdvancedBioscanner;
    }
     
    // Alchemy
    textRange =[special rangeOfString:@"Alchemy"];
    if(textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialAlchemy;
    } 
    
    // Ramscoop
    textRange = [special rangeOfString:@"Ramscoop"];
    if (textRange.location != NSNotFound)
    {
        retVal |= kShipSpecialRamscoop;
    } 
    
    return retVal;
}

@end
