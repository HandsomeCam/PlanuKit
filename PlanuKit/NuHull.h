//
//  NuHull.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/27/11.
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

#define kShipSpecialTerraform           1
#define kShipSpecialRadiationShielding  2
#define kShipSpecialTachyonDevice		4
#define kShipSpecialBioscanner			8
#define kShipSpecialNebulaScanner		16
#define kShipSpecialAdvancedCloak		32
#define kShipSpecialGloryDevice			64
#define kShipSpecialGambling			128
#define kShipSpecialGravitonic			256
#define kShipSpecialHyperjump			512
#define kShipSpecialWarpChunnel			1024
#define kShipSpecialImperialAssault		2048
#define kShipSpecialAdvancedBioscanner	4096
#define kShipSpecialAlchemy				8192
#define kShipSpecialRamscoop			16384

@interface NuHull : NSObject
{
    NSInteger hullId;
    NSInteger techLevel;
    NSString* name;
    NSInteger mass;
    NSInteger fuel;
    NSInteger cargo;
    NSInteger crew;
    NSInteger engines;
    NSInteger beams;
    NSInteger torpedoes;
    NSInteger fighterBays;
    NSInteger cost;
    NSInteger duranium;
    NSInteger tritanium;
    NSInteger molybdenum;
    BOOL canCloak;
    NSInteger specialAbility;
    NSString* description;
}

@property (nonatomic, assign) NSInteger hullId;
@property (nonatomic, assign) NSInteger techLevel;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, assign) NSInteger mass;
@property (nonatomic, assign) NSInteger fuel;
@property (nonatomic, assign) NSInteger cargo;
@property (nonatomic, assign) NSInteger crew;
@property (nonatomic, assign) NSInteger engines;
@property (nonatomic, assign) NSInteger beams;
@property (nonatomic, assign) NSInteger torpedoes;
@property (nonatomic, assign) NSInteger fighterBays;
@property (nonatomic, assign) NSInteger cost;
@property (nonatomic, assign) NSInteger duranium;
@property (nonatomic, assign) NSInteger tritanium;
@property (nonatomic, assign) NSInteger molybdenum;
@property (nonatomic, assign) BOOL canCloak;
@property (nonatomic, assign) NSInteger specialAbility;
@property (nonatomic, retain) NSString* description;

- (void)loadFromDict:(NSDictionary*)input;

@end
