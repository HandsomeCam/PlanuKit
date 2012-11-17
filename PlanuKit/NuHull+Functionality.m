//
//  NuHull+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
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

#import "NuHull+Functionality.h"

@interface NuHull (private)

+ (int32_t)hullSpecialFromString:(NSString *)special;

@end

@implementation NuHull (Functionality)

+ (NuHull*)hullFromJson:(NSDictionary*)input 
            withContext:(NSManagedObjectContext*)context;
{
    NuHull* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuHull"
                                  inManagedObjectContext:context];
    if ([input objectForKey:@"hullId"] != nil) // plist version
    {
        retVal.hullId = [[input objectForKey:@"hullId"] intValue];
    }
    else if ([input objectForKey:@"id"] != nil) // API version
    {
        retVal.hullId = [[input objectForKey:@"id"] intValue];
    }
    
    retVal.techLevel = [[input objectForKey:@"techlevel"] intValue]; //
    
    retVal.name = [input objectForKey:@"name"]; //
    
    retVal.mass = [[input objectForKey:@"mass"] intValue]; //
    
    if ([input objectForKey:@"fuel"] != nil) // plist version
    {
        retVal.fuel = [[input objectForKey:@"fuel"] intValue];
    }
    else if ([input objectForKey:@"fueltank"] != nil) // API version
    {
        retVal.fuel = [[input objectForKey:@"fueltank"] intValue];
    }
    
    retVal.cargo = [[input objectForKey:@"cargo"] intValue]; //
    
    retVal.crew = [[input objectForKey:@"crew"] intValue]; //
    
    retVal.engines = [[input objectForKey:@"engines"] intValue]; //
    
    retVal.beams = [[input objectForKey:@"beams"] intValue]; //
    
    if ([input objectForKey:@"torps"] != nil) // plist version
    {
        retVal.torpedoes = [[input objectForKey:@"torps"] intValue];
    }
    else if ([input objectForKey:@"launchers"] != nil) // API version
    {
        retVal.torpedoes = [[input objectForKey:@"launchers"] intValue];
    }
    
    if ([input objectForKey:@"bays"] != nil) // plist version
    {
        retVal.fighterBays = [[input objectForKey:@"bays"] intValue];
    }
    else if ([input objectForKey:@"fighterbays"] != nil) // API version
    {
        retVal.fighterBays = [[input objectForKey:@"fighterbays"] intValue];
    }
    
    retVal.cost = [[input objectForKey:@"cost"] intValue]; //
    
    retVal.duranium = [[input objectForKey:@"duranium"] intValue]; //
    
    retVal.tritanium = [[input objectForKey:@"tritanium"] intValue]; //
    
    retVal.molybdenum = [[input objectForKey:@"molybdenum"] intValue]; //
    
    if ([input objectForKey:@"hasCloak"] != nil) // plist version
    {
        retVal.canCloak = [[input objectForKey:@"hasCloak"] boolValue];
    }
    else if ([input objectForKey:@"cancloak"] != nil) // API version
    {
        retVal.canCloak = [[input objectForKey:@"cancloak"] boolValue];
    }
    
    id special = [input objectForKey:@"special"];
    
    if ([special isKindOfClass:[NSNumber class]] == YES)
    {
        retVal.specialAbility = [special intValue];
    }
    else
    {
        retVal.specialAbility = [NuHull hullSpecialFromString:special];
    }
    
    retVal.descr = [input objectForKey:@"description"]; // API only
    
    return retVal;
}

+ (int32_t)hullSpecialFromString:(NSString *)special
{
    int32_t retVal = 0;
    
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
