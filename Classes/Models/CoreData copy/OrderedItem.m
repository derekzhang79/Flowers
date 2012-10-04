//
//  OrderedItem.m
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OrderedItem.h"
#import "Item.h"
#import "Order.h"


@implementation OrderedItem

@dynamic count;
@dynamic item;
@dynamic order;

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
