//
//  CityModel.m
//  Flowers
//
//  Created by admin on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DataModel.h"
#import "HttpHelper.h"
#import "FlowersResponceParser.h"
#import "Constants.h"
#import "City.h"
#import "Group.h"

@implementation DataModel

+ (void)findObjectsWithURL:(NSURL *)url completeBlock:(void(^)(NSArray *))block
{
    [HttpHelper getDataWithURL:url completeBlock:^(NSData *data) {
        FlowersResponceParser *parser =
        [[FlowersResponceParser alloc] initWithData:data];
        NSString *reseivedString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"\nreceivedString = %@", reseivedString);
        NSArray *objects = [parser parseFlowersObjects];
        block(objects);
    }];
}

+ (void)findCitysWithCompleteBlock:(void(^)(NSArray *))block {
    NSString *strUrl = [NSString stringWithFormat:
                     @"%@getCities", FLOWERS_BASE_URL];
    NSURL *url = [NSURL URLWithString: strUrl];
    [DataModel findObjectsWithURL:url completeBlock:block];
}

+ (void)findGroupsInCity:(City *)city withCompleteBlock:(void(^)(NSArray *))block {
    NSString *strUrl = [NSString stringWithFormat:
                        @"%@getGroups&cityID=%d", FLOWERS_BASE_URL, city.serverId.intValue];
    NSURL *url = [NSURL URLWithString: strUrl];
    [DataModel findObjectsWithURL:url completeBlock:block];
}

+ (void)findItemsInCity:(City *)city andGroup:(Group *)group withCompleteBlock:(void(^)(NSArray *))block {
    NSString *strUrl = [NSString stringWithFormat:
                        @"%@getItems&cityID=%d&groupID=%d", FLOWERS_BASE_URL, city.serverId.intValue, group.serverId.intValue];
    NSURL *url = [NSURL URLWithString: strUrl];
    [DataModel findObjectsWithURL:url completeBlock:block];
}

@end
