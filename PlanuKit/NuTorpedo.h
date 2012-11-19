//
//  NuTorpedo.h
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
#import "NuWeapon.h"

@class NuTurn;

@interface NuTorpedo : NuWeapon

@property (nonatomic) int16_t torpedoId;
@property (nonatomic, strong) NSSet *ships;
@property (nonatomic, strong) NuTurn *turn;
@end

@interface NuTorpedo (CoreDataGeneratedAccessors)

- (void)addShipsObject:(NuTurn *)value;
- (void)removeShipsObject:(NuTurn *)value;
- (void)addShips:(NSSet *)values;
- (void)removeShips:(NSSet *)values;

+ (NuTorpedo*)torpedoFromJson:(NSDictionary*)input
                  withContext:(NSManagedObjectContext*)context;
@end
