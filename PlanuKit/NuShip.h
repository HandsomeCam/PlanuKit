//
//  NuShip.h
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
#import "NuMappableEntity.h"

typedef enum {
    kShipMissionExploration         = 0,
    kShipMissionMineSweep           = 1,
    kShipMissionLayMines            = 2,
    kShipMissionKill                = 3,
    kShipMissionSensorSweep         = 4,
    kShipMissionLandAndDisassemble  = 5,
    kShipMissionTow                 = 6,
    kShipMissionIntercept           = 7,
    kShipMissionRaceSpecial         = 8, // Rob, Hiss, etc
    kShipMissionCloak               = 9,
    kShipMissionBeamUpFuel          = 10,
    kShipMissionBeamUpDuranium      = 11,
    kShipMissionBeamUpTritanium     = 12,
    kShipMissionBeamUpMolybdenum    = 13,
    kShipMissionBeamUpSupplies      = 14
} kShipMission;


@class NuBeam, NuEngine, NuHull, NuShip, NuTorpedo, NuTurn;

@interface NuShip : NuMappableEntity
{
    double distanceToClosestPlanet;
}


@property (nonatomic, retain) NSString * name;
@property (nonatomic) int16_t shipId;
@property (nonatomic) int16_t ammo;
@property (nonatomic) int16_t bays;
@property (nonatomic) int16_t beamId;
@property (nonatomic) int16_t beams;
@property (nonatomic) int16_t clans;
@property (nonatomic) int16_t crew;
@property (nonatomic) int16_t damage;
@property (nonatomic) int16_t duranium;
@property (nonatomic) int16_t enemy;
@property (nonatomic) int16_t engineId;
@property (nonatomic) int32_t experience;
@property (nonatomic, retain) NSString * friendlyCode;
@property (nonatomic) int16_t heading;
@property (nonatomic, retain) NSString * history;
@property (nonatomic) int16_t hullId;
@property (nonatomic) int32_t infoTurn;
@property (nonatomic) BOOL isCloaked;
@property (nonatomic) int16_t mass;
@property (nonatomic) int16_t megacredits;
@property (nonatomic) int16_t mission;
@property (nonatomic) int16_t mission1targetId;
@property (nonatomic) int16_t mission2targetId;
@property (nonatomic) int16_t molybdenum;
@property (nonatomic) int16_t neutronium;
@property (nonatomic) int16_t readyStatus;
@property (nonatomic) int16_t supplies;
@property (nonatomic) int16_t targetX;
@property (nonatomic) int16_t targetY;
@property (nonatomic) int16_t torpedoId;
@property (nonatomic) int16_t torps;
@property (nonatomic) int16_t transferAmmo;
@property (nonatomic) int16_t transferClans;
@property (nonatomic) int16_t transferDuranium;
@property (nonatomic) int16_t transferMegacredits;
@property (nonatomic) int16_t transferMolybdenum;
@property (nonatomic) int16_t transferNeutronium;
@property (nonatomic) int16_t transferSupplies;
@property (nonatomic) int16_t transferTargetId;
@property (nonatomic) int16_t transferTargetType;
@property (nonatomic) int16_t transferTritanium;
@property (nonatomic) int16_t tritanium;
@property (nonatomic) int16_t turnNumber;
@property (nonatomic) int16_t turnKilled;
@property (nonatomic) int16_t warp;
@property (nonatomic, retain) NuBeam *beam;
@property (nonatomic, retain) NuEngine *engine;
@property (nonatomic, retain) NuTorpedo *launcher;
@property (nonatomic, retain) NuShip *missionTarget1;
@property (nonatomic, retain) NuShip *missionTarget2;
@property (nonatomic, retain) NuTurn *turn;
@property (nonatomic, retain) NuHull *hull;

@property (nonatomic) double distanceToClosestPlanet;

+ (NuShip*)shipFromJson:(NSDictionary*)input 
            withContext:(NSManagedObjectContext*)context;


- (NSInteger)flightLength;
- (NSInteger)fuelBurnToPoint:(NSPoint)target;
- (NSPoint)nextTurnDestination;
- (NSInteger)maxDistanceForFuel;

@end
