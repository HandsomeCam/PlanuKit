//
//  NuPlayerRace.m
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

#import "NuPlayerRace.h"
#import "NuPlayer.h"
#import "NuTurn.h"


@implementation NuPlayerRace

@dynamic adjective;
@dynamic freeFighters;
@dynamic groundAttack;
@dynamic groundDefense;
@dynamic miningRate;
@dynamic name;
@dynamic raceId;
@dynamic shortName;
@dynamic taxRate;
@dynamic player;
@dynamic turn;

+ (NuPlayerRace*)raceFromJson:(NSDictionary*)input 
                  withContext:(NSManagedObjectContext*)context
{
    NuPlayerRace* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuPlayerRace"
                                  inManagedObjectContext:context];
    
    retVal.adjective = [input objectForKey:@"adjective"]; 
    retVal.freeFighters = [[input objectForKey:@"freefighters"] intValue];
    retVal.groundAttack = [[input objectForKey:@"groundattack"] intValue];
    retVal.groundDefense = [[input objectForKey:@"grounddefense"] intValue];
    retVal.raceId = [[input objectForKey:@"id"] intValue];
    retVal.miningRate = [[input objectForKey:@"miningrate"] intValue];
    retVal.name = [input objectForKey:@"name"];
    retVal.shortName = [input objectForKey:@"shortname"];
    retVal.taxRate = [[input objectForKey:@"taxrate"] intValue];

    return retVal;
}

@end
