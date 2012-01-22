//
//  NuTorpedo.m
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

#import "NuTorpedo.h"
#import "NuTurn.h"


@implementation NuTorpedo

@dynamic torpedoId;
@dynamic ships;
@dynamic turn;

+ (NuTorpedo*)torpedoFromJson:(NSDictionary*)input
                  withContext:(NSManagedObjectContext*)context
{
    NuTorpedo* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuTorpedo"
                                  inManagedObjectContext:context];
    
    [retVal updateWithJson:input];
    
    retVal.torpedoId = [[input objectForKey:@"id"] intValue];
    
    // torpedos have cost named oddly
    retVal.cost = [[input objectForKey:@"launchercost"] intValue];
    
    return retVal;
}

@end
