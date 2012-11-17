//
//  NuStarbase+Functionality.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/24/12.
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

#import "NuStarbase+Functionality.h"

@implementation NuStarbase (Functionality)

+ (NuStarbase*)starbaseFromJson:(NSDictionary*)input 
                    withContext:(NSManagedObjectContext*)context
{
    NuStarbase* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuStarbase"
                                  inManagedObjectContext:context];
    retVal.planetId = [[input objectForKey:@"planetid"] intValue];
    
    return retVal;
}

@end
