#import "OrderedItem.h"
#import "Item.h"
#import "Order.h"

@implementation OrderedItem

// Custom logic goes here.

+ (EntityDAO *)dao {
    return [[[EntityDAO alloc] initWithEntityName:@"OrderedItem"] autorelease];
}

+ (id)createOne {
    return (OrderedItem *)[[OrderedItem dao] createOne];
}

+ (OrderedItem *)findOneWithUID:(NSString *)uid {
    return (OrderedItem *)[[OrderedItem dao] findOneWithUID:uid];
}

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    return [[OrderedItem dao] findAllWithUIDArray:uidsArray];
}

+ (NSArray *)findAll {
    return [[OrderedItem dao] findAll];
}

+ (void)deleteAll {
    [[OrderedItem dao] deleteAll];
}

@end
