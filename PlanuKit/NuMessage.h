//
//  NuMessage.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/30/11.
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

@interface NuMessage : NSObject
{
    NSString* body;
    NSString* headline;
    NSInteger messageId;
    NuMessageType messageType;
    NSInteger ownerId;
    NSInteger target;
    NSInteger turn;
    NSInteger x;
    NSInteger y;
    BOOL isPlayerMessage;
}

@property (nonatomic, retain) NSString* body;
@property (nonatomic, retain) NSString* headline;
@property (nonatomic, assign) NSInteger messageId;
@property (nonatomic, assign) NuMessageType messageType;
@property (nonatomic, assign) NSInteger ownerId;
@property (nonatomic, assign) NSInteger target;
@property (nonatomic, assign) NSInteger turn;
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;
@property (nonatomic, assign) BOOL isPlayerMessage;


- (void)loadFromDict:(NSDictionary*)input;

@end
