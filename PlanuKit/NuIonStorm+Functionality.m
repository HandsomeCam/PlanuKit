//
//  NuIonStorm+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
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

#import "NuIonStorm+Functionality.h"

@implementation NuIonStorm (Functionality)

+ (NuIonStorm*)stormFromJson:(NSDictionary*)input 
                 withContext:(NSManagedObjectContext*)context
{
    NuIonStorm* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuIonStorm"
                                  inManagedObjectContext:context];
    
    retVal.heading = [[input objectForKey:@"heading"] intValue];
    retVal.ionStormId = [[input objectForKey:@"id"] intValue];
    retVal.isGrowing = [[input objectForKey:@"isgrowing"] boolValue];
    retVal.radius = [[input objectForKey:@"radius"] intValue];
    retVal.voltage = [[input objectForKey:@"voltage"] intValue];
    retVal.warp = [[input objectForKey:@"warp"] intValue];
    retVal.x = [[input objectForKey:@"x"] intValue];
    retVal.y = [[input objectForKey:@"y"] intValue];
    
    return retVal;
}

@end
