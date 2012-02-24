//
//  NuTurn+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/23/12.
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

#import "NuTurn+Functionality.h"


#import "NuBeam.h"
#import "NuEngine.h"
#import "NuHull.h"
#import "NuIonStorm.h"
#import "NuMinefield.h"
#import "NuPlanet.h"
#import "NuPlayer.h"
#import "NuPlayerRace.h"
#import "NuShip.h"
#import "NuTorpedo.h"
#import "NuGameSettings.h"
#import "NuStarbase.h"
#import "NuMessage.h"
#import "NuDiplomaticRelation.h"
#import "NuDataManager.h"
#import "NuExplosion.h"

#import "NuPlanet+Functionality.h"
#import "NuStarbase+Functionality.h"
#import "NuShip+Functionality.h"
#import "NuIonStorm+Functionality.h"
#import "NuMinefield+Functionality.h"
#import "NuHull+Functionality.h"
#import "NuPlayer+Functionality.h"
#import "NuScore+Functionality.h"

@interface NuTurn (private)

- (void)loadDiplomaticRelations:(NSDictionary*)input
                    withContext:(NSManagedObjectContext*)context;

- (void)loadPlanets:(NSDictionary*)input
        withContext:(NSManagedObjectContext*)context;

- (void)loadStarbases:(NSDictionary*)input 
          withContext:(NSManagedObjectContext*)context;

- (void)loadIonStorms:(NSDictionary*)input
          withContext:(NSManagedObjectContext*)context;

- (void)loadShips:(NSDictionary*)input
      withContext:(NSManagedObjectContext*)context;

- (void)loadMessages:(NSDictionary*)input
         withContext:(NSManagedObjectContext*)context;

- (void)loadPlayers:(NSDictionary*)input
        withContext:(NSManagedObjectContext*)context;

- (void)loadRaces:(NSDictionary*)input
      withContext:(NSManagedObjectContext*)context;

- (void)loadMinefields:(NSDictionary*)input
           withContext:(NSManagedObjectContext*)context;

- (void)loadHulls:(NSDictionary*)input
      withContext:(NSManagedObjectContext*)context;

- (void)loadEngines:(NSDictionary*)input
        withContext:(NSManagedObjectContext*)context;

- (void)loadBeams:(NSDictionary*)input
      withContext:(NSManagedObjectContext*)context;

- (void)loadTorpedoes:(NSDictionary*)input
          withContext:(NSManagedObjectContext*)context;

- (void)loadScores:(NSDictionary*)input
       withContext:(NSManagedObjectContext*)context;

- (void)extractExplosionsWithContext:(NSManagedObjectContext*)context;
- (void)calculateShipPlanetDistances;

- (void)assignMissionTargets;

- (void)removeOldData;

@end

@implementation NuTurn (Functionality)

+ (NuTurn*)turnFromJson:(NSDictionary*)input withContext:(NSManagedObjectContext*)context
{
    NuTurn* retVal = [NSEntityDescription insertNewObjectForEntityForName:@"NuTurn"
                                                   inManagedObjectContext:context];
   
    [retVal updateContents:input withContext:context];
   
    return retVal;
}

- (void)updateContents:(NSDictionary*)input withContext:(NSManagedObjectContext*)context
{
    NSDictionary* settingsDict = [input objectForKey:@"settings"];
    
    
    // Remove all data
    [self removeOldData];
    
    // Load Settings
    NuGameSettings* settings = [NuGameSettings settingsFromJson:settingsDict withContext:context];
    
    self.settings = settings;
    
    // Needs to be loaded before players
    [self loadRaces:input withContext:context];
    
    // Needs to be loaded before ships
    [self loadBeams:input withContext:context];
    [self loadTorpedoes:input withContext:context];
    [self loadEngines:input withContext:context];
    
    // Needs to be loaded before ships
    [self loadHulls:input withContext:context];
    
    // Needs to be loaded before planets, ships, starbases, messages, minefields, scores
    [self loadPlayers:input withContext:context];
    
    [self loadDiplomaticRelations:input withContext:context];
    
    [self loadPlanets:input withContext:context];
    
    // Load player
    self.player = [NuPlayer playerFromJson:[input objectForKey:@"player"]
                                 withContext:context]; 
    
    [self loadStarbases:input withContext:context];
    
    [self loadIonStorms:input withContext:context];
    
    [self loadShips:input withContext:context];
    
    [self loadMessages:input withContext:context];
    
    [self loadMinefields:input withContext:context];
    
    [self loadScores:input withContext:context];
    
    [self extractExplosionsWithContext:context];
}

