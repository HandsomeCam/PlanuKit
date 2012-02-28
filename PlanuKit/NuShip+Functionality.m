//
//  NuShip+Functionality.m
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

#import "NuShip+Functionality.h"
#import "NuHull+Functionality.h"
#import "NuEngine.h"
#import "NuDataManager.h"
#import "NuPlayer+Functionality.h"

@implementation NuShip (Functionality)

+ (NuShip*)blankShip
{
    NSManagedObjectContext* myMOC = [[NuDataManager sharedInstance] managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NuShip"
                                              inManagedObjectContext:myMOC];
    NSManagedObject *unassociatedShip = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:nil];
    
    NuShip* retVal = (NuShip*)unassociatedShip;
    
    //retVal.player = [NuPlayer blankPlayer];
    
    return retVal;
}

+ (NuShip*)shipFromJson:(NSDictionary*)input
            withContext:(NSManagedObjectContext*)context;
{
    NuShip* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuShip"
                                  inManagedObjectContext:context];
    
    retVal.ammo = [[input objectForKey:@"ammo"] intValue];
    retVal.bays = [[input objectForKey:@"bays"] intValue];
    retVal.beamId = [[input objectForKey:@"beamid"] intValue];
    retVal.beams = [[input objectForKey:@"beams"] intValue];
    retVal.clans  = [[input objectForKey:@"clans"] intValue];
    retVal.crew = [[input objectForKey:@"crew"] intValue];
    retVal.damage  = [[input objectForKey:@"damage"] intValue];
    retVal.duranium = [[input objectForKey:@"duranium"] intValue];
    retVal.enemy = [[input objectForKey:@"enemy"] intValue];
    retVal.engineId = [[input objectForKey:@"engineid"] intValue];
    retVal.experience = [[input objectForKey:@"experience"] intValue];
    retVal.friendlyCode = [input objectForKey:@"friendlycode"];
    retVal.heading = [[input objectForKey:@"heading"] intValue];
    retVal.history = [input objectForKey:@"history"];
    retVal.hullId = [[input objectForKey:@"hullid"] intValue];
    retVal.shipId = [[input objectForKey:@"id"] intValue];
    retVal.infoTurn = [[input objectForKey:@"infoturn"] intValue];
    retVal.isCloaked = [[input objectForKey:@"iscloaked"] boolValue];
    retVal.mass = [[input objectForKey:@"mass"] intValue];
    retVal.megacredits = [[input objectForKey:@"megacredits"] intValue];
    retVal.mission = [[input objectForKey:@"mission"] intValue];
    retVal.mission1targetId = [[input objectForKey:@"mission1target"] intValue];
    retVal.mission2targetId = [[input objectForKey:@"mission2target"] intValue];
    retVal.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    retVal.name = [input objectForKey:@"name"];
    retVal.neutronium = [[input objectForKey:@"neutronium"] intValue];
    retVal.ownerId = [[input objectForKey:@"ownerid"] intValue];
    retVal.readyStatus = [[input objectForKey:@"readystatus"] intValue];
    retVal.supplies = [[input objectForKey:@"supplies"] intValue];
    retVal.targetX = [[input objectForKey:@"targetx"] intValue];
    retVal.targetY = [[input objectForKey:@"targety"] intValue];
    retVal.torpedoId = [[input objectForKey:@"torpedoid"] intValue];
    retVal.torps = [[input objectForKey:@"torps"] intValue];
    retVal.transferAmmo = [[input objectForKey:@"transferammo"] intValue];
    retVal.transferClans = [[input objectForKey:@"transferclans"] intValue];
    retVal.transferDuranium = [[input objectForKey:@"transferduranium"] intValue];;
    retVal.transferMegacredits = [[input objectForKey:@"transfermegacredits"] intValue];
    retVal.transferMolybdenum = [[input objectForKey:@"transfermolybdenum"] intValue];
    retVal.transferNeutronium = [[input objectForKey:@"transferneutronium"] intValue];
    retVal.transferSupplies = [[input objectForKey:@"transfersupplies"] intValue];
    retVal.transferTargetId = [[input objectForKey:@"transfertargetid"] intValue];
    retVal.transferTargetType = [[input objectForKey:@"transfertargettype"] intValue];
    retVal.transferTritanium = [[input objectForKey:@"transfertritanium"] intValue];
    retVal.tritanium = [[input objectForKey:@"tritanium"] intValue];
    retVal.turnNumber = [[input objectForKey:@"turn"] intValue];
    retVal.turnKilled = [[input objectForKey:@"turnkilled"] intValue];
    retVal.warp = [[input objectForKey:@"warp"] intValue];
    
    retVal.x = [[input objectForKey:@"x"] intValue];
    retVal.y = [[input objectForKey:@"y"] intValue];
    
    if (retVal.heading < 0 
        && (retVal.x != retVal.targetX && retVal.y != retVal.targetY)
        && retVal.warp > 0)
    {
        NSInteger mvX = retVal.targetX - retVal.x;
        NSInteger mvY = retVal.targetY - retVal.y;
        
        double hdng = atan2((double)mvX, (double)mvY);
        hdng *= 180;
        hdng /= pi;
        
        // Account for x=0 y > 0 as the 0deg point
        //hdng -= 180;
        
        if (hdng < 0)
        {
            hdng += 360;
        }
        
        retVal.heading = (int)hdng;
    }
    
    return retVal;
}

- (NSInteger)flightLength
{
    // TODO: account for lack of fuel and the weird major/minor
    // calculation at http://www.donovansvgap.com/help/details.htm#movement
    
    NSInteger retVal = pow(self.warp,2);
    
    // Check for Gravitonic accellerator
    NuHull* thisHull = self.hull;
    
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
    
    CGFloat distance = floor(sqrt(pow(target.x - self.x, 2) + pow(target.y - self.y, 2)));
    
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
