//
//  NuMinefield.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuPlayer, NuTurn;

@interface NuMinefield : NSManagedObject

@property (nonatomic, retain) NSString * friendlyCode;
@property (nonatomic) int16_t infoTurn;
@property (nonatomic) BOOL isWeb;
@property (nonatomic) int16_t minefieldId;
@property (nonatomic) int16_t radius;
@property (nonatomic) int32_t units;
@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic) int16_t ownerId;
@property (nonatomic, retain) NuTurn *turn;
@property (nonatomic, retain) NuPlayer *owner;

@end
