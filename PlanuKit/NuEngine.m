//
//  NuEngine.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/20/12.
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

#import "NuEngine.h"
#import "NuShip.h"
#import "NuTurn.h"


@implementation NuEngine

@dynamic cost;
@dynamic duranium;
@dynamic engineId;
@dynamic name;
@dynamic ship;
@dynamic turn;
@dynamic molybdenum;
@dynamic tritanium;
@dynamic techLevel;
@dynamic fuelFactor1;
@dynamic fuelFactor2;
@dynamic fuelFactor3;
@dynamic fuelFactor4;
@dynamic fuelFactor5;
@dynamic fuelFactor6;
@dynamic fuelFactor7;
@dynamic fuelFactor8;
@dynamic fuelFactor9;


+ (NuEngine*)engineFromJson:(NSDictionary*)input 
                withContext:(NSManagedObjectContext*)context
{
    NuEngine* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuEngine"
                                  inManagedObjectContext:context];
    
    retVal.cost = [[input objectForKey:@"cost"] intValue];
    retVal.duranium = [[input objectForKey:@"duranium"] intValue];
    retVal.engineId = [[input objectForKey:@"id"] intValue];
    retVal.molybdenum = [[input objectForKey:@"molybdenum"] intValue];
    retVal.name = [input objectForKey:@"name"];
    retVal.techLevel = [[input objectForKey:@"techlevel"] intValue];
    retVal.tritanium = [[input objectForKey:@"tritanium"] intValue];
    
    retVal.fuelFactor1 = [[input objectForKey:@"warp1"] intValue];
    retVal.fuelFactor2 = [[input objectForKey:@"warp2"] intValue];
    retVal.fuelFactor3 = [[input objectForKey:@"warp3"] intValue];
    retVal.fuelFactor4 = [[input objectForKey:@"warp4"] intValue];
    retVal.fuelFactor5 = [[input objectForKey:@"warp5"] intValue];
    retVal.fuelFactor6 = [[input objectForKey:@"warp6"] intValue];
    retVal.fuelFactor7 = [[input objectForKey:@"warp7"] intValue];
    retVal.fuelFactor8 = [[input objectForKey:@"warp8"] intValue];
    retVal.fuelFactor9 = [[input objectForKey:@"warp9"] intValue];
    
    return retVal;
}

- (NSInteger)fuelFactorForWarp:(NSInteger)warp
{
    if (warp == 1)
    {
        return self.fuelFactor1;
    }
    else if (warp == 2)
    {
        return self.fuelFactor2;
    }
    else if (warp == 3)
    {
        return self.fuelFactor3;
    }
    else if (warp == 4)
    {
        return self.fuelFactor4;
    }
    else if (warp == 5)
    {
        return self.fuelFactor5;
    }
    else if (warp == 6)
    {
        return self.fuelFactor6;
    }
    else if (warp == 7)
    {
        return self.fuelFactor7;
    }
    else if (warp == 8)
    {
        return self.fuelFactor8;
    }
    else if (warp == 9)
    {
        return self.fuelFactor9;
    }
    
    return 9999999;
}

@end
