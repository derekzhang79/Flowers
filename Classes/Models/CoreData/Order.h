#import "_Order.h"
#import "EntityDAO.h"
#import "CoreDataStack.h"

@interface Order : _Order {}
// Custom logic goes here.

+ (EntityDAO *)dao;

+ (id)createOne;

+ (Order *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;

+ (void)deleteAll;

@end
