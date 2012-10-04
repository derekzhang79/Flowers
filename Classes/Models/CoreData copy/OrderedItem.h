//
//  OrderedItem.h
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EntityDAO.h"
#import "CoreDataStack.h"

@class Item, Order;

@interface OrderedItem : NSManagedObject

@property (nonatomic, retain) NSNumber * count;
@property (nonatomic, retain) Item *item;
@property (nonatomic, retain) Order *order;

+ (EntityDAO *)dao;

+ (id)createOne;

+ (OrderedItem *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;

+ (void)deleteAll;

@end
