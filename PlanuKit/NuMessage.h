//
//  NuMessage.h
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

typedef enum
{
    kNuMessageTypeMineSweep         =  4,
    kNuMessageTypeColony            =  5,
    kNuMessageTypeShip              =  8,
    kNuMessageTypeExplosion         = 10,
    kNuMessageTypeStarbase          = 11,
    kNuMessageTypeMeteors           = 13,
    kNuMessageTypeSensorSweep       = 14,
    kNuMessageTypeDistressCall      = 16,
    kNuMessageTypeMineScan          = 19
} NuMessageType;

@class NuTurn;

@interface NuMessage : NSManagedObject

@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSString * headline;
@property (nonatomic) int32_t messageId;
@property (nonatomic) int16_t messageType;
@property (nonatomic) int32_t ownerId;
@property (nonatomic) int32_t target;
@property (nonatomic) int32_t turnNumber;
@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic) BOOL isPlayerMessage;
@property (nonatomic, retain) NuTurn *turn;

+ (NuMessage*)messageFromJson:(NSDictionary*)input 
                  withContext:(NSManagedObjectContext*)context;

@end
