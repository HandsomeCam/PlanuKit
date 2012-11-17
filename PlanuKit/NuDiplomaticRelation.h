//
//  NuDiplomaticRelation.h
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

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef enum
{
    kNuDiplomaticRelationNone               = 0,
    kNuDiplomaticRelationOpenCommunication  = 1,
    kNuDiplomaticRelationSafePassage        = 2,
    kNuDiplomaticRelationShareIntel         = 3,
    kNuDiplomaticRelationFullAlliance       = 4,
    kNuDiplomaticRelationBlockCommunication = 5,
} NuRelationshipStatus;


@class NuPlayer, NuTurn;

@interface NuDiplomaticRelation : NSManagedObject

@property (nonatomic) int16_t conflictLevel;
@property (nonatomic) int32_t relationId;
@property (nonatomic) int32_t playerId;
@property (nonatomic) int32_t playerToId;
@property (nonatomic) int16_t relationTo;
@property (nonatomic) int16_t relationFrom;
@property (nonatomic, retain) NuPlayer *playerFrom;
@property (nonatomic, retain) NuPlayer *playerTo;
@property (nonatomic, retain) NuTurn *turn;


+ (NuDiplomaticRelation*)diplomaticRelationFromJson:(NSDictionary*)input 
                                        withContext:(NSManagedObjectContext*)context;

@end
