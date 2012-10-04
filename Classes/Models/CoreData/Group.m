#import "Group.h"
#import "City.h"
#import "Item.h"

@implementation Group

// Custom logic goes here.

+ (EntityDAO *)dao {
    return [[[EntityDAO alloc] initWithEntityName:@"Group"] autorelease];
}

+ (id)createOne {
    return (Group *)[[Group dao] createOne];
}

+ (Group *)findOneWithUID:(NSString *)uid {
    return (Group *)[[Group dao] findOneWithUID:uid];
}

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    return [[Group dao] findAllWithUIDArray:uidsArray];
}

+ (NSArray *)findAll {
    return [[Group dao] findAll];
}

+ (NSArray *)findAllWithCity:(City *)city {
    NSArray *mas = [[Group dao] findAllWithCriteria:[NSDictionary dictionaryWithObject:city.serverId.stringValue forKey:@"ANY city.serverId"]];
    return mas;
}

+ (void)deleteAll {
    [[Group dao] deleteAll];
}


@end
