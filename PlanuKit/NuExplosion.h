//
//  NuExplosion.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 2/19/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuTurn;

@interface NuExplosion : NSManagedObject

@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t turnNumber;
@property (nonatomic, retain) NuTurn *turn;

@end
