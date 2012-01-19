//
//  NuShip.m
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

#import "NuShip.h"
#import "NuHull.h"
#import "NuShipDatabase.h"

@implementation NuShip
 
@synthesize ammo, bays, beamId, beams;
@synthesize clans, crew, damage, duranium;
@synthesize enemy, engineId, experience, friendlyCode;
@synthesize heading, history, hullId, shipId;
@synthesize infoTurn, isCloaked, mass, megacredits;
@synthesize mission, mission1targetId, mission2targetId, molybdenum;
@synthesize name, neutronium, readyStatus;
@synthesize supplies, targetX, targetY, torpedoId;
@synthesize torps, transferAmmo, transferClans, transferDuranium;
@synthesize transferMegacredits, transferMolybdenum, transferNeutronium;
@synthesize transferSupplies, transferTargetId, transferTargetType;
@synthesize transferTritanium, tritanium, turn, turnKilled;
@synthesize warp, waypoints, distanceToClosestPlanet, hull;
@synthesize owner, beam, launcher, engine, missionTarget1, missionTarget2;

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
        
    self.ammo = [[input objectForKey:@"ammo"] intValue];
    self.bays = [[input objectForKey:@"bays"] intValue];
    self.beamId = [[input objectForKey:@"beamid"] intValue];
    self.beams = [[input objectForKey:@"beams"] intValue];
    self.clans  = [[input objectForKey:@"clans"] intValue];
    self.crew = [[input objectForKey:@"crew"] intValue];
    self.damage  = [[input objectForKey:@"damage"] intValue];
    self.duranium = [[input objectForKey:@"duranium"] intValue];
    self.enemy = [[input objectForKey:@"enemy"] intValue];
    self.engineId = [[input objectForKey:@"engineid"] intValue];
    self.experience = [[input objectForKey:@"experience"] intValue];
    self.friendlyCode = [input objectForKey:@"friendlycode"];
    self.heading = [[input objectForKey:@"heading"] intValue];
    self.history = [input objectForKey:@"history"];
    self.hullId = [[input objectForKey:@"hullid"] intValue];
    self.shipId = [[input objectForKey:@"id"] intValue];
    self.infoTurn = [[input objectForKey:@"infoturn"] intValue];
    self.isCloaked = [[input objectForKey:@"iscloaked"] boolValue];
    self.mass = [[input objectForKey:@"mass"] intValue];
    self.megacredits = [[input objectForKey:@"megacredits"] intValue];
    self.mission = [[input objectForKey:@"mission"] intValue];
    self.mission1targetId = [[input objectForKey:@"mission1target"] intValue];
    self.mission2targetId = [[input objectForKey:@"mission2target"] intValue];
    self.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    self.name = [input objectForKey:@"name"];
    self.neutronium = [[input objectForKey:@"neutronium"] intValue];
    self.ownerId = [[input objectForKey:@"ownerid"] intValue];
    self.readyStatus = [[input objectForKey:@"readystatus"] intValue];
    self.supplies = [[input objectForKey:@"supplies"] intValue];
    self.targetX = [[input objectForKey:@"targetx"] intValue];
    self.targetY = [[input objectForKey:@"targety"] intValue];
    self.torpedoId = [[input objectForKey:@"torpedoid"] intValue];
    self.torps = [[input objectForKey:@"torps"] intValue];
    self.transferAmmo = [[input objectForKey:@"transferammo"] intValue];
    self.transferClans = [[input objectForKey:@"transferclans"] intValue];
    self.transferDuranium = [[input objectForKey:@"transferduranium"] intValue];;
    self.transferMegacredits = [[input objectForKey:@"transfermegacredits"] intValue];
    self.transferMolybdenum = [[input objectForKey:@"transfermolybdenum"] intValue];
    self.transferNeutronium = [[input objectForKey:@"transferneutronium"] intValue];
    self.transferSupplies = [[input objectForKey:@"transfersupplies"] intValue];
    self.transferTargetId = [[input objectForKey:@"transfertargetid"] intValue];
    self.transferTargetType = [[input objectForKey:@"transfertargettype"] intValue];
    self.transferTritanium = [[input objectForKey:@"transfertritanium"] intValue];
    self.tritanium = [[input objectForKey:@"tritanium"] intValue];
    self.turn = [[input objectForKey:@"turn"] intValue];
    self.turnKilled = [[input objectForKey:@"turnkilled"] intValue];
    self.warp = [[input objectForKey:@"warp"] intValue];
    
    self.x = [[input objectForKey:@"x"] intValue];
    self.y = [[input objectForKey:@"y"] intValue];
    
    if (self.heading < 0 
        && (self.x != self.targetX && self.y != self.targetY)
        && self.warp > 0)
    {
        NSInteger mvX = self.targetX - self.x;
        NSInteger mvY = self.targetY - self.y;
        
        double hdng = atan2((double)mvX, (double)mvY);
        hdng *= 180;
        hdng /= pi;
        
        // Account for x=0 y > 0 as the 0deg point
        //hdng -= 180;
        
        if (hdng < 0)
        {
            hdng += 360;
        }
        
        self.heading = (int)hdng;
        
        
    }

    // TODO: load waypoints
    //self.waypoints;
}

