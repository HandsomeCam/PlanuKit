//
//  NuPlanet.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/23/11.
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

#import "NuPlanet.h"

@implementation NuPlanet

@synthesize isBuildingStarbase;
@synthesize defenseBuilt, factoriesBuilt, minesBuilt;
@synthesize name, planetId;
@synthesize starbase, clans, debrisDisk;
@synthesize infoTurn, friendlyCode, temperature, readyStatus;
@synthesize colonistsChange, colonyHappinessChange, colonyTaxRate;
@synthesize nativeChange, nativeClans, nativeHappinessChange, nativeHappiness;
@synthesize nativeGovernment, nativeGovernmentName, nativeRaceName, nativeRace, nativeTaxRate;
@synthesize duranium, molybdenum, neutronium, megacredits, supplies;
@synthesize suppliesSold;
@synthesize defenseTarget, factoriesTarget, minesTarget;
@synthesize duraniumDensity, neutroniumDensity, molybdenumDensity, tritaniumDensity;
@synthesize duraniumOnGround, molybdenumOnGround, neutroniumOnGround, tritaniumOnGround;
@synthesize duraniumTotal, molybdenumTotal, neutroniumTotal, tritaniumTotal;

// Infrastructure
@synthesize factories, defensePosts, mines;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (BOOL)loadFromDict:(NSDictionary*)input
{
    self.x = [[input objectForKey:@"x"] intValue];
    self.y = [[input objectForKey:@"y"] intValue];
    self.ownerId = [[input objectForKey:@"ownerid"] intValue];
    
    self.name = [input objectForKey:@"name"];
    self.planetId = [[input objectForKey:@"id"] intValue];
    self.clans = [[input objectForKey:@"clans"] intValue];
    
    self.isBuildingStarbase = [[input objectForKey:@"buildingstarbase"] boolValue];
    self.defenseBuilt = [[input objectForKey:@"builtdefense"] intValue];
    self.factoriesBuilt = [[input objectForKey:@"builtfoctories"] intValue];
    self.minesBuilt = [[input objectForKey:@"builtmines"] intValue];
    
    self.debrisDisk = [[input objectForKey:@"debrisdisk"] boolValue];
    self.infoTurn = [[input objectForKey:@"infoturn"] intValue];

    self.friendlyCode = [input objectForKey:@"friendlycode"];
    self.temperature = [[input objectForKey:@"temp"] intValue];
    
    self.readyStatus = [[input objectForKey:@"readystatus"] intValue];

    self.colonistsChange = [[input objectForKey:@"colchange"] intValue];
    self.colonyHappinessChange = [[input objectForKey:@"colhappychange"] intValue];
    self.colonyTaxRate = [[input objectForKey:@"colonisttaxrate"] intValue];
    
    self.nativeChange = [[input objectForKey:@"nativechange"] intValue];
    self.nativeClans = [[input objectForKey:@"nativeclans"] intValue];
    self.nativeHappinessChange = [[input objectForKey:@"nativehappychange"] intValue];
    self.nativeHappiness = [[input objectForKey:@"nativehappypoints"] intValue];
    
    self.nativeGovernment = [[input objectForKey:@"nativegovernment"] intValue];
    self.nativeGovernmentName = [input objectForKey:@"nativegovernmentname"];
    self.nativeRaceName = [input objectForKey:@"nativeracename"];
    self.nativeRace = [[input objectForKey:@"nativetype"] intValue];
    self.nativeTaxRate = [[input objectForKey:@"nativetaxrate"] intValue];
    
    self.duranium = [[input objectForKey:@"duranium"] intValue];
    self.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    self.neutronium = [[input objectForKey:@"neutronium"] intValue];
    self.megacredits = [[input objectForKey:@"megacredits"] intValue];
    self.supplies = [[input objectForKey:@"supplies"] intValue];
    
    suppliesSold = [[input objectForKey:@"suppliessold"] intValue];
    
    defenseTarget  = [[input objectForKey:@"targetdefense"] intValue];
    factoriesTarget = [[input objectForKey:@"targetfactories"] intValue];
    minesTarget = [[input objectForKey:@"targetmines"] intValue];
    
    duraniumDensity = [[input objectForKey:@"densityduranium"] intValue];
    neutroniumDensity  = [[input objectForKey:@"densityneutronium"] intValue];
    molybdenumDensity = [[input objectForKey:@"densitymolybdenum"] intValue];
    tritaniumDensity = [[input objectForKey:@"densitytritanium"] intValue];

    duraniumOnGround = [[input objectForKey:@"groundduranium"] intValue];
    molybdenumOnGround = [[input objectForKey:@"groundmolybdenum"] intValue];
    neutroniumOnGround = [[input objectForKey:@"groundneutronium"] intValue];
    tritaniumOnGround = [[input objectForKey:@"groundtritanium"] intValue];

    duraniumTotal = [[input objectForKey:@"totalduranium"] intValue];
    molybdenumTotal = [[input objectForKey:@"totalmolybdenum"] intValue];
    neutroniumTotal = [[input objectForKey:@"totalneutronium"] intValue];
    tritaniumTotal = [[input objectForKey:@"totaltritanium"] intValue];

    return YES;
}

@end
