#import "_OrderedItem.h"
#import "EntityDAO.h"
#import "CoreDataStack.h"

@class Item, Order;

@interface OrderedItem : _OrderedItem {}
// Custom logic goes here.

+ (EntityDAO *)dao;

+ (id)createOne;

+ (OrderedItem *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;

+ (void)deleteAll;

@end
