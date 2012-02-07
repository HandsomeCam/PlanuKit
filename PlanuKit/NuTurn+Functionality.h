//
//  NuTurn+Functionality.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/23/12.
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

#import "NuTurn.h"

@interface NuTurn (Functionality)

+ (NuTurn*)turnFromJson:(NSDictionary*)input 
            withContext:(NSManagedObjectContext*)context;

- (void)updateContents:(NSDictionary*)input 
           withContext:(NSManagedObjectContext*)context;

- (NSArray*)playerMessages;
- (NSArray*)systemMessages;

@end
