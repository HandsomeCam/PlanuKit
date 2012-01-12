//
//  NuTurn.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/23/11.
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
#import "NuGameSettings.h"
#import "NuPlayer.h"

@interface NuTurn : NSObject
{
    NSArray* planets;
    NuGameSettings* gameSettings;
    NuPlayer* player;
    NSArray* ionStorms;
    NSArray* ships;
    NSArray* playerMessages;
    NSArray* systemMessages;
    NSArray* diplomaticRelations;
    NSArray* players;
    NSArray* races;
    NSArray* minefields;
}

@property (nonatomic, retain) NSArray* planets;
@property (nonatomic, retain) NuGameSettings* gameSettings;
@property (nonatomic, retain) NuPlayer* player;
@property (nonatomic, retain) NSArray* ionStorms;
@property (nonatomic, retain) NSArray* ships;
@property (nonatomic, retain) NSArray* playerMessages;
@property (nonatomic, retain) NSArray* systemMessages;
@property (nonatomic, retain) NSArray* diplomaticRelations;
@property (nonatomic, retain) NSArray* players;
@property (nonatomic, retain) NSArray* races;
@property (nonatomic, retain) NSArray* minefields;

-(BOOL)loadFromDict:(NSDictionary*)input;
-(void)calculateShipPlanetDistances;

-(NuPlayer*)playerForId:(NSInteger)playerId;

@end
