//
//  NuStarbase.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class NuPlanet, NuTurn;

@interface NuStarbase : NSManagedObject

@property (nonatomic) int16_t planetId;
@property (nonatomic, strong) NuPlanet *planet;
@property (nonatomic, strong) NuTurn *turn;

@end
