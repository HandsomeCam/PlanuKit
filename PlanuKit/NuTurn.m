//
//  NuTurn.m
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

#import "NuTurn.h"
#import "NuPlanet.h"
#import "NuStarbase.h"
#import "NuIonStorm.h"
#import "NuShip.h"
#import "NuMessage.h"
#import "NuDiplomaticRelation.h"
#import "NuPlayerRace.h"

@implementation NuTurn

@synthesize planets, gameSettings, player, ionStorms, ships, messages;
@synthesize diplomaticRelations, players, races;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

-(BOOL)loadFromDict:(NSDictionary*)input
{
    NSDictionary* settingsDict = [input objectForKey:@"settings"];
    
    // Load Settings
    NuGameSettings* settings = [[[NuGameSettings alloc] init] autorelease];
    
    [settings loadFromDict:settingsDict];
    self.gameSettings = settings;
    
    // Load Diplomatic Relations
    NSMutableArray* rels = [NSMutableArray array];
    
    for (NSDictionary* relDict in [input objectForKey:@"relations"])
    {
        NuDiplomaticRelation* ndr = [[[NuDiplomaticRelation alloc] init] autorelease];
        [ndr loadFromDict:relDict];
        [rels addObject:ndr];
    }
    
    self.diplomaticRelations = rels;
    
    // Load planets
    NSMutableArray* pl = [NSMutableArray array];
    
    for (NSDictionary* planetDict in [input objectForKey:@"planets"])
    {
        NuPlanet* planet = [[NuPlanet alloc] init];
        
        [planet loadFromDict:planetDict];
        
        [pl addObject:planet];
        
        [planet release];
    }
    
    self.planets = pl;
    
    // Load player
    self.player = [[[NuPlayer alloc] init] autorelease];
    [self.player loadFromDict:[input objectForKey:@"player"]];
    
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
    
    // Load Ion Storms
    NSMutableArray* ions = [NSMutableArray array];
    
    for (NSDictionary* stormDict in [input objectForKey:@"ionstorms"])
    {
        NuIonStorm* storm = [[[NuIonStorm alloc] init] autorelease];
        
        [storm loadFromDict:stormDict];
        [ions addObject:storm];
    }
    
    self.ionStorms = ions;
    
    // Load Ships
    NSMutableArray* starships = [NSMutableArray array];
    
    for (NSDictionary* shipDict in [input objectForKey:@"ships"])
    {
        NuShip* ship = [[[NuShip alloc] init] autorelease];
        
        [ship loadFromDict:shipDict];
        [starships addObject:ship];
    }
    
    self.ships = starships;
    
    [self calculateShipPlanetDistances];
    
    // Load Messages
    NSMutableArray* msgs = [NSMutableArray array];
    
    for (NSDictionary* msgDict in [input objectForKey:@"mymessages"])
    {
        NuMessage* msg = [[[NuMessage alloc] init] autorelease];
        [msg loadFromDict:msgDict];
        [msgs addObject:msg];
    }
    
    self.messages = msgs;
    
    // Load Players
    NSMutableArray* plyrs = [NSMutableArray array];
    
    for (NSDictionary* playerDict in [input objectForKey:@"players"])
    {
        NuPlayer* plyr = [[[NuPlayer alloc] init] autorelease];
        [plyr loadFromDict:playerDict];
        
        [plyrs addObject:plyr];
    }
    
    self.players = plyrs;
    
    // Load Races
    NSMutableArray* rcs = [NSMutableArray array];
    
    for (NSDictionary* raceDict in [input objectForKey:@"races"])
    {
        NuPlayerRace* race = [[[NuPlayerRace alloc] init] autorelease];
        [race loadFromDict:raceDict];
        [rcs addObject:race];
    }
    
    self.races = rcs;
    
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
            NSLog(@"Yeah! %@", plyr.username);
            return plyr;
        }
    }
    
    return nil;
}

@end
