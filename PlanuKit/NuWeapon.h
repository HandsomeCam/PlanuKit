//
//  NuWeapon.h
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


@interface NuWeapon : NSManagedObject

@property (nonatomic) int16_t cost;
@property (nonatomic) int16_t crewKill;
@property (nonatomic) int16_t damage;
@property (nonatomic) int16_t duranium;
@property (nonatomic) int16_t mass;
@property (nonatomic) int16_t molybdenum;
@property (nonatomic, strong) NSString * name;
@property (nonatomic) int16_t techLevel;
@property (nonatomic) int16_t tritanium;

- (void)updateWithJson:(NSDictionary*)input;

@end
