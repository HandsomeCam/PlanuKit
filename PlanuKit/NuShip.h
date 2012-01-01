//
//  NuShip.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/26/11.
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
#import "NuMappableEntity.h"

@interface NuShip : NuMappableEntity
{
    NSInteger ammo;
    NSInteger bays;
    NSInteger beamId;
    NSInteger beams;
    NSInteger clans;
    NSInteger crew;
    NSInteger damage;
    NSInteger duranium;
    NSInteger enemy;
    NSInteger engineId;
    NSInteger experience;
    NSString* friendlyCode;
    NSInteger heading;
    NSString* history;
    NSInteger hullId;
    NSInteger shipId;
    NSInteger infoTurn;
    BOOL isCloaked;
    NSInteger mass;
    NSInteger megacredits;
    NSInteger mission;
    NSInteger mission1target;
    NSInteger mission2target;
    NSInteger molybdenum;
    NSString* name;
    NSInteger neutronium;
    NSInteger readyStatus;
    NSInteger supplies;
    NSInteger targetX;
    NSInteger targetY;
    NSInteger torpedoId;
    NSInteger torps;
    NSInteger transferAmmo;
    NSInteger transferClans;
    NSInteger transferDuranium;
    NSInteger transferMegacredits;
    NSInteger transferMolybdenum;
    NSInteger transferNeutronium;
    NSInteger transferSupplies;
    NSInteger transferTargetId;
    NSInteger transferTargetType;
    NSInteger transferTritanium;
    NSInteger tritanium;
    NSInteger turn;
    NSInteger turnKilled;
    NSInteger warp;
    NSArray* waypoints;
    double distanceToClosestPlanet;
}

@property (nonatomic, assign) NSInteger ammo;
@property (nonatomic, assign) NSInteger bays;
@property (nonatomic, assign) NSInteger beamId;
@property (nonatomic, assign) NSInteger beams;
@property (nonatomic, assign) NSInteger clans;
@property (nonatomic, assign) NSInteger crew;
@property (nonatomic, assign) NSInteger damage;
@property (nonatomic, assign) NSInteger duranium;
@property (nonatomic, assign) NSInteger enemy;
@property (nonatomic, assign) NSInteger engineId;
@property (nonatomic, assign) NSInteger experience;
@property (nonatomic, retain) NSString* friendlyCode;
@property (nonatomic, assign) NSInteger heading;
@property (nonatomic, retain) NSString* history;
@property (nonatomic, assign) NSInteger hullId;
@property (nonatomic, assign) NSInteger shipId;
@property (nonatomic, assign) NSInteger infoTurn;
@property (nonatomic, assign) BOOL isCloaked;
@property (nonatomic, assign) NSInteger mass;
@property (nonatomic, assign) NSInteger megacredits;
@property (nonatomic, assign) NSInteger mission;
@property (nonatomic, assign) NSInteger mission1target;
@property (nonatomic, assign) NSInteger mission2target;
@property (nonatomic, assign) NSInteger molybdenum;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, assign) NSInteger neutronium;
@property (nonatomic, assign) NSInteger readyStatus;
@property (nonatomic, assign) NSInteger supplies;
@property (nonatomic, assign) NSInteger targetX;
@property (nonatomic, assign) NSInteger targetY;
@property (nonatomic, assign) NSInteger torpedoId;
@property (nonatomic, assign) NSInteger torps;
@property (nonatomic, assign) NSInteger transferAmmo;
@property (nonatomic, assign) NSInteger transferClans;
@property (nonatomic, assign) NSInteger transferDuranium;
@property (nonatomic, assign) NSInteger transferMegacredits;
@property (nonatomic, assign) NSInteger transferMolybdenum;
@property (nonatomic, assign) NSInteger transferNeutronium;
@property (nonatomic, assign) NSInteger transferSupplies;
@property (nonatomic, assign) NSInteger transferTargetId;
@property (nonatomic, assign) NSInteger transferTargetType;
@property (nonatomic, assign) NSInteger transferTritanium;
@property (nonatomic, assign) NSInteger tritanium;
@property (nonatomic, assign) NSInteger turn;
@property (nonatomic, assign) NSInteger turnKilled;
@property (nonatomic, assign) NSInteger warp;
@property (nonatomic, retain) NSArray* waypoints;

@property (nonatomic, assign) double distanceToClosestPlanet;

- (void)loadFromDict:(NSDictionary*)input;
- (NSInteger)flightLength;

@end