- (NSInteger)flightLength
{
    // TODO: account for lack of fuel and the weird major/minor
    // calculation at http://www.donovansvgap.com/help/details.htm#movement
    
    NSInteger retVal = pow(self.warp,2);
    
    // Check for Gravitonic accellerator
    NuShipDatabase* db = [NuShipDatabase sharedDatabase];
    NuHull* thisHull = [db.hulls objectAtIndex:self.hullId-1];
    if (thisHull.specialAbility == kShipSpecialGravitonic)
    {
        retVal += retVal;
    }
    
    if (self.targetX != self.x && self.targetY != self.y)
    {
        NSInteger targetPathX = self.targetX - self.x;
        NSInteger targetPathY = self.targetY - self.y;

        NSInteger targetLength = sqrt( pow(targetPathX,2) + pow(targetPathY,2) );
        if (targetLength < retVal)
        {
            retVal = targetLength;
        }
    }
    
    // HYP override
    if (thisHull.specialAbility == kShipSpecialHyperjump
        && [self.friendlyCode isEqualToString:@"HYP"])
    {
        retVal = 350;
    }
    
    return retVal;
}

- (NSPoint)nextTurnDestination
{
    NSPoint target = NSMakePoint(self.targetX, self.targetY);
    
    NSPoint vector = NSMakePoint(target.x - self.x, target.y - self.y);
    
    NSInteger distance = floor(sqrt(pow(vector.x,2) + pow(vector.y,2)));
    NSInteger maxTravel = pow(self.warp, 2);
    if (self.hull.specialAbility == kShipSpecialGravitonic)
    {
        maxTravel *= 2;
    }
    
    // check for out of fuel
    if ([self fuelBurnToPoint:target] > self.neutronium)
    {
        maxTravel = [self maxDistanceForFuel];
    }
    
    CGFloat trueHeading = atan2(vector.x, vector.y);
    
    if (maxTravel < distance)
    {
        target.x = self.x + floor(sin(trueHeading) * maxTravel );
        target.y = self.y + floor(cos(trueHeading) * maxTravel );
    }
    
    return target;
}


- (NSInteger)maxDistanceForFuel
{
    NSInteger fuelFactor = [self.engine fuelFactorForWarp:self.warp];
    
    NSInteger massFraction = trunc(self.mass/10);
    
    if (self.mission == kShipMissionTow)
    {
        massFraction += trunc(self.missionTarget1.mass/10);
    }
    
    NSInteger fueluse = floor (fuelFactor * massFraction  / 10000 );
    NSInteger maxTravel = pow(self.warp, 2);
    if (self.hull.specialAbility == kShipSpecialGravitonic)
    {
        maxTravel *= 2;
    }
    
    NSInteger distance = maxTravel * (self.neutronium / fueluse);
    return distance;
}

- (NSInteger)fuelBurnToPoint:(NSPoint)target
{
    NSInteger massFraction = trunc(self.mass/10);

    if (self.mission == kShipMissionTow)
    {
        massFraction += trunc(self.missionTarget1.mass/10);
    }
    
    CGFloat distance = floor(sqrt(pow(target.x - x, 2) + pow(target.y - y, 2)));
    
    NSInteger maxTravel = pow(self.warp, 2);
    if (self.hull.specialAbility == kShipSpecialGravitonic)
    {
        maxTravel *= 2;
    }
    
    NSInteger fuelFactor = [self.engine fuelFactorForWarp:self.warp];
    
    NSInteger fuelUse = trunc(fuelFactor * massFraction * ((distance/maxTravel) / 10000));
    
    return fuelUse;
}

@end
