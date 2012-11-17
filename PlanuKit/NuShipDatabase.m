//
//  NuShipDatabase.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 12/26/11.
//  Copyright 2011 Srs Biznas, LLC. All rights reserved.
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

#import "NuShipDatabase.h"
#import "NuHull.h"

@implementation NuShipDatabase

@synthesize hulls;

static NuShipDatabase* instance;

- (id)init
{
    self = [super init];
    if (self) 
    {
        // Initialization code here.
        NSBundle* frameworkBundle = [NSBundle bundleForClass:[self class]];
        NSString* path = [frameworkBundle pathForResource:@"HullDatabase" ofType:@"plist"];
         
        NSMutableArray *hullDicts = [[[NSMutableDictionary alloc] initWithContentsOfFile:
                                      path] objectForKey:@"Ships"];
        
        
        
        NSMutableArray* h = [NSMutableArray array];
        for (NSDictionary* hullDict in hullDicts)
        {
            // TODO: this will need a context
//            NuHull* hull = [[[NuHull alloc] init] autorelease];
//            [hull loadFromDict:hullDict];
//            [h addObject:hull];
        }
        self.hulls = h;
    }
    
    return self;
}

+ (NuShipDatabase*)sharedDatabase
{
    @synchronized(self)
    {
        if (!instance)
        {
            instance = [[NuShipDatabase alloc] init]; 
        }
        
        return instance;
    }
}

@end
