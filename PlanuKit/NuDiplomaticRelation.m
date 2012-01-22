//
//  NuDiplomaticRelation.m
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

#import "NuDiplomaticRelation.h"
#import "NuPlayer.h"
#import "NuTurn.h"


@implementation NuDiplomaticRelation

@dynamic conflictLevel;
@dynamic relationId;
@dynamic playerId;
@dynamic playerToId;
@dynamic relationTo;
@dynamic relationFrom;
@dynamic playerFrom;
@dynamic playerTo;
@dynamic turn;


+ (NuDiplomaticRelation*)diplomaticRelationFromJson:(NSDictionary*)input 
                                        withContext:(NSManagedObjectContext*)context
{
    NuDiplomaticRelation* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuDiplomaticRelation"
                                  inManagedObjectContext:context];
    
    retVal.conflictLevel = [[input objectForKey:@"conflictlevel"] intValue];
    retVal.relationId = [[input objectForKey:@"id"] intValue];
    retVal.playerId = [[input objectForKey:@"playerid"] intValue];
    retVal.playerToId = [[input objectForKey:@"playertoid"] intValue];
    retVal.relationTo = [[input objectForKey:@"relationfrom"] intValue];
    retVal.relationFrom = [[input objectForKey:@"relationto"] intValue];


    return retVal;
}
@end
