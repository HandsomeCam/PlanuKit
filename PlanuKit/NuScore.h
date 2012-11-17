//
//  NuScore.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 2/6/12.
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

@class NuPlayer, NuTurn;

@interface NuScore : NSManagedObject

@property (nonatomic) int16_t capitalShips;
@property (nonatomic) NSTimeInterval dateAdded;
@property (nonatomic) int16_t freighters;
@property (nonatomic) int32_t scoreId;
@property (nonatomic) int32_t inventoryScore;
@property (nonatomic) int32_t militaryScore;
@property (nonatomic) int16_t ownerId;
@property (nonatomic) double percent;
@property (nonatomic) int16_t planets;
@property (nonatomic) int32_t priorityPoints;
@property (nonatomic) int16_t starbases;
@property (nonatomic) int32_t turnNumber;
@property (nonatomic, retain) NuPlayer *owner;
@property (nonatomic, retain) NuTurn *turn;

@end
