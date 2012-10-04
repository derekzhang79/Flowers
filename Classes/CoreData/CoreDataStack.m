
//  CoreDataUtils.m
//  CoreData
//
//  Created by Arty on 5/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CoreDataStack.h"
#import "AppDelegate.h"

#define PERSISTENCE_STORE_URL @"Flowers.sqlite"
#define MODEL_NAME @"Flowers"

static CoreDataStack* _instance = nil;

@interface CoreDataStack ()
@property (nonatomic, retain) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@property (nonatomic, retain) NSMutableDictionary *contextPool;

- (id)init;
- (NSPersistentStoreCoordinator *)createPersistentStoreCoordinator;
@end

@implementation CoreDataStack

@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize contextPool = _contextPool;

+ (id)sharedInstance {
    @synchronized(self) {
        if (_instance == nil) {
            _instance = [[[self class] alloc] init];
        }
    }
    return _instance;
}

- (NSUInteger)retainCount {
    return NSUIntegerMax;
}

- (id)init {
    self = [super init];
    if (self) {
        self.persistentStoreCoordinator = [self createPersistentStoreCoordinator];
        assert(self.persistentStoreCoordinator != nil);
        
        self.contextPool = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return self;
}

- (void)dealloc {
    [_persistentStoreCoordinator release];
    [_contextPool release];

    [super dealloc];
}

#pragma mark - 
#pragma mark PSC

- (NSPersistentStoreCoordinator *)createPersistentStoreCoordinator {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:MODEL_NAME withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    
    NSURL *storeURL = [ApplicationDirectoryURL(NSDocumentDirectory) URLByAppendingPathComponent:PERSISTENCE_STORE_URL];
    NSError *error = nil;
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
                             [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
                             [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    
    NSPersistentStore *store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    if (store==nil) {
        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
        [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:&error];
    }
    
    return coordinator;
}


#pragma mark - 
#pragma mark Managing context and coordinator

- (NSPersistentStoreCoordinator *)sharedCoordinator {
    return self.persistentStoreCoordinator;
}

- (NSManagedObjectContext *)contextForThread:(NSThread *)thread {
    NSManagedObjectContext* context = [self.contextPool objectForKey:[NSNumber numberWithInt:[thread hash]]];
    if (context == nil) {
        context = [[NSManagedObjectContext alloc] init];
        [context setPersistentStoreCoordinator:self.persistentStoreCoordinator];
        [context setUndoManager:nil];
        [context setMergePolicy:NSOverwriteMergePolicy];
        
        [self.contextPool setObject:context forKey:[NSNumber numberWithInt:[thread hash]]];
    }
    assert(context != nil);
    return context;
}

- (NSManagedObjectContext *)contextForCurrentThread {
    return [self contextForThread:[NSThread currentThread]];
}

- (void)releaseContextForThread:(NSThread *)thread {
    [self.contextPool removeObjectForKey:[NSNumber numberWithInt:[thread hash]]];
}

- (void)releaseContextForCurrentThread {
    [self releaseContextForThread:[NSThread currentThread]];
}

#pragma mark - 
#pragma mark Utils

- (id)executeRequest:(NSFetchRequest *)request inContext:(NSManagedObjectContext *)context {
    NSError *error = nil;
    id toReturn = [context executeFetchRequest:request error:&error];
    if (error != nil) {
        NSLog(@"Core data request error: %@", [error description]);
        return nil;
    } else {
        return toReturn;
    }
}

- (id)executeRequest:(NSFetchRequest *)request {
    return [self executeRequest:request inContext:[self contextForCurrentThread]];
}

- (void)saveContext:(NSManagedObjectContext *)context {
    [self.persistentStoreCoordinator lock];
    NSError *error = nil;
    if (context != nil) {
        if ([context hasChanges] && ![context save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
    [self.persistentStoreCoordinator unlock];    
}

- (void)saveContextForCurrentThread {
    [self saveContext:[self contextForCurrentThread]];
}

@end