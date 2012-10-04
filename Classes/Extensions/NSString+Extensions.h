//
//  NSString+Extensions.h
//  Meloman
//
//  Created by Arty on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extensions)

#pragma mark -
#pragma mark URL encode

- (NSString *)URLEncodedString;

#pragma mark -
#pragma mark HTTP forms

- (NSString *)formValueByName:(NSString *)name;
- (NSString *)valueFromLink:(NSString *)link byName:(NSString *)name;

- (BOOL)isEmpty;

+ (BOOL)isNotNillOrEmpty:(NSString *)string;

@end
