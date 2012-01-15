//
//  NuPlayer.m
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

#import "NuPlayer.h"

@implementation NuPlayer

@synthesize playerId, email, finishRank, priorityPoints;
@synthesize raceId, saveKey, status, teamId;
@synthesize turnJoined, turnReady, turnsMissed, turnStatus;
@synthesize username, race;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)loadFromDict:(NSDictionary*)input
{
    self.playerId = [[input objectForKey:@"id"] intValue];
    self.email = [input objectForKey:@"email"];
    self.finishRank = [[input objectForKey:@"finishrank"] intValue];
    self.priorityPoints = [[input objectForKey:@"prioritypoints"] intValue];
    self.raceId = [[input objectForKey:@"raceid"] intValue];
    self.saveKey = [input objectForKey:@"savekey"];
    self.status = [[input objectForKey:@"status"] intValue];
    self.teamId = [[input objectForKey:@"teamid"] intValue];
    self.turnJoined = [[input objectForKey:@"turnjoined"] intValue];
    self.turnReady = [[input objectForKey:@"turnready"] boolValue];
    self.turnsMissed = [[input objectForKey:@"turnsmissed"] intValue];
    self.turnStatus = [[input objectForKey:@"turnstatus"] intValue];
    self.username = [input objectForKey:@"username"];
}

@end
