//
//  NuMinefield.m
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

#import "NuMinefield.h"
#import "NuTurn.h"


@implementation NuMinefield

@dynamic friendlyCode;
@dynamic infoTurn;
@dynamic isWeb;
@dynamic minefieldId;
@dynamic radius;
@dynamic units;
@dynamic turn;

+ (NuMinefield*)minefieldFromJson:(NSDictionary*)input
                      withContext:(NSManagedObjectContext*)context
{
    NuMinefield* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuMinefield"
                                  inManagedObjectContext:context];
 
    retVal.x = [[input objectForKey:@"x"] intValue];
    retVal.y = [[input objectForKey:@"y"] intValue];
    retVal.ownerId = [[input objectForKey:@"ownerid"] intValue];
    retVal.friendlyCode = [input objectForKey:@"friendlycode"];
    retVal.minefieldId = [[input objectForKey:@"id"] intValue];
    retVal.infoTurn = [[input objectForKey:@"infoturn"] intValue];
    retVal.isWeb = [[input objectForKey:@"isweb"] boolValue];
    retVal.radius = [[input objectForKey:@"radius"] intValue];
    retVal.units = [[input objectForKey:@"units"] intValue];
    
    return retVal;
}

@end
