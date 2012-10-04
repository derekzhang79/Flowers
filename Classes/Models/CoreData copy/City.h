//
//  City.h
//  Flowers
//
//  Created by admin on 26.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EntityDAO.h"
#import "CoreDataStack.h"

@class Group, Item;

@interface City : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serverId;
@property (nonatomic, retain) NSSet *groups;
@property (nonatomic, retain) NSSet *items;
@end

@interface City (CoreDataGeneratedAccessors)

- (void)addGroupsObject:(Group *)value;
- (void)removeGroupsObject:(Group *)value;
- (void)addGroups:(NSSet *)values;
- (void)removeGroups:(NSSet *)values;

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

+ (EntityDAO *)dao;

+ (id)createOne;

+ (City *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;

+ (void)deleteAll;

@end
