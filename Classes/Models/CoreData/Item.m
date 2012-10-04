#import "Item.h"
#import "City.h"
#import "Group.h"
#import "OrderedItem.h"

@implementation Item

// Custom logic goes here.

+ (EntityDAO *)dao {
    return [[[EntityDAO alloc] initWithEntityName:@"Item"] autorelease];
}

+ (id)createOne {
    return (Item *)[[Item dao] createOne];
}

+ (Item *)findOneWithUID:(NSString *)uid {
    return (Item *)[[Item dao] findOneWithUID:uid];
}

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    return [[Item dao] findAllWithUIDArray:uidsArray];
}

+ (NSArray *)findAll {
    return [[Item dao] findAll];
}

+ (NSArray *)findAllWithCity:(City *)city andGroup:(Group *)group{
    return [[Item dao] findAllWithCriteria:[NSDictionary dictionaryWithObjectsAndKeys:city.serverId.stringValue, @"city.serverId", group.serverId.stringValue, @"group.serverId", nil]];
}

+ (NSArray *)findAllInBasket {
    NSDictionary *criteriaDict = [NSDictionary dictionaryWithObject:@"YES" forKey:@"inBasket"];
    return [[Item dao] findAllWithCriteria:criteriaDict];
}

+ (NSArray *)findAllInFavs {
    NSDictionary *criteriaDict = [NSDictionary dictionaryWithObject:@"YES" forKey:@"inFavorites"];
    return [[Item dao] findAllWithCriteria:criteriaDict];
}

+ (void)deleteAll {
    [[Item dao] deleteAll];
}

- (void)populateWithDictionary:(NSDictionary *)dict
{
    self.name = [dict valueForKey:@"name"];
    self.serverId = [dict valueForKey:@"id"];
    self.price = [dict valueForKey:@"price"];
    self.rating = [dict valueForKey:@"rating"];
    self.inBasketValue = NO;
}

@end
