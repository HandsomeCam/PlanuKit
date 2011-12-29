//
//  NuGameSettings.m
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

#import "NuGameSettings.h"

@implementation NuGameSettings
 

@synthesize buildQueuePlanetId, cloakFail, debrisDiskPercent;
@synthesize discussionId, hostCompleted, hostStart, settingsId;
@synthesize mapHeight, mapWidth, maxAllies, maxIonCloudsPerStorm;
@synthesize maxIonStorms, gameName, nebulas, nextHost, nuIonStorms;
@synthesize numberOfPlanets, planetScanRange, roundMap, shipScanRange;
@synthesize stars, structureDecayRate, teamSize, turn, uniqueRaces;
@synthesize victoryCountdown;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (BOOL)loadFromDict:(NSDictionary*)input
{
    NSDateFormatter* df = [[[NSDateFormatter alloc] init] autorelease];
    
    self.buildQueuePlanetId = [[input objectForKey:@"buildqueueplanetid"] intValue];
    self.cloakFail = [[input objectForKey:@"cloakfail"] intValue];
    self.debrisDiskPercent = [[input objectForKey:@"debrisdiskpercent"] intValue];
    self.discussionId = [input objectForKey:@"discussionid"];
    self.hostCompleted = [df dateFromString:[input objectForKey:@"hostcompleted"]];
    self.hostStart = [df dateFromString:[input objectForKey:@"hoststart"]];
    self.settingsId = [[input objectForKey:@"id"] intValue];

    self.mapHeight = [[input objectForKey:@"mapheight"] intValue];
    self.mapWidth = [[input objectForKey:@"mapwidth"] intValue];

    self.maxAllies = [[input objectForKey:@"maxalliest"] intValue];
    self.maxIonCloudsPerStorm = [[input objectForKey:@"maxioncloudsperstorm"] intValue];
    self.maxIonStorms = [[input objectForKey:@"maxions"] intValue];
    self.gameName = [input objectForKey:@"name"];
    self.nebulas = [[input objectForKey:@"nebulas"] intValue];
    self.nextHost = [df dateFromString:[input objectForKey:@"nexthost"]];
    self.nuIonStorms = [[input objectForKey:@"nuionstorms"] intValue];
    self.numberOfPlanets = [[input objectForKey:@"numplanets"] intValue];
    self.planetScanRange = [[input objectForKey:@"planetscanrange"] intValue];
    self.roundMap = [[input objectForKey:@"roundmap"] boolValue];
    self.shipScanRange = [[input objectForKey:@"shipscanrange"] intValue];
    self.stars = [[input objectForKey:@"stars"] intValue];
    self.structureDecayRate = [[input objectForKey:@"structuredecayrate"] intValue];
    self.teamSize = [[input objectForKey:@"teamsize"] intValue];
    self.turn = [[input objectForKey:@"turn"] intValue];
    self.uniqueRaces = [[input objectForKey:@"uniqueraces"] intValue];
    self.victoryCountdown = [[input objectForKey:@"victorycountdown"] intValue];
    
    return YES;
}

@end
