//
//  NuIonStorm.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuTurn;

@interface NuIonStorm : NSManagedObject

@property (nonatomic) int16_t heading;
@property (nonatomic) int16_t ionStormId;
@property (nonatomic) BOOL isGrowing;
@property (nonatomic) int16_t radius;
@property (nonatomic) int16_t voltage;
@property (nonatomic) int16_t warp;
@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic, strong) NuTurn *turn;

@end
