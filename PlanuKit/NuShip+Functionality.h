//
//  NuShip+Functionality.h
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

#import "NuShip.h"


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


@interface NuShip (Functionality)

+ (NuShip*)shipFromJson:(NSDictionary*)input 
            withContext:(NSManagedObjectContext*)context;

+ (NuShip*)blankShip;

- (NSInteger)flightLength;
- (NSInteger)fuelBurnToPoint:(NSPoint)target;
- (NSPoint)nextTurnDestination;
- (NSInteger)maxDistanceForFuel;

@end
