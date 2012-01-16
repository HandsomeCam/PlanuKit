//
//  NuTurn.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/23/11.
//  Copyright 2011-2012 Roboboogie Studios. All rights reserved.
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

#import "NuTurn.h"
#import "NuPlanet.h"
#import "NuStarbase.h"
#import "NuIonStorm.h"
#import "NuShip.h"
#import "NuMessage.h"
#import "NuDiplomaticRelation.h"
#import "NuPlayerRace.h"
#import "NuMinefield.h"
#import "NuHull.h"
#import "NuBeam.h"
#import "NuTorpedo.h"

@interface NuTurn (private)

- (void)loadDiplomaticRelations:(NSDictionary*)input;
- (void)loadPlanets:(NSDictionary*)input;
- (void)loadStarbases:(NSDictionary*)input;
- (void)loadIonStorms:(NSDictionary*)input;
- (void)loadShips:(NSDictionary*)input;
- (void)loadMessages:(NSDictionary*)input;
- (void)loadPlayers:(NSDictionary*)input;
- (void)loadRaces:(NSDictionary*)input;
- (void)loadMinefields:(NSDictionary*)input;
- (void)loadHulls:(NSDictionary*)input;

@end

@implementation NuTurn

@synthesize planets, gameSettings, player, ionStorms, ships;
@synthesize playerMessages, systemMessages, hulls, beams;
@synthesize diplomaticRelations, players, races, minefields;
@synthesize launchers;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)loadDiplomaticRelations:(NSDictionary*)input
{
    // Load Diplomatic Relations
    NSMutableArray* rels = [NSMutableArray array];
    
    for (NSDictionary* relDict in [input objectForKey:@"relations"])
    {
        NuDiplomaticRelation* ndr = [[[NuDiplomaticRelation alloc] init] autorelease];
        [ndr loadFromDict:relDict];
        [rels addObject:ndr];
    }
    
    self.diplomaticRelations = rels;
    
}

- (void)loadBeams:(NSDictionary*)input
{
    NSMutableArray* bms = [NSMutableArray array];
    
    for (NSDictionary* beamDict in [input objectForKey:@"beams"])
    {
        NuBeam* beam = [[[NuBeam alloc] init] autorelease];
        [beam loadFromDict:beamDict];
        [bms addObject:beam];
    }
    
    self.beams = bms;
}

- (void)loadTorpedos:(NSDictionary*)input
{
    NSMutableArray* tps = [NSMutableArray array];
    
    for (NSDictionary* torpDict in [input objectForKey:@"torpedos"])
    {
        NuTorpedo* torp = [[[NuTorpedo alloc] init] autorelease];
        [torp loadFromDict:torpDict];
        [tps addObject:torp];
    }
    
    self.launchers = tps;
}

- (void)loadPlanets:(NSDictionary *)input
{
    // Load planets
    NSMutableArray* pl = [NSMutableArray array];
    
    for (NSDictionary* planetDict in [input objectForKey:@"planets"])
    {
        NuPlanet* planet = [[NuPlanet alloc] init];
        
        [planet loadFromDict:planetDict];
        
        for (NuPlayer* plr in self.players)
        {
            if (planet.ownerId == plr.playerId)
            {
                planet.owner = plr;
                break;
            }
        }
        
        [pl addObject:planet];
        
        [planet release];
    }
    
    self.planets = pl;
}

- (void)loadStarbases:(NSDictionary *)input
{
    // Load starbases
    NSArray* starbases = [input objectForKey:@"starbases"];
    
    for (NSDictionary* sbDict in starbases)
    {
        NuStarbase* sb = [[[NuStarbase alloc] init] autorelease];
        
        [sb loadFromDict:sbDict];
        
        for (NuPlanet* sbp in self.planets)
        {
            if (sb.planetId == sbp.planetId)
            {
                sbp.starbase = sb;
            }
        }
    }
}

- (void)loadIonStorms:(NSDictionary *)input
{
    // Load Ion Storms
    NSMutableArray* ions = [NSMutableArray array];
    
    for (NSDictionary* stormDict in [input objectForKey:@"ionstorms"])
    {
        NuIonStorm* storm = [[[NuIonStorm alloc] init] autorelease];
        
        [storm loadFromDict:stormDict];
        [ions addObject:storm];
    }
    
    self.ionStorms = ions;
}

- (void)loadShips:(NSDictionary *)input
{
    // Load Ships
    NSMutableArray* starships = [NSMutableArray array];
    
    for (NSDictionary* shipDict in [input objectForKey:@"ships"])
    {
        NuShip* ship = [[[NuShip alloc] init] autorelease];
        
        [ship loadFromDict:shipDict];
        
        for (NuHull* hull in hulls)
        {
            if (hull.hullId == ship.hullId)
            {
                ship.hull = hull;
                break;
            }
        }
        
        for (NuPlayer* plr in self.players)
        {
            if (ship.ownerId == plr.playerId)
            {
                ship.owner = plr;
                break;
            }
        }
        
        if (ship.beams > 0)
        {
            for (NuBeam* beam in self.beams)
            {
                if (ship.beamId == beam.beamId)
                {
                    ship.beam = beam;
                    break;
                }
            }
        }
        
        if (ship.torps > 0)
        {
            for (NuTorpedo* torp in self.launchers)
            {
                if (ship.torpedoId == torp.torpedoId)
                {
                    ship.launcher = torp;
                    break;
                }
            }
        }
        
        [starships addObject:ship];
    }
    
    self.ships = starships;
    
    [self calculateShipPlanetDistances];
}

