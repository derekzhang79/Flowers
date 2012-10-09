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

+ (OrderedItem *)findOneWithItemUID:(NSString *)uid {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"item.serverId == %@", uid];    
    return [[[OrderedItem dao] findAllWithPredicate:predicate] objectAtIndex:0];
}

+ (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray {
    return [[OrderedItem dao] findAllWithUIDArray:uidsArray];
}

+ (NSArray *)findAll {
    return [[OrderedItem dao] findAll];
}

+ (void)deleteOneWithUID:(NSString *)uid {
    [[OrderedItem dao] deleteOneWithUID:uid];
}

+ (void)deleteAll {
    [[OrderedItem dao] deleteAll];
}

@end
