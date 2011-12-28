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

@interface NuPlanet : NSObject
{
    BOOL isBuildingStarbase;
    
    NSInteger planetId;
    NSString* name;
    
    NSInteger infoTurn;
    NSString* friendlyCode;
    NSInteger temperature;
    NSInteger x;
    NSInteger y;
    
    NSInteger ownerId;
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

@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, assign) NSInteger ownerId;
@property (nonatomic, assign) NSInteger planetId;

@property (nonatomic, assign) NSInteger clans;

@property (nonatomic, retain) NuStarbase* starbase;

- (BOOL)loadFromDict:(NSDictionary*)input;

@end
