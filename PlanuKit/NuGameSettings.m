//
//  NuGameSettings.m
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

#import "NuGameSettings.h"
#import "NuGame.h"
#import "NuTurn.h"


@implementation NuGameSettings

@dynamic buildQueuePlanetId;
@dynamic cloakFail;
@dynamic debrisDiskPercent;
@dynamic discussionId;
@dynamic hostCompleted;
@dynamic hostStart;
@dynamic settingsId;
@dynamic mapHeight;
@dynamic mapWidth;
@dynamic maxAllies;
@dynamic maxIonCloudsPerStorm;
@dynamic maxIonStorms;
@dynamic gameName;
@dynamic nebulas;
@dynamic nextHost;
@dynamic nuIonStorms;
@dynamic numberOfPlanets;
@dynamic planetScanRange;
@dynamic roundMap;
@dynamic shipScanRange;
@dynamic stars;
@dynamic structureDecayRate;
@dynamic teamSize;
@dynamic turnNumber;
@dynamic uniqueRaces;
@dynamic victoryCountdown;
@dynamic game;
@dynamic turn;

+ (NuGameSettings*)settingsFromJson:(NSDictionary*)input withContext:(NSManagedObjectContext*)context
{
    NuGameSettings* retVal =
        [NSEntityDescription insertNewObjectForEntityForName:@"NuGameSettings"
                                      inManagedObjectContext:context];
    

    
    NSDateFormatter* df = [[[NSDateFormatter alloc] init] autorelease];
    
    retVal.buildQueuePlanetId = [[input objectForKey:@"buildqueueplanetid"] intValue];
    retVal.cloakFail = [[input objectForKey:@"cloakfail"] intValue];
    retVal.debrisDiskPercent = [[input objectForKey:@"debrisdiskpercent"] intValue];
    retVal.discussionId = [input objectForKey:@"discussionid"];
    retVal.hostCompleted = [[df dateFromString:[input objectForKey:@"hostcompleted"]] timeIntervalSince1970];
    retVal.hostStart = [[df dateFromString:[input objectForKey:@"hoststart"]] timeIntervalSince1970];
    retVal.settingsId = [[input objectForKey:@"id"] intValue];
    
    retVal.mapHeight = [[input objectForKey:@"mapheight"] intValue];
    retVal.mapWidth = [[input objectForKey:@"mapwidth"] intValue];
    
    retVal.maxAllies = [[input objectForKey:@"maxalliest"] intValue];
    retVal.maxIonCloudsPerStorm = [[input objectForKey:@"maxioncloudsperstorm"] intValue];
    retVal.maxIonStorms = [[input objectForKey:@"maxions"] intValue];
    retVal.gameName = [input objectForKey:@"name"];
    retVal.nebulas = [[input objectForKey:@"nebulas"] intValue];
    retVal.nextHost = [[df dateFromString:[input objectForKey:@"nexthost"]] timeIntervalSince1970];
    retVal.nuIonStorms = [[input objectForKey:@"nuionstorms"] intValue];
    retVal.numberOfPlanets = [[input objectForKey:@"numplanets"] intValue];
    retVal.planetScanRange = [[input objectForKey:@"planetscanrange"] intValue];
    retVal.roundMap = [[input objectForKey:@"roundmap"] boolValue];
    retVal.shipScanRange = [[input objectForKey:@"shipscanrange"] intValue];
    retVal.stars = [[input objectForKey:@"stars"] intValue];
    retVal.structureDecayRate = [[input objectForKey:@"structuredecayrate"] intValue];
    retVal.teamSize = [[input objectForKey:@"teamsize"] intValue];
    retVal.turnNumber = [[input objectForKey:@"turn"] intValue];
    retVal.uniqueRaces = [[input objectForKey:@"uniqueraces"] intValue];
    retVal.victoryCountdown = [[input objectForKey:@"victorycountdown"] intValue];
    
    return retVal;
    
}

@end
