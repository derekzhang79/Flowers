//
//  CoreDataUtils.h
//  CoreData
//
//  Created by Arty on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataStack : NSObject {
}

+ (id) sharedInstance;
- (NSUInteger)retainCount;

#pragma mark - 
#pragma mark Managing context and coordinator

- (NSPersistentStoreCoordinator *)sharedCoordinator;

- (NSManagedObjectContext *)contextForThread:(NSThread *)thread;
- (NSManagedObjectContext *)contextForCurrentThread;

- (void)releaseContextForThread:(NSThread *)thread;
- (void)releaseContextForCurrentThread;

#pragma mark - 
#pragma mark Utils

- (id)executeRequest:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context;
- (id)executeRequest:(NSFetchRequest *)request;

- (void)saveContext:(NSManagedObjectContext *)context;
- (void)saveContextForCurrentThread;

@end
