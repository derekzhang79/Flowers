#import "_City.h"
#import "EntityDAO.h"
#import "CoreDataStack.h"

@class Group, Item;

@interface City : _City {}
// Custom logic goes here.

+ (EntityDAO *)dao;

+ (id)createOne;

+ (City *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;

+ (void)deleteAll;

@end
