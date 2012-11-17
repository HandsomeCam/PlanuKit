//
//  NuShipTest.m
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/18/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import "NuShipTest.h"
#import "NuShip.h"

@implementation NuShipTest

- (void)setUp
{
    transwarp = [[NuEngine alloc] init];
    
    NSMutableDictionary* engDict = [NSMutableDictionary dictionary];
    [engDict setObject:[NSNumber numberWithInt:300] forKey:@"cost"];
    [engDict setObject:[NSNumber numberWithInt:16] forKey:@"duranium"];
    [engDict setObject:[NSNumber numberWithInt:9] forKey:@"id"];
    [engDict setObject:[NSNumber numberWithInt:35] forKey:@"molybdenum"];
    [engDict setObject:@"Transwarp Drive" forKey:@"name"];
    [engDict setObject:[NSNumber numberWithInt:10] forKey:@"techlevel"];
    [engDict setObject:[NSNumber numberWithInt:3] forKey:@"tritanium"];
    [engDict setObject:[NSNumber numberWithInt:100] forKey:@"warp1"]; 
    [engDict setObject:[NSNumber numberWithInt:400] forKey:@"warp2"];
    [engDict setObject:[NSNumber numberWithInt:900] forKey:@"warp3"];
    [engDict setObject:[NSNumber numberWithInt:1600] forKey:@"warp4"];
    [engDict setObject:[NSNumber numberWithInt:2500] forKey:@"warp5"];
    [engDict setObject:[NSNumber numberWithInt:3600] forKey:@"warp6"];
    [engDict setObject:[NSNumber numberWithInt:4900] forKey:@"warp7"];
    [engDict setObject:[NSNumber numberWithInt:6400] forKey:@"warp8"];
    [engDict setObject:[NSNumber numberWithInt:8100] forKey:@"warp9"];
    
    [transwarp loadFromDict:engDict];
}

- (void)tearDown
{
    [transwarp release];
    transwarp = nil;
}

// All code under test must be linked into the Unit Test bundle
- (void)testNextTurnDestWarp9
{
    NuShip* testCraft = [[NuShip alloc] init];
    NuHull* testHull = [[NuHull alloc] init];
   
    testCraft.engine = transwarp;
    testCraft.hull = testHull;
    testCraft.x = 100;
    testCraft.y = 100;
    testCraft.mass = 100;
    testCraft.neutronium = 100;
    testCraft.targetX = 132;
    testCraft.targetY = 132;
    testCraft.heading = 45;
    testCraft.warp = 9;
    
    
    NSPoint dest = [testCraft nextTurnDestination];
    
    NSLog(@"Headed to: %lf, %lf", dest.x, dest.y);
    
    STAssertTrue(dest.x == 132, @"Warp 9, 45 degrees: X is correct");
    STAssertTrue(dest.y == 132, @"Warp 9, 45 degrees: Y is correct");
    [testHull release];
    [testCraft release];
}

- (void)testNextTurnDestWarp3
{
    NuShip* testCraft = [[NuShip alloc] init];
    NuHull* testHull = [[NuHull alloc] init];
    
    testCraft.engine = transwarp;
    testCraft.hull = testHull;
    testCraft.x = 100;
    testCraft.y = 100;
    testCraft.mass = 100;
    testCraft.neutronium = 100;
    testCraft.targetX = 132;
    testCraft.targetY = 132;
    testCraft.heading = 45;
    testCraft.warp = 3;
    
    
    NSPoint dest = [testCraft nextTurnDestination];
    
    NSLog(@"Headed to: %lf, %lf", dest.x, dest.y);
    
    STAssertTrue(dest.x == 106, @"Warp 3, 45 degrees: X is correct");
    STAssertTrue(dest.y == 106, @"Warp 3, 45 degrees: Y is correct");
    
    [testHull release];
    [testCraft release];
}

- (void)testNextTurnDestWarp5
{
    NuShip* testCraft = [[NuShip alloc] init];
    NuHull* testHull = [[NuHull alloc] init];
    
    testCraft.engine = transwarp;
    testCraft.hull = testHull;
    testCraft.x = 100;
    testCraft.y = 100;
    testCraft.mass = 100;
    testCraft.neutronium = 100;
    testCraft.targetX = 110;
    testCraft.targetY = 190;
    testCraft.heading = 45;
    testCraft.warp = 5;
    
    
    NSPoint dest = [testCraft nextTurnDestination];
    
    NSLog(@"Headed to: %lf, %lf", dest.x, dest.y);
    
    STAssertTrue(dest.x == 102, @"Warp 5, # degrees: X is correct");
    STAssertTrue(dest.y == 124, @"Warp 5, # degrees: Y is correct");
    
    [testHull release];
    [testCraft release];
}

@end
