//
//  NuHull.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/20/12.
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#define kShipSpecialTerraform           1
#define kShipSpecialRadiationShielding  2
#define kShipSpecialTachyonDevice		4
#define kShipSpecialBioscanner			8
#define kShipSpecialNebulaScanner		16
#define kShipSpecialAdvancedCloak		32
#define kShipSpecialGloryDevice			64
#define kShipSpecialGambling			128
#define kShipSpecialGravitonic			256
#define kShipSpecialHyperjump			512
#define kShipSpecialWarpChunnel			1024
#define kShipSpecialImperialAssault		2048
#define kShipSpecialAdvancedBioscanner	4096
#define kShipSpecialAlchemy				8192
#define kShipSpecialRamscoop			16384


@class NuShip, NuTurn;

@interface NuHull : NSManagedObject

@property (nonatomic) int16_t hullId;
@property (nonatomic) int16_t techLevel;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int16_t mass;
@property (nonatomic) int16_t fuel;
@property (nonatomic) int16_t cargo;
@property (nonatomic) int16_t crew;
@property (nonatomic) int16_t engines;
@property (nonatomic) int16_t beams;
@property (nonatomic) int16_t torpedoes;
@property (nonatomic) int16_t fighterBays;
@property (nonatomic) int16_t cost;
@property (nonatomic) int16_t duranium;
@property (nonatomic) int16_t tritanium;
@property (nonatomic) int16_t molybdenum;
@property (nonatomic) BOOL canCloak;
@property (nonatomic) int32_t specialAbility;
@property (nonatomic, retain) NSString * descr;
@property (nonatomic, retain) NSSet *ships;
@property (nonatomic, retain) NuTurn *turn;
@end

@interface NuHull (CoreDataGeneratedAccessors)

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

+ (NuHull*)hullFromJson:(NSDictionary*)input
            withContext:(NSManagedObjectContext*)context;
    

@end