- (void)extractExplosionsWithContext:(NSManagedObjectContext *)context
{
    for (NuMessage* msg in self.messages)
    {
        if (msg.messageType == kNuMessageTypeExplosion)
        {
            NuExplosion* explosion = 
            [NSEntityDescription insertNewObjectForEntityForName:@"NuExplosion"
                                          inManagedObjectContext:context];
            
            explosion.x = msg.x;
            explosion.y = msg.y;
            
            NSString *msgBody = msg.body;
            NSArray* splitBody = [msgBody componentsSeparatedByString:@": "];
            
            explosion.name = [splitBody objectAtIndex:1];
            explosion.turnNumber = self.settings.turnNumber;
            [self addExplosionsObject:explosion];
        }
    }
}

- (void)removeOldData
{
    [self removeScores:self.scores];
    self.settings = nil;
    self.player = nil;
    [self removeDiplomaticRelations:self.diplomaticRelations];
    [self removeBeams:self.beams];
    [self removeLaunchers:self.launchers];
    [self removeEngines:self.engines];
    [self removePlanets:self.planets];
    [self removeIonStorms:self.ionStorms];
    [self removeShips:self.ships];
    [self removeMessages:self.messages];
    [self removePlayers:self.players];
    [self removeRaces:self.races];
    [self removeMinefields:self.minefields];
    [self removeHulls:self.hulls];
    [self removeExplosions:self.explosions];
    
}

- (void)loadDiplomaticRelations:(NSDictionary*)input withContext:(NSManagedObjectContext *)context
{
    // Load Diplomatic Relations
    for (NSDictionary* relDict in [input objectForKey:@"relations"])
    {
        NuDiplomaticRelation* ndr = 
        [NuDiplomaticRelation diplomaticRelationFromJson:relDict
                                             withContext:context];
        [self addDiplomaticRelationsObject:ndr];
    }
}

- (void)loadBeams:(NSDictionary*)input withContext:(NSManagedObjectContext *)context
{
    for (NSDictionary* beamDict in [input objectForKey:@"beams"])
    {
        NuBeam* beam = [NuBeam beamFromJson:beamDict
                                withContext:context];
        [self addBeamsObject:beam];
    }
}

- (void)loadTorpedoes:(NSDictionary*)input withContext:(NSManagedObjectContext*)context
{
    for (NSDictionary* torpDict in [input objectForKey:@"torpedos"])
    {
        NuTorpedo* torp = [NuTorpedo torpedoFromJson:torpDict
                                         withContext:context];
        [self addLaunchersObject:torp];
    }
}

- (void)loadEngines:(NSDictionary *)input withContext:(NSManagedObjectContext *)context
{
    for (NSDictionary* engDict in [input objectForKey:@"engines"])
    {
        NuEngine* engine = [NuEngine engineFromJson:engDict
                                        withContext:context];
        
        [self addEnginesObject:engine];
    }
}

- (void)loadPlanets:(NSDictionary *)input withContext:(NSManagedObjectContext *)context
{
    // Load planets
    for (NSDictionary* planetDict in [input objectForKey:@"planets"])
    {
        NuPlanet* planet = [NuPlanet planetFromJson:planetDict
                                        withContext:context];
        
        for (NuPlayer* plr in self.players)
        {
            if (planet.ownerId == plr.playerId)
            {
                planet.owner = plr;
                break;
            }
        }
        
        [self addPlanetsObject:planet];
    }
}

- (void)loadStarbases:(NSDictionary *)input withContext:(NSManagedObjectContext*)context
{
    // Load starbases
    NSArray* starbases = [input objectForKey:@"starbases"];
    
    for (NSDictionary* sbDict in starbases)
    {
        NuStarbase* sb = [NuStarbase starbaseFromJson:sbDict withContext:context];
        
        for (NuPlanet* sbp in self.planets)
        {
            if (sb.planetId == sbp.planetId)
            {
                sbp.starbase = sb;
            }
        }
    }
}

- (void)loadIonStorms:(NSDictionary *)input withContext:(NSManagedObjectContext *)context
{
    // Load Ion Storms
    for (NSDictionary* stormDict in [input objectForKey:@"ionstorms"])
    {
        NuIonStorm* storm = [NuIonStorm stormFromJson:stormDict
                                          withContext:context];
        [self addIonStormsObject:storm];
    }
}

- (void)loadShips:(NSDictionary *)input withContext:(NSManagedObjectContext *)context
{
    // Load Ships
    for (NSDictionary* shipDict in [input objectForKey:@"ships"])
    {
        NuShip* ship = [NuShip shipFromJson:shipDict
                                withContext:context];
        
        for (NuHull* hull in self.hulls)
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
        
        for (NuEngine* engine in self.engines)
        {
            if (ship.engineId == engine.engineId)
            {
                ship.engine = engine;
                break;
            }
        }
        
        [self addShipsObject:ship];
    }
    
    [self calculateShipPlanetDistances];
    [self assignMissionTargets];
}

