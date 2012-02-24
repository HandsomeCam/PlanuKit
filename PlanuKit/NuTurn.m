//
//  NuTurn.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 2/19/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
//

#import "NuTurn.h"
#import "NuBeam.h"
#import "NuDiplomaticRelation.h"
#import "NuEngine.h"
#import "NuExplosion.h"
#import "NuGame.h"
#import "NuGameSettings.h"
#import "NuHull.h"
#import "NuIonStorm.h"
#import "NuMessage.h"
#import "NuMinefield.h"
#import "NuPlanet.h"
#import "NuPlayer.h"
#import "NuPlayerRace.h"
#import "NuScore.h"
#import "NuShip.h"
#import "NuStarbase.h"
#import "NuTorpedo.h"


@implementation NuTurn

@dynamic beams;
@dynamic diplomaticRelations;
@dynamic engines;
@dynamic game;
@dynamic hulls;
@dynamic ionStorms;
@dynamic launchers;
@dynamic messages;
@dynamic minefields;
@dynamic planets;
@dynamic player;
@dynamic players;
@dynamic races;
@dynamic scores;
@dynamic settings;
@dynamic ships;
@dynamic starbases;
@dynamic explosions;

@end
