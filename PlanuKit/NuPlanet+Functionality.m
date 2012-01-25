//
//  NuPlanet+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
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

#import "NuPlanet+Functionality.h"

@implementation NuPlanet (Functionality)

+ (NuPlanet*)planetFromJson:(NSDictionary*)input
                withContext:(NSManagedObjectContext*)context
{
    NuPlanet* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuPlanet"
                                  inManagedObjectContext:context];
    
    retVal.x = [[input objectForKey:@"x"] intValue];
    retVal.y = [[input objectForKey:@"y"] intValue];
    retVal.ownerId = [[input objectForKey:@"ownerid"] intValue];
    
    retVal.name = [input objectForKey:@"name"];
    retVal.planetId = [[input objectForKey:@"id"] intValue];
    retVal.clans = [[input objectForKey:@"clans"] intValue];
    
    retVal.isBuildingStarbase = [[input objectForKey:@"buildingstarbase"] boolValue];
    retVal.defenseBuilt = [[input objectForKey:@"builtdefense"] intValue];
    retVal.factoriesBuilt = [[input objectForKey:@"builtfoctories"] intValue];
    retVal.minesBuilt = [[input objectForKey:@"builtmines"] intValue];
    
    retVal.debrisDisk = [[input objectForKey:@"debrisdisk"] boolValue];
    retVal.infoTurn = [[input objectForKey:@"infoturn"] intValue];
    
    retVal.friendlyCode = [input objectForKey:@"friendlycode"];
    retVal.temperature = [[input objectForKey:@"temp"] intValue];
    
    retVal.readyStatus = [[input objectForKey:@"readystatus"] intValue];
    
    retVal.colonistsChange = [[input objectForKey:@"colchange"] intValue];
    retVal.colonyHappinessChange = [[input objectForKey:@"colhappychange"] intValue];
    retVal.colonyTaxRate = [[input objectForKey:@"colonisttaxrate"] intValue];
    
    retVal.nativeChange = [[input objectForKey:@"nativechange"] intValue];
    retVal.nativeClans = [[input objectForKey:@"nativeclans"] intValue];
    retVal.nativeHappinessChange = [[input objectForKey:@"nativehappychange"] intValue];
    retVal.nativeHappiness = [[input objectForKey:@"nativehappypoints"] intValue];
    
    retVal.nativeGovernment = [[input objectForKey:@"nativegovernment"] intValue];
    retVal.nativeGovernmentName = [input objectForKey:@"nativegovernmentname"];
    retVal.nativeRaceName = [input objectForKey:@"nativeracename"];
    retVal.nativeRace = [[input objectForKey:@"nativetype"] intValue];
    retVal.nativeTaxRate = [[input objectForKey:@"nativetaxrate"] intValue];
    
    retVal.duranium = [[input objectForKey:@"duranium"] intValue];
    retVal.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    retVal.neutronium = [[input objectForKey:@"neutronium"] intValue];
    retVal.tritanium = [[input objectForKey:@"tritanium"] intValue];
    retVal.megacredits = [[input objectForKey:@"megacredits"] intValue];
    retVal.supplies = [[input objectForKey:@"supplies"] intValue];
    
    retVal.suppliedSold = [[input objectForKey:@"suppliessold"] intValue];
    
    retVal.defensePosts = [[input objectForKey:@"defense"] intValue];
    retVal.factories = [[input objectForKey:@"factories"] intValue];
    retVal.mines = [[input objectForKey:@"mines"] intValue];
    
    retVal.defenseTarget  = [[input objectForKey:@"targetdefense"] intValue];
    retVal.factoriesTarget = [[input objectForKey:@"targetfactories"] intValue];
    retVal.minesTarget = [[input objectForKey:@"targetmines"] intValue];
    
    retVal.duraniumDensity = [[input objectForKey:@"densityduranium"] intValue];
    retVal.neutroniumDensity  = [[input objectForKey:@"densityneutronium"] intValue];
    retVal.molybdenumDensity = [[input objectForKey:@"densitymolybdenum"] intValue];
    retVal.tritaniumDensity = [[input objectForKey:@"densitytritanium"] intValue];
    
    retVal.duraniumOnGround = [[input objectForKey:@"groundduranium"] intValue];
    retVal.molybdenumOnGround = [[input objectForKey:@"groundmolybdenum"] intValue];
    retVal.neutroniumOnGround = [[input objectForKey:@"groundneutronium"] intValue];
    retVal.tritaniumOnGround = [[input objectForKey:@"groundtritanium"] intValue];
    
    retVal.duraniumTotal = [[input objectForKey:@"totalduranium"] intValue];
    retVal.molybdenumTotal = [[input objectForKey:@"totalmolybdenum"] intValue];
    retVal.neutroniumTotal = [[input objectForKey:@"totalneutronium"] intValue];
    retVal.tritaniumTotal = [[input objectForKey:@"totaltritanium"] intValue];
    
    return retVal;
}

@end
