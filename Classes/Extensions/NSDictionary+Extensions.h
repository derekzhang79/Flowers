//
//  NSDictionary+Extensions.h
//  Meloman
//
//  Created by Arty on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extensions)

- (NSString *)toHttpRequestString;
- (NSString *)toCoreDataRequestString;

@end
