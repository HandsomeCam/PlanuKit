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

@implementation NuShip
 
@synthesize ammo, bays, beamId, beams;
@synthesize clans, crew, damage, duranium;
@synthesize enemy, engineId, experience, friendlyCode;
@synthesize heading, history, hullId, shipId;
@synthesize infoTurn, isCloaked, mass, megacredits;
@synthesize mission, mission1target, mission2target, molybdenum;
@synthesize name, neutronium, ownerId, readyStatus;
@synthesize supplies, targetX, targetY, torpedoId;
@synthesize torps, transferAmmo, transferClans, transferDuranium;
@synthesize transferMegacredits, transferMolybdenum, transferNeutronium;
@synthesize transferSupplies, transferTargetId, transferTargetType;
@synthesize transferTritanium, tritanium, turn, turnKilled;
@synthesize warp, x, y, waypoints;

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
    self.mission1target = [[input objectForKey:@"mission1target"] intValue];
    self.mission2target = [[input objectForKey:@"mission2target"] intValue];
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

    // TODO: load waypoints
    //self.waypoints;
}

@end
