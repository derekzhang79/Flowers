#import "City.h"
#import "Group.h"
#import "Item.h"

@implementation City

// Custom logic goes here.

+ (EntityDAO *)dao {
    return [[[EntityDAO alloc] initWithEntityName:@"City"] autorelease];
}

+ (id)createOne {
    return (City *)[[City dao] createOne];
}

+ (City *)findOneWithUID:(NSString *)uid {
    return (City *)[[City dao] findOneWithUID:uid];
}

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    return [[City dao] findAllWithUIDArray:uidsArray];
}

+ (NSArray *)findAll {
    return [[City dao] findAll];
}

+ (void)deleteAll {
    [[City dao] deleteAll];
}


@end
