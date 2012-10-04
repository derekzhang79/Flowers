//
//  Order.m
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Order.h"


@implementation Order

@dynamic buyerName;
@dynamic buyerPhone;
@dynamic deliveringTimeFrom;
@dynamic deliveringTimeTo;
@dynamic destination;
@dynamic orderedItems;

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
