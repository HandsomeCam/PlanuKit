//
//  NuGame.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/21/12.
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

@class NuGameSettings, NuTurn;

@interface NuGame : NSManagedObject

@property (nonatomic) BOOL allTurnsIn;
@property (nonatomic, strong) NSString * createdBy;
@property (nonatomic) NSTimeInterval dateCreated;
@property (nonatomic) NSTimeInterval dateEnded;
@property (nonatomic) NSTimeInterval deleteDate;
@property (nonatomic, strong) NSString * desc;
@property (nonatomic, strong) NSDecimalNumber * difficulty;
@property (nonatomic) int16_t fastStart;
@property (nonatomic) int64_t gameId;
@property (nonatomic) int16_t gameType;
@property (nonatomic, strong) NSString * hostDays;
@property (nonatomic, strong) NSString * hostTime;
@property (nonatomic) BOOL isHosting;
@property (nonatomic) BOOL isPrivate;
@property (nonatomic, strong) NSString * lastBackupPath;
@property (nonatomic) NSTimeInterval lastLoadedDate;
@property (nonatomic) int32_t lastNotified;
@property (nonatomic) int32_t mapType;
@property (nonatomic) int16_t masterPlanetId;
@property (nonatomic) int32_t maxLevelId;
@property (nonatomic, strong) NSString * name;
@property (nonatomic) NSTimeInterval nextHost;
@property (nonatomic) int16_t quadrant;
@property (nonatomic) int16_t requiredLevelId;
@property (nonatomic) int16_t scenarioId;
@property (nonatomic, strong) NSString * shortDesc;
@property (nonatomic) int16_t slots;
@property (nonatomic, strong) NSString * slowHostDays;
@property (nonatomic) int16_t status;
@property (nonatomic) int32_t turnNumber;
@property (nonatomic) int16_t turnsPerWeek;
@property (nonatomic, strong) NSString * turnStatus;
@property (nonatomic) int16_t tutorialId;
@property (nonatomic) int16_t winCondition;
@property (nonatomic) int16_t yearStarted;
@property (nonatomic, strong) NuGameSettings *settings;
@property (nonatomic, strong) NSSet *turns;
@end

@interface NuGame (CoreDataGeneratedAccessors)

- (void)addTurnsObject:(NuTurn *)value;
- (void)removeTurnsObject:(NuTurn *)value;
- (void)addTurns:(NSSet *)values;
- (void)removeTurns:(NSSet *)values;

@end
