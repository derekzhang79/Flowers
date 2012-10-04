//
//  CityModel.h
//  Flowers
//
//  Created by admin on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class City;
@class Group;

@interface DataModel : NSObject

+ (void)findCitysWithCompleteBlock:(void(^)(NSArray *))block;
+ (void)findGroupsInCity:(City *)city withCompleteBlock:(void(^)(NSArray *))block;
+ (void)findItemsInCity:(City *)city andGroup:(Group *)group withCompleteBlock:(void(^)(NSArray *))block;

@end
