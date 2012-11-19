//
//  NuTurn.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/15/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuBeam, NuDiplomaticRelation, NuEngine, NuExplosion, NuGame, NuGameSettings, NuHull, NuIonStorm, NuMessage, NuMinefield, NuPlanet, NuPlayer, NuPlayerRace, NuScore, NuShip, NuStarbase, NuTorpedo;

@interface NuTurn : NSManagedObject

@property (nonatomic, strong) NSSet *beams;
@property (nonatomic, strong) NSSet *diplomaticRelations;
@property (nonatomic, strong) NSSet *engines;
@property (nonatomic, strong) NSSet *explosions;
@property (nonatomic, strong) NuGame *game;
@property (nonatomic, strong) NSSet *hulls;
@property (nonatomic, strong) NSSet *ionStorms;
@property (nonatomic, strong) NSSet *launchers;
@property (nonatomic, strong) NSSet *messages;
@property (nonatomic, strong) NSSet *minefields;
@property (nonatomic, strong) NSSet *planets;
@property (nonatomic, strong) NuPlayer *player;
@property (nonatomic, strong) NSSet *players;
@property (nonatomic, strong) NSSet *races;
@property (nonatomic, strong) NSSet *scores;
@property (nonatomic, strong) NuGameSettings *settings;
@property (nonatomic, strong) NSSet *ships;
@property (nonatomic, strong) NSSet *starbases;
@end

@interface NuTurn (CoreDataGeneratedAccessors)

- (void)addBeamsObject:(NuBeam *)value;
- (void)removeBeamsObject:(NuBeam *)value;
- (void)addBeams:(NSSet *)values;
- (void)removeBeams:(NSSet *)values;

- (void)addDiplomaticRelationsObject:(NuDiplomaticRelation *)value;
- (void)removeDiplomaticRelationsObject:(NuDiplomaticRelation *)value;
- (void)addDiplomaticRelations:(NSSet *)values;
- (void)removeDiplomaticRelations:(NSSet *)values;

- (void)addEnginesObject:(NuEngine *)value;
- (void)removeEnginesObject:(NuEngine *)value;
- (void)addEngines:(NSSet *)values;
- (void)removeEngines:(NSSet *)values;

- (void)addExplosionsObject:(NuExplosion *)value;
- (void)removeExplosionsObject:(NuExplosion *)value;
- (void)addExplosions:(NSSet *)values;
- (void)removeExplosions:(NSSet *)values;

- (void)addHullsObject:(NuHull *)value;
- (void)removeHullsObject:(NuHull *)value;
- (void)addHulls:(NSSet *)values;
- (void)removeHulls:(NSSet *)values;

- (void)addIonStormsObject:(NuIonStorm *)value;
- (void)removeIonStormsObject:(NuIonStorm *)value;
- (void)addIonStorms:(NSSet *)values;
- (void)removeIonStorms:(NSSet *)values;

- (void)addLaunchersObject:(NuTorpedo *)value;
- (void)removeLaunchersObject:(NuTorpedo *)value;
- (void)addLaunchers:(NSSet *)values;
- (void)removeLaunchers:(NSSet *)values;

- (void)addMessagesObject:(NuMessage *)value;
- (void)removeMessagesObject:(NuMessage *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addMinefieldsObject:(NuMinefield *)value;
- (void)removeMinefieldsObject:(NuMinefield *)value;
- (void)addMinefields:(NSSet *)values;
- (void)removeMinefields:(NSSet *)values;

- (void)addPlanetsObject:(NuPlanet *)value;
- (void)removePlanetsObject:(NuPlanet *)value;
- (void)addPlanets:(NSSet *)values;
- (void)removePlanets:(NSSet *)values;

- (void)addPlayersObject:(NuPlayer *)value;
- (void)removePlayersObject:(NuPlayer *)value;
- (void)addPlayers:(NSSet *)values;
- (void)removePlayers:(NSSet *)values;

- (void)addRacesObject:(NuPlayerRace *)value;
- (void)removeRacesObject:(NuPlayerRace *)value;
- (void)addRaces:(NSSet *)values;
- (void)removeRaces:(NSSet *)values;

- (void)addScoresObject:(NuScore *)value;
- (void)removeScoresObject:(NuScore *)value;
- (void)addScores:(NSSet *)values;
- (void)removeScores:(NSSet *)values;

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

- (void)addStarbasesObject:(NuStarbase *)value;
- (void)removeStarbasesObject:(NuStarbase *)value;
- (void)addStarbases:(NSSet *)values;
- (void)removeStarbases:(NSSet *)values;

@end
