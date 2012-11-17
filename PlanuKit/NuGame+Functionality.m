//
//  NuGame+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/21/12.
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

#import "NuGame+Functionality.h"
#import "NuGameSettings.h"
#import "NuDataManager.h"
#import "NuTurn.h"

@implementation NuGame (Functionality)

+ (NuGame*)gameFromJson:(NSDictionary*)input
            withContext:(NSManagedObjectContext*)context
{
    NuGame* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuGame"
                                  inManagedObjectContext:context];

 
    [retVal updateContents:input];
    // Settings don't appear to load with games
    //retVal.settings = [NuGameSettings settingsFromJson:[input objectForKey:@"settings"]
    //                                       withContext:context];
    
    return retVal;
}

+ (NSArray*)allGames
{
    NuDataManager* dm = [NuDataManager sharedInstance];
    NSError* error = nil;
    NSManagedObjectContext* context = [dm mainObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription 
                                   entityForName:@"NuGame" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest 
                                                                    error:&error];
    for (NuGame *info in fetchedObjects) {
        NSLog(@"Fetched Game: %@", [info valueForKey:@"name"]);
        
    }        
    [fetchRequest release];
    
    return fetchedObjects;
}

- (void)updateContents:(NSDictionary*)input
{
    NSDateFormatter* df = [[[NSDateFormatter alloc] init] autorelease];
    
    self.allTurnsIn = [[input objectForKey:@"allturnsin"] boolValue];
    self.createdBy = [input objectForKey:@"createdby"];
    self.dateCreated = 
    [[df dateFromString:[input objectForKey:@"datecreated"]] timeIntervalSince1970];
    self.dateEnded = 
    [[df dateFromString:[input objectForKey:@"dateended"]] timeIntervalSince1970];
    self.deleteDate = 
    [[df dateFromString:[input objectForKey:@"deletedate"]] timeIntervalSince1970];
    self.desc = [input objectForKey:@"description"];
    self.difficulty = [input objectForKey:@"difficulty"];
    self.fastStart = [[input objectForKey:@"faststart"] intValue];
    self.gameType = [[input objectForKey:@"gametype"] intValue];
    self.hostDays = [input objectForKey:@"hostdays"];
    self.hostTime = [input objectForKey:@"hosttime"];
    self.gameId = [[input objectForKey:@"id"] intValue];
    self.isHosting = [[input objectForKey:@"ishosting"] boolValue];
    self.isPrivate = [[input objectForKey:@"isprivate"] boolValue];
    self.lastBackupPath = [input objectForKey:@"lastbackuppath"];
    self.lastLoadedDate = 
    [[df dateFromString:[input objectForKey:@"lastloadeddate"]] timeIntervalSince1970];
    self.lastNotified = [[input objectForKey:@"lastnotified"] intValue];
    self.mapType = [[input objectForKey:@"maptype"] intValue];
    self.masterPlanetId = [[input objectForKey:@"masterplanetid"] intValue];
    self.maxLevelId = [[input objectForKey:@"maxlevelid"] intValue];
    self.name = [input objectForKey:@"name"];
    self.nextHost =
    [[df dateFromString:[input objectForKey:@"nexthost"]] timeIntervalSince1970];
    self.quadrant = [[input objectForKey:@"quadrant"] intValue];
    self.requiredLevelId = [[input objectForKey:@"requiredlevelid"] intValue];
    self.scenarioId = [[input objectForKey:@"scenarioid"] intValue];
    self.shortDesc = [input objectForKey:@"shortdescription"];
    self.slots = [[input objectForKey:@"slots"] intValue];
    self.slowHostDays = [input objectForKey:@"slowhostdays"];
    self.status = [[input objectForKey:@"status"] intValue];
    self.turnNumber = [[input objectForKey:@"turn"] intValue];
    self.turnsPerWeek = [[input objectForKey:@"turnsperweek"] intValue];
    self.turnStatus = [input objectForKey:@"turnstatus"];
    self.tutorialId = [[input objectForKey:@"tutorialid"] intValue];
    self.winCondition = [[input objectForKey:@"wincondition"] intValue];
    self.yearStarted = [[input objectForKey:@"yearstarted"] intValue];
}

- (NuTurn*)getTurnNumber:(NSInteger)turnNumber
{
    for (NuTurn* turn in self.turns)
    {
        if (turn.settings.turnNumber == turnNumber)
        {
            return turn;
        }
    }
    
    return nil;
}

- (NuTurn*)latestTurn
{
    NuTurn* retVal = nil;
    
    for (NuTurn* turn in self.turns)
    {
        if (retVal == nil || 
             turn.settings.turnNumber > retVal.settings.turnNumber)
        {
            retVal = turn;
        }
    }
        
    return retVal;
}

@end
