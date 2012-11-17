//
//  NuGameSettings.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/20/12.
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

@class NuGame, NuTurn;

@interface NuGameSettings : NSManagedObject

@property (nonatomic) int16_t buildQueuePlanetId;
@property (nonatomic) int16_t cloakFail;
@property (nonatomic) int16_t debrisDiskPercent;
@property (nonatomic, retain) NSString * discussionId;
@property (nonatomic) NSTimeInterval hostCompleted;
@property (nonatomic) NSTimeInterval hostStart;
@property (nonatomic) int32_t settingsId;
@property (nonatomic) int16_t mapHeight;
@property (nonatomic) int16_t mapWidth;
@property (nonatomic) int16_t maxAllies;
@property (nonatomic) int16_t maxIonCloudsPerStorm;
@property (nonatomic) int16_t maxIonStorms;
@property (nonatomic, retain) NSString * gameName;
@property (nonatomic) int16_t nebulas;
@property (nonatomic) NSTimeInterval nextHost;
@property (nonatomic) int16_t nuIonStorms;
@property (nonatomic) int16_t numberOfPlanets;
@property (nonatomic) int16_t planetScanRange;
@property (nonatomic) BOOL roundMap;
@property (nonatomic) int16_t shipScanRange;
@property (nonatomic) int16_t stars;
@property (nonatomic) int16_t structureDecayRate;
@property (nonatomic) int16_t teamSize;
@property (nonatomic) int32_t turnNumber;
@property (nonatomic) int16_t uniqueRaces;
@property (nonatomic) int16_t victoryCountdown;
@property (nonatomic, retain) NuGame *game;
@property (nonatomic, retain) NuTurn *turn;

+ (NuGameSettings*)settingsFromJson:(NSDictionary*)input withContext:(NSManagedObjectContext*)context;

@end
