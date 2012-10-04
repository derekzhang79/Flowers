//
//  Order.h
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "EntityDAO.h"
#import "CoreDataStack.h"


@interface Order : NSManagedObject

@property (nonatomic, retain) NSString * buyerName;
@property (nonatomic, retain) NSDecimalNumber * buyerPhone;
@property (nonatomic, retain) NSDate * deliveringTimeFrom;
@property (nonatomic, retain) NSDate * deliveringTimeTo;
@property (nonatomic, retain) NSString * destination;
@property (nonatomic, retain) NSManagedObject *orderedItems;

+ (EntityDAO *)dao;

+ (id)createOne;

+ (Order *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;

+ (void)deleteAll;

@end
