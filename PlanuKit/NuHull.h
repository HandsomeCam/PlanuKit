//
//  NuHull.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuShip, NuTurn;

@interface NuHull : NSManagedObject

@property (nonatomic) int16_t beams;
@property (nonatomic) BOOL canCloak;
@property (nonatomic) int16_t cargo;
@property (nonatomic) int16_t cost;
@property (nonatomic) int16_t crew;
@property (nonatomic, strong) NSString * descr;
@property (nonatomic) int16_t duranium;
@property (nonatomic) int16_t engines;
@property (nonatomic) int16_t fighterBays;
@property (nonatomic) int16_t fuel;
@property (nonatomic) int16_t hullId;
@property (nonatomic) int16_t mass;
@property (nonatomic) int16_t molybdenum;
@property (nonatomic, strong) NSString * name;
@property (nonatomic) int32_t specialAbility;
@property (nonatomic) int16_t techLevel;
@property (nonatomic) int16_t torpedoes;
@property (nonatomic) int16_t tritanium;
@property (nonatomic, strong) NSSet *ships;
@property (nonatomic, strong) NuTurn *turn;
@end

@interface NuHull (CoreDataGeneratedAccessors)

- (void)addShipsObject:(NuShip *)value;
- (void)removeShipsObject:(NuShip *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

@end
