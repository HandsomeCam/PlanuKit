//
//  NuPlayer.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/24/11.
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
#import "NuPlayerRaces.h"

@interface NuPlayer : NSObject
{
    NSString* email;
    NSInteger finishRank;
    NSInteger playerId;
    NSInteger priorityPoints;
    NuPlayerRace raceId;
    NSString* saveKey;
    NSInteger status;
    NSInteger teamId;
    NSInteger turnJoined;
    BOOL turnReady;
    NSInteger turnsMissed;
    NSInteger turnStatus;
    NSString* username;
}
 
@property (nonatomic, retain) NSString* email;
@property (nonatomic, assign) NSInteger finishRank;
@property (nonatomic, assign) NSInteger playerId;
@property (nonatomic, assign) NSInteger priorityPoints;
@property (nonatomic, assign) NuPlayerRace raceId;
@property (nonatomic, retain) NSString* saveKey;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, assign) NSInteger teamId;
@property (nonatomic, assign) NSInteger turnJoined;
@property (nonatomic, assign) BOOL turnReady;
@property (nonatomic, assign) NSInteger turnsMissed;
@property (nonatomic, assign) NSInteger turnStatus;
@property (nonatomic, retain) NSString* username;

- (void)loadFromDict:(NSDictionary*)input;

@end
