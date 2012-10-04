//
//  Item.h
//  Flowers
//
//  Created by admin on 25.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EntityDAO.h"
#import "CoreDataStack.h"

@class City, Group, OrderedItem;

@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * images;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSNumber * serverId;
@property (nonatomic, retain) Group *group;
@property (nonatomic, retain) OrderedItem *orderedItem;
@property (nonatomic, retain) City *city;

+ (EntityDAO *)dao;

+ (id)createOne;

+ (Item *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;
+ (NSArray *)findAllWithCity:(City *)city andGroup:(Group *)group;

+ (void)deleteAll;

@end
