//
//  AbstractDAO.m
//  CoreData
//
//  Created by Arty on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EntityDAO.h"
#import "CoreDataStack.h"

#import "NSDictionary+Extensions.h"

@interface EntityDAO ()
@property (nonatomic, retain) NSString *entityName;
@property (nonatomic, retain) NSEntityDescription *entityDescription;
@end

@implementation EntityDAO

@synthesize entityName = _entityName;
@synthesize entityDescription = _entityDescription;

- (id)initWithEntityClass:(Class)clazz {
    return [self initWithEntityName:NSStringFromClass(clazz)];
}

- (id)initWithEntityName:(NSString *)entityName {
    self = [super init];
    if (self) {
        self.entityName = entityName;
        NSManagedObjectContext *context = [[CoreDataStack sharedInstance] contextForCurrentThread];
        self.entityDescription = [NSEntityDescription entityForName:self.entityName
                                             inManagedObjectContext:context];
    }
    return self;
}

- (void)dealloc {
    self.entityName = nil;
    self.entityDescription = nil;
    
    [super dealloc];
}

- (id)createOne {
    NSManagedObjectContext *context = [[CoreDataStack sharedInstance] contextForCurrentThread];    
    return [[[NSManagedObject alloc] initWithEntity:self.entityDescription
                    insertIntoManagedObjectContext:context] autorelease];
}

- (id)findOneWithUID:(NSString *)uid {
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    [request setEntity:self.entityDescription];
//    [request setReturnsObjectsAsFaults:NO];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"serverId == %@", uid];
    [request setPredicate:predicate];    
    
    NSArray *array = [[CoreDataStack sharedInstance] executeRequest:request];
    if ((array == nil) || ([array count] == 0)) {
        return nil;
    } else {
        return [array objectAtIndex:0];
    }
}

- (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    [request setEntity:self.entityDescription];
//    [request setReturnsObjectsAsFaults:NO];
    [request setPredicate:[NSPredicate predicateWithFormat: @"(serverId IN %@)", uidsArray]];
    
    NSArray *array = [[CoreDataStack sharedInstance] executeRequest:request];
    if ((array == nil) || ([array count] == 0)) {
        return nil;
    } else {
        return array;
    }
}

- (NSArray *)findAllWithPredicate:(NSPredicate *)predicate {
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    [request setEntity:self.entityDescription];
    [request setPredicate:predicate];    
    
    // !!! HARDCODED !!!
    if ([[[self.entityDescription propertiesByName] allKeys] containsObject:@"order"]) {
        NSSortDescriptor *sortByOrder = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sortByOrder]];
        [sortByOrder release];
    } 
    
    NSArray *array = [[CoreDataStack sharedInstance] executeRequest:request];
    if ((array == nil) || ([array count] == 0)) {
        return nil;
    } else {
        return array;
    }
}

- (NSArray *)findAllWithCriteria:(NSDictionary *)criteria {
    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    [request setEntity:self.entityDescription];
//    [request setReturnsObjectsAsFaults:NO];
    
    if (criteria != nil) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:[criteria toCoreDataRequestString]];
        [request setPredicate:predicate];    
    }

    // !!! HARDCODED !!!
    if ([[[self.entityDescription propertiesByName] allKeys] containsObject:@"order"]) {
        NSSortDescriptor *sortByOrder = [[NSSortDescriptor alloc] initWithKey:@"order" ascending:YES];
        [request setSortDescriptors:[NSArray arrayWithObject:sortByOrder]];
        [sortByOrder release];
    } 
    
    NSArray *array = [[CoreDataStack sharedInstance] executeRequest:request];
    if ((array == nil) || ([array count] == 0)) {
        return nil;
    } else {
        return array;
    }
}

- (NSArray *)findAll {
    return [self findAllWithCriteria:nil];
}

- (void)deleteOneWithUID:(NSString *)uid {
    NSManagedObjectContext *context = [[CoreDataStack sharedInstance] contextForCurrentThread];        
    NSManagedObject *target = [self findOneWithUID:uid];
    if (target == nil) {
        return;
    }
    [context deleteObject:target];
}

- (void)deleteAll {
    NSManagedObjectContext *context = [[CoreDataStack sharedInstance] contextForCurrentThread];        
    NSArray *objects = [self findAll];    
    for (NSManagedObject *current in objects) {
            [context deleteObject:current];    
    }
}

@end
