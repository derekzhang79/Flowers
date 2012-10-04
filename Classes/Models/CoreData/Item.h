#import "_Item.h"
#import "EntityDAO.h"
#import "CoreDataStack.h"

@class City, Group, OrderedItem;

@interface Item : _Item {}
// Custom logic goes here.

+ (EntityDAO *)dao;

+ (id)createOne;

+ (Item *)findOneWithUID:(NSString *)uid;

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
+ (NSArray *)findAll;
+ (NSArray *)findAllWithCity:(City *)city andGroup:(Group *)group;
+ (NSArray *)findAllInBasket;
+ (NSArray *)findAllInFavs;

+ (void)deleteAll;

- (void)populateWithDictionary:(NSDictionary *)dict;

@end
