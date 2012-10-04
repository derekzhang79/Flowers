//
//  Item.m
//  Flowers
//
//  Created by admin on 25.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Item.h"
#import "City.h"
#import "Group.h"
#import "OrderedItem.h"


@implementation Item

@dynamic images;
@dynamic name;
@dynamic price;
@dynamic rating;
@dynamic serverId;
@dynamic group;
@dynamic orderedItem;
@dynamic city;

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
    NSArray *mas = [[Item dao] findAllWithCriteria:[NSDictionary dictionaryWithObjectsAndKeys:city.serverId.stringValue, @"city.serverId", group.serverId.stringValue, @"group.serverId", nil]];
    return mas;
}

+ (void)deleteAll {
    [[Item dao] deleteAll];
}


@end
