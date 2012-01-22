//
//  NuGame.m
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

#import "NuGame.h"
#import "NuGameSettings.h"

@implementation NuGame

@dynamic gameId;
@dynamic name;
@dynamic settings;

+ (NuGame*)gameFromJson:(NSDictionary*)input
            withContext:(NSManagedObjectContext*)context
{
    NuGame* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuGame"
                                  inManagedObjectContext:context];
    retVal.name = [input objectForKey:@"name"];
    
    retVal.gameId = [[input objectForKey:@"id"] intValue];
    
    retVal.settings = [NuGameSettings settingsFromJson:[input objectForKey:@"settings"]
                                           withContext:context];
    
    return retVal;
}

@end