- (void)assignMissionTargets
{
    NSMutableDictionary *shipDict = [NSMutableDictionary dictionary];
    
    // TODO: this currently only supports tow missions
    
    for (NuShip* ship in self.ships)
    {
        [shipDict setObject:ship forKey:[NSNumber numberWithInteger:ship.shipId]];
    }
    
    for (NuShip* mr in self.ships)
    {
        if (mr.mission == kShipMissionTow)
        {
            if (mr.mission1targetId > 0)
            {
                mr.missionTarget1 = [shipDict objectForKey:[NSNumber numberWithInteger:mr.mission1targetId]];
            }
        }
    }
}

- (void)loadMessages:(NSDictionary *)input 
         withContext:(NSManagedObjectContext *)context
{
    // Load Player Messages
    
    for (NSDictionary* msgDict in [input objectForKey:@"mymessages"])
    {
        NuMessage* msg = [NuMessage messageFromJson:msgDict 
                                        withContext:context];
        msg.isPlayerMessage = YES;
        
        [self addMessagesObject:msg];
    }
    
    // TODO: add property
    //self.playerMessages = msgs;
    
    // Load System Messages
    
    for (NSDictionary* msgDict in [input objectForKey:@"messages"])
    {
        NuMessage* msg = [NuMessage messageFromJson:msgDict
                                        withContext:context];
        msg.isPlayerMessage = NO;
        
        [self addMessagesObject:msg];
    }
    
    //self.systemMessages = msgs;
}

- (void)loadPlayers:(NSDictionary *)input 
        withContext:(NSManagedObjectContext *)context
{
    // Load Players
    for (NSDictionary* playerDict in [input objectForKey:@"players"])
    {
        NuPlayer* plyr = [NuPlayer playerFromJson:playerDict
                                      withContext:context];
        
        for (NuPlayerRace* race in self.races)
        {
            if (plyr.raceId == race.raceId)
            {
                plyr.race = race;
            }
        }
        
        [self addPlayersObject:plyr];
    }
}

- (void)loadRaces:(NSDictionary *)input 
      withContext:(NSManagedObjectContext *)context
{
    // Load Races
    for (NSDictionary* raceDict in [input objectForKey:@"races"])
    {
        NuPlayerRace* race = [NuPlayerRace raceFromJson:raceDict
                                            withContext:context];
        [self addRacesObject:race];
    }
}

- (void)loadMinefields:(NSDictionary *)input 
           withContext:(NSManagedObjectContext *)context
{ 
    // Load Minefields
    for (NSDictionary* mfDict in [input objectForKey:@"minefields"])
    {
        NuMinefield* mf = [NuMinefield minefieldFromJson:mfDict
                                             withContext:context];
        
        [self addMinefieldsObject:mf];
    }
}

- (void)loadHulls:(NSDictionary *)input 
      withContext:(NSManagedObjectContext *)context
{
    for (NSDictionary* hullDict in [input objectForKey:@"hulls"])
    {
        NuHull* hull = [NuHull hullFromJson:hullDict
                                withContext:context];
        
        [self addHullsObject:hull];
    }
}


- (void)loadScores:(NSDictionary*)input
       withContext:(NSManagedObjectContext*)context
{
    for (NSDictionary* scoreDict in [input objectForKey:@"scores"])
    {
        NuScore* score = [NuScore scoreFromJson:scoreDict
                                    withContext:context];
        
        for (NuPlayer* player in self.players)
        {
            if (player.playerId == score.ownerId)
            {
                player.score = score;
            }
        }
        
        [self addScoresObject:score];
    }
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

- (NSArray*)playerMessages
{
    NSArray* allMessages = [self.messages allObjects];
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"isPlayerMessage == YES"];
    
    NSSortDescriptor* idSorter;
    idSorter = [NSSortDescriptor sortDescriptorWithKey:@"messageId" ascending:NO];
    
    
    NSArray* retVal = [[allMessages filteredArrayUsingPredicate:pred] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:idSorter, nil]];
    
    return retVal;
}

- (NSArray*)systemMessages
{
    NSArray* allMessages = [self.messages allObjects];
    
    NSPredicate* pred = [NSPredicate predicateWithFormat:@"isPlayerMessage == NO"];
    
    NSSortDescriptor* idSorter;
    idSorter = [NSSortDescriptor sortDescriptorWithKey:@"messageId" ascending:NO];
    
    
    NSArray* retVal = [[allMessages filteredArrayUsingPredicate:pred] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:idSorter, nil]];
    
    return retVal;
}

@end
