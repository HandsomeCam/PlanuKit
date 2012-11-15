//
//  NuShipHistory.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 11/15/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuShip;

@interface NuShipHistory : NSManagedObject

@property (nonatomic) int32_t x;
@property (nonatomic) int32_t y;
@property (nonatomic, retain) NuShip *ship;

@end
