//
//  NuPlayer.h
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

@class NuDiplomaticRelation, NuPlayerRace, NuShip, NuTurn;

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
@property (nonatomic, retain) NuPlayerRace *race;
@property (nonatomic, retain) NSSet *ships;
@property (nonatomic, retain) NuTurn *turn;
@property (nonatomic, retain) NSSet *diplomaticRelationsFrom;
@property (nonatomic, retain) NSSet *diplomaticRelationsTo;
@end

@interface NuPlayer (CoreDataGeneratedAccessors)

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

- (void)addDiplomaticRelationsFromObject:(NuDiplomaticRelation *)value;
- (void)removeDiplomaticRelationsFromObject:(NuDiplomaticRelation *)value;
- (void)addDiplomaticRelationsFrom:(NSSet *)values;
- (void)removeDiplomaticRelationsFrom:(NSSet *)values;

- (void)addDiplomaticRelationsToObject:(NuDiplomaticRelation *)value;
- (void)removeDiplomaticRelationsToObject:(NuDiplomaticRelation *)value;
- (void)addDiplomaticRelationsTo:(NSSet *)values;
- (void)removeDiplomaticRelationsTo:(NSSet *)values;

@end
