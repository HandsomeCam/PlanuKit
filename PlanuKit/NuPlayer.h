//
//  NuPlayer.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 2/6/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
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

@class NuDiplomaticRelation, NuMinefield, NuPlanet, NuPlayerRace, NuScore, NuShip, NuTurn;

@interface NuPlayer : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic) int16_t finishRank;
@property (nonatomic) int32_t playerId;
@property (nonatomic) int32_t priorityPoints;
@property (nonatomic) int16_t raceId;
@property (nonatomic, retain) NSString * saveKey;
@property (nonatomic) int32_t status;
@property (nonatomic) int16_t teamId;
@property (nonatomic) int32_t turnJoined;
@property (nonatomic) BOOL turnReady;
@property (nonatomic) int16_t turnsMissed;
@property (nonatomic) int16_t turnStatus;
@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSSet *diplomaticRelationsFrom;
@property (nonatomic, retain) NSSet *diplomaticRelationsTo;
@property (nonatomic, retain) NSSet *minefields;
@property (nonatomic, retain) NSSet *planets;
@property (nonatomic, retain) NuPlayerRace *race;
@property (nonatomic, retain) NSSet *ships;
@property (nonatomic, retain) NuTurn *turn;
@property (nonatomic, retain) NuScore *score;
@end

@interface NuPlayer (CoreDataGeneratedAccessors)

- (void)addDiplomaticRelationsFromObject:(NuDiplomaticRelation *)value;
- (void)removeDiplomaticRelationsFromObject:(NuDiplomaticRelation *)value;
- (void)addDiplomaticRelationsFrom:(NSSet *)values;
- (void)removeDiplomaticRelationsFrom:(NSSet *)values;

- (void)addDiplomaticRelationsToObject:(NuDiplomaticRelation *)value;
- (void)removeDiplomaticRelationsToObject:(NuDiplomaticRelation *)value;
- (void)addDiplomaticRelationsTo:(NSSet *)values;
- (void)removeDiplomaticRelationsTo:(NSSet *)values;

- (void)addMinefieldsObject:(NuMinefield *)value;
- (void)removeMinefieldsObject:(NuMinefield *)value;
- (void)addMinefields:(NSSet *)values;
- (void)removeMinefields:(NSSet *)values;

- (void)addPlanetsObject:(NuPlanet *)value;
- (void)removePlanetsObject:(NuPlanet *)value;
- (void)addPlanets:(NSSet *)values;
- (void)removePlanets:(NSSet *)values;

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

@end