- (void)loadMessages:(NSDictionary *)input
{
    // Load Player Messages
    NSMutableArray* msgs = [NSMutableArray array];
    
    for (NSDictionary* msgDict in [input objectForKey:@"mymessages"])
    {
        NuMessage* msg = [[[NuMessage alloc] init] autorelease];
        [msg loadFromDict:msgDict];
        msg.isPlayerMessage = YES;
        [msgs addObject:msg];
    }
    
    self.playerMessages = msgs;
    
    // Load System Messages
    msgs = [NSMutableArray array];
    
    for (NSDictionary* msgDict in [input objectForKey:@"messages"])
    {
        NuMessage* msg = [[[NuMessage alloc] init] autorelease];
        [msg loadFromDict:msgDict];
        [msgs addObject:msg];
    }
    
    self.systemMessages = msgs;
}

- (void)loadPlayers:(NSDictionary *)input
{
    // Load Players
    NSMutableArray* plyrs = [NSMutableArray array];
    
    for (NSDictionary* playerDict in [input objectForKey:@"players"])
    {
        NuPlayer* plyr = [[[NuPlayer alloc] init] autorelease];
        [plyr loadFromDict:playerDict];
        
        for (NuPlayerRace* race in self.races)
        {
            if (plyr.raceId == race.raceId)
            {
                plyr.race = race;
            }
        }
        
        
        [plyrs addObject:plyr];
    }
    
    self.players = plyrs;
}

- (void)loadRaces:(NSDictionary *)input
{
    // Load Races
    NSMutableArray* rcs = [NSMutableArray array];
    
    for (NSDictionary* raceDict in [input objectForKey:@"races"])
    {
        NuPlayerRace* race = [[[NuPlayerRace alloc] init] autorelease];
        [race loadFromDict:raceDict];
        [rcs addObject:race];
    }
    
    self.races = rcs;
}

- (void)loadMinefields:(NSDictionary *)input
{
    // Load Minefields
    NSMutableArray* mfs = [NSMutableArray array];
    
    for (NSDictionary* mfDict in [input objectForKey:@"minefields"])
    {
        NuMinefield* mf = [[[NuMinefield alloc] init] autorelease];
        [mf loadFromDict:mfDict];
        [mfs addObject:mf];
    }
    
    self.minefields = mfs;
}

- (void)loadHulls:(NSDictionary *)input
{
    NSMutableArray* hls = [NSMutableArray array];
    
    for (NSDictionary* hullDict in [input objectForKey:@"hulls"])
    {
        NuHull* hull = [[[NuHull alloc] init] autorelease];
        [hull loadFromDict:hullDict];
        
        [hls addObject:hull];
    }
    
    self.hulls = hls;
}

-(BOOL)loadFromDict:(NSDictionary*)input
{
    NSDictionary* settingsDict = [input objectForKey:@"settings"];
    
    // Load Settings
    NuGameSettings* settings = [[[NuGameSettings alloc] init] autorelease];
    
    [settings loadFromDict:settingsDict];
    self.gameSettings = settings;

    // Needs to be loaded before players
    [self loadRaces:input];
    
    // Needs to be loaded before ships
    [self loadBeams:input];
    [self loadTorpedos:input];
    
    // Needs to be loaded before ships
    [self loadHulls:input];
    
    // Needs to be loaded before planets, ships, starbases, messages, minefields
    [self loadPlayers:input];
    
    [self loadDiplomaticRelations:input];
    
    [self loadPlanets:input];
    
    // Load player
    self.player = [[[NuPlayer alloc] init] autorelease];
    [self.player loadFromDict:[input objectForKey:@"player"]];
    
    [self loadStarbases:input];
    
    [self loadIonStorms:input];
    
    [self loadShips:input];
    
    [self loadMessages:input];
    
    [self loadMinefields:input];
    
    return NO;
}

-(void)calculateShipPlanetDistances
{
    for (NuShip* ship in self.ships)
    {
        double bestDist = 10000;
        
        for (NuPlanet* planet in self.planets)
        {
            double currentDist = sqrt(pow(planet.x - ship.x,2) + pow(planet.y - ship.y,2));
            
            if (currentDist < bestDist)
            {
                bestDist = currentDist;
            }
        }
        
        ship.distanceToClosestPlanet = bestDist;
    }
}

-(NuPlayer*)playerForId:(NSInteger)playerId
{
    for (NuPlayer* plyr in self.players)
    {
        if (plyr.playerId == playerId)
        {
            return plyr;
        }
    }
    
    return nil;
}

@end
