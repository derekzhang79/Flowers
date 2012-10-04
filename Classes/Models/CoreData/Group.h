#import "_Group.h"
#import "EntityDAO.h"
#import "CoreDataStack.h"

@class City, Item;

@interface Group : _Group {}
// Custom logic goes here.

+ (EntityDAO *)dao;

+ (id)createOne;

+ (Group *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;
+ (NSArray *)findAllWithCity:(City *)city;

+ (void)deleteAll;

@end
