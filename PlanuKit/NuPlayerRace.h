//
//  NuPlayerRace.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/31/11.
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

@interface NuPlayerRace : NSObject
{
    NSString* adjective;
    NSInteger freeFighters;
    NSInteger groundAttack;
    NSInteger groundDefense;
    NSInteger raceId;
    NSInteger miningRate;
    NSString* name;
    NSString* shortName;
    NSInteger taxRate;
}

@property (nonatomic, retain) NSString* adjective;
@property (nonatomic, assign) NSInteger freeFighters;
@property (nonatomic, assign) NSInteger groundAttack;
@property (nonatomic, assign) NSInteger groundDefense;
@property (nonatomic, assign) NSInteger raceId;
@property (nonatomic, assign) NSInteger miningRate;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* shortName;
@property (nonatomic, assign) NSInteger taxRate;

- (void)loadFromDict:(NSDictionary*)input;

@end
