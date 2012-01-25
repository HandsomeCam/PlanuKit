//
//  NuTurn.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/20/12.
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuBeam, NuEngine, NuHull, NuIonStorm, NuMinefield, NuPlanet, NuPlayer, NuPlayerRace, NuShip, NuTorpedo, NuGameSettings, NuGame;

@interface NuTurn : NSManagedObject

@property (nonatomic, retain) NSSet *ships;
@property (nonatomic, retain) NuGameSettings *settings;
@property (nonatomic, retain) NuGame *game;
@property (nonatomic, retain) NSSet *planets;
@property (nonatomic, retain) NuPlayer *player;
@property (nonatomic, retain) NSSet *ionStorms;
@property (nonatomic, retain) NSSet *messages;
@property (nonatomic, retain) NSSet *diplomaticRelations;
@property (nonatomic, retain) NSSet *players;
@property (nonatomic, retain) NSSet *races;
@property (nonatomic, retain) NSSet *minefields;
@property (nonatomic, retain) NSSet *hulls;
@property (nonatomic, retain) NSSet *beams;
@property (nonatomic, retain) NSSet *launchers;
@property (nonatomic, retain) NSSet *engines;
@end

@interface NuTurn (CoreDataGeneratedAccessors)

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

- (void)addPlanetsObject:(NuPlanet *)value;
- (void)removePlanetsObject:(NuPlanet *)value;
- (void)addPlanets:(NSSet *)values;
- (void)removePlanets:(NSSet *)values;

- (void)addIonStormsObject:(NuIonStorm *)value;
- (void)removeIonStormsObject:(NuIonStorm *)value;
- (void)addIonStorms:(NSSet *)values;
- (void)removeIonStorms:(NSSet *)values;

- (void)addMessagesObject:(NSManagedObject *)value;
- (void)removeMessagesObject:(NSManagedObject *)value;
- (void)addMessages:(NSSet *)values;
- (void)removeMessages:(NSSet *)values;

- (void)addDiplomaticRelationsObject:(NSManagedObject *)value;
- (void)removeDiplomaticRelationsObject:(NSManagedObject *)value;
- (void)addDiplomaticRelations:(NSSet *)values;
- (void)removeDiplomaticRelations:(NSSet *)values;

- (void)addPlayersObject:(NuPlayer *)value;
- (void)removePlayersObject:(NuPlayer *)value;
- (void)addPlayers:(NSSet *)values;
- (void)removePlayers:(NSSet *)values;

- (void)addRacesObject:(NuPlayerRace *)value;
- (void)removeRacesObject:(NuPlayerRace *)value;
- (void)addRaces:(NSSet *)values;
- (void)removeRaces:(NSSet *)values;

- (void)addMinefieldsObject:(NuMinefield *)value;
- (void)removeMinefieldsObject:(NuMinefield *)value;
- (void)addMinefields:(NSSet *)values;
- (void)removeMinefields:(NSSet *)values;

- (void)addHullsObject:(NuHull *)value;
- (void)removeHullsObject:(NuHull *)value;
- (void)addHulls:(NSSet *)values;
- (void)removeHulls:(NSSet *)values;

- (void)addBeamsObject:(NuBeam *)value;
- (void)removeBeamsObject:(NuBeam *)value;
- (void)addBeams:(NSSet *)values;
- (void)removeBeams:(NSSet *)values;

- (void)addLaunchersObject:(NuTorpedo *)value;
- (void)removeLaunchersObject:(NuTorpedo *)value;
- (void)addLaunchers:(NSSet *)values;
- (void)removeLaunchers:(NSSet *)values;

- (void)addEnginesObject:(NuEngine *)value;
- (void)removeEnginesObject:(NuEngine *)value;
- (void)addEngines:(NSSet *)values;
- (void)removeEngines:(NSSet *)values;

- (NSArray*)playerMessages;
- (NSArray*)systemMessages;

@end
