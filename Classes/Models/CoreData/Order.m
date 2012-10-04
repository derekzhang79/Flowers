#import "Order.h"

@implementation Order

// Custom logic goes here.

+ (EntityDAO *)dao {
    return [[[EntityDAO alloc] initWithEntityName:@"Order"] autorelease];
}

+ (id)createOne {
    return (Order *)[[Order dao] createOne];
}

+ (Order *)findOneWithUID:(NSString *)uid {
    return (Order *)[[Order dao] findOneWithUID:uid];
}

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    return [[Order dao] findAllWithUIDArray:uidsArray];
}

+ (NSArray *)findAll {
    return [[Order dao] findAll];
}

+ (void)deleteAll {
    [[Order dao] deleteAll];
}


@end
