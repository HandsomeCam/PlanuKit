//
//  NuDataManager.h
//  PlanuKit
//
//  Created by Cameron Hotchkies on 1/21/12.
//  Copyright (c) 2012 Srs Biznas, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
 
extern NSString * const DataManagerDidSaveNotification;
extern NSString * const DataManagerDidSaveFailedNotification;

@interface NuDataManager : NSObject
{
}

@property (nonatomic, readonly, strong) NSManagedObjectModel *objectModel;
@property (nonatomic, readonly, strong) NSManagedObjectContext *mainObjectContext;
@property (nonatomic, readonly, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (NuDataManager*)sharedInstance;
- (BOOL)save;
- (NSManagedObjectContext*)managedObjectContext;

@end