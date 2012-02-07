//
//  NuTurn.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 2/6/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuBeam, NuDiplomaticRelation, NuEngine, NuGame, NuGameSettings, NuHull, NuIonStorm, NuMessage, NuMinefield, NuPlanet, NuPlayer, NuPlayerRace, NuScore, NuShip, NuStarbase, NuTorpedo;

@interface NuTurn : NSManagedObject

@property (nonatomic, retain) NSSet *beams;
@property (nonatomic, retain) NSSet *diplomaticRelations;
@property (nonatomic, retain) NSSet *engines;
@property (nonatomic, retain) NuGame *game;
@property (nonatomic, retain) NSSet *hulls;
@property (nonatomic, retain) NSSet *ionStorms;
@property (nonatomic, retain) NSSet *launchers;
@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *minefields;
@property (nonatomic, retain) NSSet *planets;
@property (nonatomic, retain) NuPlayer *player;
@property (nonatomic, retain) NSSet *players;
@property (nonatomic, retain) NSSet *races;
@property (nonatomic, retain) NuGameSettings *settings;
@property (nonatomic, retain) NSSet *ships;
@property (nonatomic, retain) NSSet *starbases;
@property (nonatomic, retain) NSSet *scores;
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

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

- (void)addStarbasesObject:(NuStarbase *)value;
- (void)removeStarbasesObject:(NuStarbase *)value;
- (void)addStarbases:(NSSet *)values;
- (void)removeStarbases:(NSSet *)values;

- (void)addScoresObject:(NuScore *)value;
- (void)removeScoresObject:(NuScore *)value;
- (void)addScores:(NSSet *)values;
- (void)removeScores:(NSSet *)values;

@end
