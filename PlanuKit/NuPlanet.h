//
//  NuPlanet.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuPlayer, NuStarbase, NuTurn;

@interface NuPlanet : NSManagedObject

@property (nonatomic) int32_t clans;
@property (nonatomic) int32_t colonistsChange;
@property (nonatomic) int16_t colonyHappinessChange;
@property (nonatomic) int16_t colonyTaxRate;
@property (nonatomic) BOOL debrisDisk;
@property (nonatomic) int16_t defenseBuilt;
@property (nonatomic) int16_t defensePosts;
@property (nonatomic) int32_t defenseTarget;
@property (nonatomic) int32_t duranium;
@property (nonatomic) int16_t duraniumDensity;
@property (nonatomic) int32_t duraniumOnGround;
@property (nonatomic) int32_t duraniumTotal;
@property (nonatomic) int16_t factories;
@property (nonatomic) int16_t factoriesBuilt;
@property (nonatomic) int32_t factoriesTarget;
@property (nonatomic, retain) NSString * friendlyCode;
@property (nonatomic) int32_t infoTurn;
@property (nonatomic) BOOL isBuildingStarbase;
@property (nonatomic) int32_t megacredits;
@property (nonatomic) int16_t mines;
@property (nonatomic) int16_t minesBuilt;
@property (nonatomic) int32_t minesTarget;
@property (nonatomic) int32_t molybdenum;
@property (nonatomic) int16_t molybdenumDensity;
@property (nonatomic) int32_t molybdenumOnGround;
@property (nonatomic) int32_t molybdenumTotal;
@property (nonatomic, retain) NSString * name;
@property (nonatomic) int32_t nativeChange;
@property (nonatomic) int32_t nativeClans;
@property (nonatomic) int16_t nativeGovernment;
@property (nonatomic, retain) NSString * nativeGovernmentName;
@property (nonatomic) int16_t nativeHappiness;
@property (nonatomic) int16_t nativeHappinessChange;
@property (nonatomic) int16_t nativeRace;
@property (nonatomic, retain) NSString * nativeRaceName;
@property (nonatomic) int16_t nativeTaxRate;
@property (nonatomic) int32_t neutronium;
@property (nonatomic) int16_t neutroniumDensity;
@property (nonatomic) int32_t neutroniumOnGround;
@property (nonatomic) int32_t neutroniumTotal;
@property (nonatomic) int16_t planetId;
@property (nonatomic) int16_t readyStatus;
@property (nonatomic) int32_t suppliedSold;
@property (nonatomic) int32_t supplies;
@property (nonatomic) int16_t temperature;
@property (nonatomic) int32_t tritanium;
@property (nonatomic) int16_t tritaniumDensity;
@property (nonatomic) int32_t tritaniumOnGround;
@property (nonatomic) int32_t tritaniumTotal;
@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic) int16_t ownerId;
@property (nonatomic, retain) NuStarbase *starbase;
@property (nonatomic, retain) NuTurn *turn;
@property (nonatomic, retain) NuPlayer *owner;

@end
