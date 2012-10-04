//
//  Group.h
//  Flowers
//
//  Created by admin on 11.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EntityDAO.h"
#import "CoreDataStack.h"

@class City, Item;

@interface Group : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serverId;
@property (nonatomic, retain) NSSet *city;
@property (nonatomic, retain) NSSet *items;
@end

@interface Group (CoreDataGeneratedAccessors)

- (void)addCityObject:(City *)value;
- (void)removeCityObject:(City *)value;
- (void)addCity:(NSSet *)values;
- (void)removeCity:(NSSet *)values;

- (void)addItemsObject:(Item *)value;
- (void)removeItemsObject:(Item *)value;
- (void)addItems:(NSSet *)values;
- (void)removeItems:(NSSet *)values;

+ (EntityDAO *)dao;

+ (id)createOne;

+ (Group *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;
+ (NSArray *)findAllWithCity:(City *)city;

+ (void)deleteAll;

@end
