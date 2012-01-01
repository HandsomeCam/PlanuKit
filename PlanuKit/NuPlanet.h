//
//  NuPlanet.h
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

#import <Foundation/Foundation.h>
#import "NuStarbase.h"
#import "NuMappableEntity.h"

@interface NuPlanet : NuMappableEntity
{
    BOOL isBuildingStarbase;
    
    NSInteger planetId;
    NSString* name;
    
    NSInteger infoTurn;
    NSString* friendlyCode;
    NSInteger temperature;
     
    NSInteger readyStatus;
    
    NSInteger clans;
    NSInteger colonistsChange;
    NSInteger colonyHappinessChange;
    NSInteger colonyTaxRate;
    
    NSInteger nativeChange;
    NSInteger nativeClans;
    NSInteger nativeHappinessChange;
    NSInteger nativeHappiness;
    
    // TODO: make this an enum
    NSInteger nativeGovernment;
    NSString* nativeGovernmentName;
    NSString* nativeRaceName;
    NSInteger nativeRace;
    NSInteger nativeTaxRate;
    
    BOOL debrisDisk;
    
    // Resources
    NSInteger duranium;
    NSInteger molybdenum;
    NSInteger neutronium;
    
    NSInteger megacredits;
    NSInteger supplies;
    
    NSInteger suppliesSold;
    
    NSInteger defenseTarget;
    NSInteger factoriesTarget;
    NSInteger minesTarget;
    
    NSInteger duraniumDensity;
    NSInteger neutroniumDensity;
    NSInteger molybdenumDensity;
    NSInteger tritaniumDensity;
    
    NSInteger duraniumOnGround;
    NSInteger molybdenumOnGround;
    NSInteger neutroniumOnGround;
    NSInteger tritaniumOnGround;
    
    NSInteger duraniumTotal;
    NSInteger molybdenumTotal;
    NSInteger neutroniumTotal;
    NSInteger tritaniumTotal;
    
    // Infrastructure
    NSInteger factories;
    NSInteger defensePosts;
    NSInteger mines;
    
    NSInteger defenseBuilt;
    NSInteger factoriesBuilt;
    NSInteger minesBuilt;
    
    NuStarbase* starbase;
}

@property (nonatomic, assign) BOOL isBuildingStarbase;
@property (nonatomic, assign) NSInteger defenseBuilt;
@property (nonatomic, assign) NSInteger factoriesBuilt;
@property (nonatomic, assign) NSInteger minesBuilt;
 
@property (nonatomic, retain) NSString* name;
@property (nonatomic, assign) NSInteger planetId;

@property (nonatomic, assign) NSInteger clans;
 
@property (nonatomic, assign) NSInteger infoTurn;
@property (nonatomic, retain) NSString* friendlyCode;
@property (nonatomic, assign) NSInteger temperature; 
@property (nonatomic, assign) NSInteger readyStatus;
 
@property (nonatomic, assign) NSInteger colonistsChange;
@property (nonatomic, assign) NSInteger colonyHappinessChange;
@property (nonatomic, assign) NSInteger colonyTaxRate;

@property (nonatomic, assign) NSInteger nativeChange;
@property (nonatomic, assign) NSInteger nativeClans;
@property (nonatomic, assign) NSInteger nativeHappinessChange;
@property (nonatomic, assign) NSInteger nativeHappiness;

// TODO: make this an enum
@property (nonatomic, assign) NSInteger nativeGovernment;
@property (nonatomic, retain) NSString* nativeGovernmentName;
@property (nonatomic, retain) NSString* nativeRaceName;
@property (nonatomic, assign) NSInteger nativeRace;
@property (nonatomic, assign) NSInteger nativeTaxRate;

@property (nonatomic, assign) BOOL debrisDisk;

// Resources
@property (nonatomic, assign) NSInteger duranium;
@property (nonatomic, assign) NSInteger molybdenum;
@property (nonatomic, assign) NSInteger neutronium;

@property (nonatomic, assign) NSInteger megacredits;
@property (nonatomic, assign) NSInteger supplies;

@property (nonatomic, assign) NSInteger suppliesSold;

@property (nonatomic, assign) NSInteger defenseTarget;
@property (nonatomic, assign) NSInteger factoriesTarget;
@property (nonatomic, assign) NSInteger minesTarget;

@property (nonatomic, assign) NSInteger duraniumDensity;
@property (nonatomic, assign) NSInteger neutroniumDensity;
@property (nonatomic, assign) NSInteger molybdenumDensity;
@property (nonatomic, assign) NSInteger tritaniumDensity;

@property (nonatomic, assign) NSInteger duraniumOnGround;
@property (nonatomic, assign) NSInteger molybdenumOnGround;
@property (nonatomic, assign) NSInteger neutroniumOnGround;
@property (nonatomic, assign) NSInteger tritaniumOnGround;

@property (nonatomic, assign) NSInteger duraniumTotal;
@property (nonatomic, assign) NSInteger molybdenumTotal;
@property (nonatomic, assign) NSInteger neutroniumTotal;
@property (nonatomic, assign) NSInteger tritaniumTotal;

// Infrastructure
@property (nonatomic, assign) NSInteger factories;
@property (nonatomic, assign) NSInteger defensePosts;
@property (nonatomic, assign) NSInteger mines;
 

@property (nonatomic, retain) NuStarbase* starbase;

- (BOOL)loadFromDict:(NSDictionary*)input;

@end
