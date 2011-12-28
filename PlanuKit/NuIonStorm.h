//
//  NuIonStorm.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/24/11.
//  Copyright 2011 Roboboogie Studios. All rights reserved.
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

@interface NuIonStorm : NSObject
{
    NSInteger heading;
    NSInteger ionStormId;
    BOOL isGrowing;
    NSInteger radius;
    NSInteger voltage;
    NSInteger warp;
    NSInteger x;
    NSInteger y;
}

@property (nonatomic, assign) NSInteger heading;
@property (nonatomic, assign) NSInteger ionStormId;
@property (nonatomic, assign) BOOL isGrowing;
@property (nonatomic, assign) NSInteger radius;
@property (nonatomic, assign) NSInteger voltage;
@property (nonatomic, assign) NSInteger warp;
@property (nonatomic, assign) NSInteger x;
@property (nonatomic, assign) NSInteger y;

- (void)loadFromDict:(NSDictionary*)input;

@end
