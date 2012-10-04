//
//  NSDictionary+Extensions.m
//  Meloman
//
//  Created by Arty on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSDictionary+Extensions.h"

@implementation NSDictionary (Extensions)

- (NSString *)toHttpRequestString {
    NSString *toReturn = @"";
    for (NSString *key in [self allKeys]) {
        NSString *value = [self valueForKey:key];
        NSString *pair = [NSString stringWithFormat:@"&%@=%@", key, value];
        toReturn = [toReturn stringByAppendingString:pair];
    }
    return toReturn;
}

- (NSString *)toCoreDataRequestString {
    NSString *toReturn = @"(YES == YES)";
    for (NSString *key in [self allKeys]) {
        NSString *value = [self valueForKey:key];
        NSString *pair = [NSString stringWithFormat:@" AND (%@ == %@)", key, value];
        toReturn = [toReturn stringByAppendingString:pair];
    }
    return toReturn;
}

@end
