//
//  NuScore+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 2/6/12.
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

#import "NuScore+Functionality.h"

@implementation NuScore (Functionality)

+ (NuScore*)scoreFromJson:(NSDictionary*)input
              withContext:(NSManagedObjectContext*)context
{
    NuScore* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuScore"
                                  inManagedObjectContext:context];
    
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    
    retVal.capitalShips = [[input objectForKey:@"capitalships"] intValue];
    retVal.dateAdded = [[df dateFromString:[input objectForKey:@"dateadded"]] timeIntervalSince1970];
    retVal.freighters = [[input objectForKey:@"freighters"] intValue];
    retVal.scoreId = [[input objectForKey:@"id"] intValue];
    retVal.inventoryScore = [[input objectForKey:@"inventoryscore"] intValue];
    retVal.militaryScore = [[input objectForKey:@"militaryscore"] intValue];
    retVal.ownerId = [[input objectForKey:@"ownerid"] intValue];
    retVal.percent = [[input objectForKey:@"percent"] doubleValue];
    retVal.planets = [[input objectForKey:@"planets"] intValue];
    retVal.priorityPoints = [[input objectForKey:@"prioritypoints"] intValue];
    retVal.starbases = [[input objectForKey:@"starbases"] intValue]; 
    retVal.turnNumber = [[input objectForKey:@"turn"] intValue];
    
    return retVal;
}

@end
