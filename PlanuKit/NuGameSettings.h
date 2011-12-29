//
//  NuGameSettings.h
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

#import <Foundation/Foundation.h>

@interface NuGameSettings : NSObject
{
    NSInteger buildQueuePlanetId;
    NSInteger cloakFail;
    NSInteger debrisDiskPercent;
    NSString* discussionId;
    NSDate* hostCompleted;
    NSDate* hostStart;
    NSInteger settingsId;
    NSInteger mapHeight;
    NSInteger mapWidth;
    NSInteger maxAllies;
    NSInteger maxIonCloudsPerStorm;
    NSInteger maxIonStorms;
    NSString* gameName;
    NSInteger nebulas;
    NSDate* nextHost;
    NSInteger nuIonStorms;
    NSInteger numberOfPlanets;
    NSInteger planetScanRange;
    BOOL roundMap;
    NSInteger shipScanRange;
    NSInteger stars;
    NSInteger structureDecayRate;
    NSInteger teamSize;
    NSInteger turn;
    NSInteger uniqueRaces;
    NSInteger victoryCountdown;
}
 
@property (nonatomic, assign) NSInteger buildQueuePlanetId;
@property (nonatomic, assign) NSInteger cloakFail;
@property (nonatomic, assign) NSInteger debrisDiskPercent;
@property (nonatomic, retain) NSString* discussionId;
@property (nonatomic, retain) NSDate* hostCompleted;
@property (nonatomic, retain) NSDate* hostStart;
@property (nonatomic, assign) NSInteger settingsId;
@property (nonatomic, assign) NSInteger mapHeight;
@property (nonatomic, assign) NSInteger mapWidth;
@property (nonatomic, assign) NSInteger maxAllies;
@property (nonatomic, assign) NSInteger maxIonCloudsPerStorm;
@property (nonatomic, assign) NSInteger maxIonStorms;
@property (nonatomic, retain) NSString* gameName;
@property (nonatomic, assign) NSInteger nebulas;
@property (nonatomic, retain) NSDate* nextHost;
@property (nonatomic, assign) NSInteger nuIonStorms;
@property (nonatomic, assign) NSInteger numberOfPlanets;
@property (nonatomic, assign) NSInteger planetScanRange;
@property (nonatomic, assign) BOOL roundMap;
@property (nonatomic, assign) NSInteger shipScanRange;
@property (nonatomic, assign) NSInteger stars;
@property (nonatomic, assign) NSInteger structureDecayRate;
@property (nonatomic, assign) NSInteger teamSize;
@property (nonatomic, assign) NSInteger turn;
@property (nonatomic, assign) NSInteger uniqueRaces;
@property (nonatomic, assign) NSInteger victoryCountdown;

- (BOOL)loadFromDict:(NSDictionary*)input;

@end
