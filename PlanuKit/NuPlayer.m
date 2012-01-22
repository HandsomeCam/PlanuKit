//
//  NuPlayer.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/20/12.
//  Copyright (c) 2012 Roboboogie Studios. All rights reserved.
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

#import "NuPlayer.h"
#import "NuDiplomaticRelation.h"
#import "NuPlayerRace.h"
#import "NuShip.h"
#import "NuTurn.h"


@implementation NuPlayer

@dynamic email;
@dynamic finishRank;
@dynamic playerId;
@dynamic priorityPoints;
@dynamic raceId;
@dynamic saveKey;
@dynamic status;
@dynamic teamId;
@dynamic turnJoined;
@dynamic turnReady;
@dynamic turnsMissed;
@dynamic turnStatus;
@dynamic username;
@dynamic race;
@dynamic ships;
@dynamic turn;
@dynamic diplomaticRelationsFrom;
@dynamic diplomaticRelationsTo;

+ (NuPlayer*)playerFromJson:(NSDictionary*)input
                withContext:(NSManagedObjectContext*)context
{
    NuPlayer* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuPlayer"
                                  inManagedObjectContext:context];
 
    retVal.playerId = [[input objectForKey:@"id"] intValue];
    retVal.email = [input objectForKey:@"email"];
    retVal.finishRank = [[input objectForKey:@"finishrank"] intValue];
    retVal.priorityPoints = [[input objectForKey:@"prioritypoints"] intValue];
    retVal.raceId = [[input objectForKey:@"raceid"] intValue];
    retVal.saveKey = [input objectForKey:@"savekey"];
    retVal.status = [[input objectForKey:@"status"] intValue];
    retVal.teamId = [[input objectForKey:@"teamid"] intValue];
    retVal.turnJoined = [[input objectForKey:@"turnjoined"] intValue];
    retVal.turnReady = [[input objectForKey:@"turnready"] boolValue];
    retVal.turnsMissed = [[input objectForKey:@"turnsmissed"] intValue];
    retVal.turnStatus = [[input objectForKey:@"turnstatus"] intValue];
    retVal.username = [input objectForKey:@"username"];

    
    return retVal;
}
     
     

@end
