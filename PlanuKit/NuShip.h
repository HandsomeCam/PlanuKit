//
//  NuShip.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/15/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuBeam, NuEngine, NuHull, NuPlayer, NuShip, NuShipHistory, NuTorpedo, NuTurn;

@interface NuShip : NSManagedObject

@property (nonatomic) int16_t ammo;
@property (nonatomic) int16_t bays;
@property (nonatomic) int16_t beamId;
@property (nonatomic) int16_t beams;
@property (nonatomic) int16_t clans;
@property (nonatomic) int16_t crew;
@property (nonatomic) int16_t damage;
@property (nonatomic) double distanceToClosestPlanet;
@property (nonatomic) int16_t duranium;
@property (nonatomic) int16_t enemy;
@property (nonatomic) int16_t engineId;
@property (nonatomic) int32_t experience;
@property (nonatomic, strong) NSString * friendlyCode;
@property (nonatomic) int16_t heading;
@property (nonatomic) int16_t hullId;
@property (nonatomic) int32_t infoTurn;
@property (nonatomic) BOOL isCloaked;
@property (nonatomic) int16_t mass;
@property (nonatomic) int16_t megacredits;
@property (nonatomic) int16_t mission;
@property (nonatomic) int16_t mission1targetId;
@property (nonatomic) int16_t mission2targetId;
@property (nonatomic) int16_t molybdenum;
@property (nonatomic, strong) NSString * name;
@property (nonatomic) int16_t neutronium;
@property (nonatomic) int16_t ownerId;
@property (nonatomic) int16_t readyStatus;
@property (nonatomic) int16_t shipId;
@property (nonatomic) int16_t supplies;
@property (nonatomic) int16_t targetX;
@property (nonatomic) int16_t targetY;
@property (nonatomic) int16_t torpedoId;
@property (nonatomic) int16_t torps;
@property (nonatomic) int16_t transferAmmo;
@property (nonatomic) int16_t transferClans;
@property (nonatomic) int16_t transferDuranium;
@property (nonatomic) int16_t transferMegacredits;
@property (nonatomic) int16_t transferMolybdenum;
@property (nonatomic) int16_t transferNeutronium;
@property (nonatomic) int16_t transferSupplies;
@property (nonatomic) int16_t transferTargetId;
@property (nonatomic) int16_t transferTargetType;
@property (nonatomic) int16_t transferTritanium;
@property (nonatomic) int16_t tritanium;
@property (nonatomic) int16_t turnKilled;
@property (nonatomic) int16_t turnNumber;
@property (nonatomic) int16_t warp;
@property (nonatomic) int16_t x;
@property (nonatomic) int16_t y;
@property (nonatomic, strong) NuBeam *beam;
@property (nonatomic, strong) NuEngine *engine;
@property (nonatomic, strong) NuHull *hull;
@property (nonatomic, strong) NuTorpedo *launcher;
@property (nonatomic, strong) NuShip *missionTarget1;
@property (nonatomic, strong) NuShip *missionTarget2;
@property (nonatomic, strong) NuPlayer *owner;
@property (nonatomic, strong) NuTurn *turn;
@property (nonatomic, strong) NSOrderedSet *history;
@end

@interface NuShip (CoreDataGeneratedAccessors)

- (void)insertObject:(NuShipHistory *)value inHistoryAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHistoryAtIndex:(NSUInteger)idx;
- (void)insertHistory:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHistoryAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHistoryAtIndex:(NSUInteger)idx withObject:(NuShipHistory *)value;
- (void)replaceHistoryAtIndexes:(NSIndexSet *)indexes withHistory:(NSArray *)values;
- (void)addHistoryObject:(NuShipHistory *)value;
- (void)removeHistoryObject:(NuShipHistory *)value;
- (void)addHistory:(NSOrderedSet *)values;
- (void)removeHistory:(NSOrderedSet *)values;
@end
