//
//  NuMessage.m
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

#import "NuMessage.h"
#import "NuTurn.h"


@implementation NuMessage

@dynamic body;
@dynamic headline;
@dynamic messageId;
@dynamic messageType;
@dynamic ownerId;
@dynamic target;
@dynamic turnNumber;
@dynamic x;
@dynamic y;
@dynamic isPlayerMessage;
@dynamic turn;

+ (NuMessage*)messageFromJson:(NSDictionary*)input 
                  withContext:(NSManagedObjectContext*)context
{
    NuMessage* retVal =
    [NSEntityDescription insertNewObjectForEntityForName:@"NuMessage"
                                  inManagedObjectContext:context];
    
    retVal.body = [input objectForKey:@"body"];
    retVal.headline = [input objectForKey:@"headline"];
    retVal.messageId = [[input objectForKey:@"id"] intValue]; 
    retVal.messageType = [[input objectForKey:@"messagetype"] intValue];
    retVal.ownerId = [[input objectForKey:@"ownerid"] intValue]; 
    retVal.target = [[input objectForKey:@"target"] intValue]; 
    retVal.turnNumber = [[input objectForKey:@"turn"] intValue]; 
    retVal.x = [[input objectForKey:@"x"] intValue]; 
    retVal.y = [[input objectForKey:@"y"] intValue]; 

    
    return retVal;
}

@end
