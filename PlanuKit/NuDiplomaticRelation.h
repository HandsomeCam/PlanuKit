//
//  NuDiplomaticRelation.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/31/11.
//  Copyright 2011 Roboboogie Studios. All rights reserved.
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

typedef enum
{
    kNuDiplomaticRelationNone               = 0,
    kNuDiplomaticRelationOpenCommunication  = 1,
    kNuDiplomaticRelationSafePassage        = 2,
    kNuDiplomaticRelationShareIntel         = 3,
    kNuDiplomaticRelationFullAlliance       = 4,
    kNuDiplomaticRelationBlockCommunication = 5,
} NuRelationshipStatus;

@interface NuDiplomaticRelation : NSObject
{
    NSInteger conflictLevel;
    NSInteger relationId;
    NSInteger playerId;
    NSInteger playerToId;
    NSInteger relationTo;
    NSInteger relationFrom;
}

@property (nonatomic, assign) NSInteger conflictLevel;
@property (nonatomic, assign) NSInteger relationId;
@property (nonatomic, assign) NSInteger playerId;
@property (nonatomic, assign) NSInteger playerToId;
@property (nonatomic, assign) NSInteger relationTo;
@property (nonatomic, assign) NSInteger relationFrom;

- (void)loadFromDict:(NSDictionary*)input;

@end
