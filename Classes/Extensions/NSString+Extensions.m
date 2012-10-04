//
//  NSString+Extensions.m
//  Meloman
//
//  Created by Arty on 8/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSString+Extensions.h"

#define CRangeAfterRange(range, length) NSMakeRange((range.location + range.length), (length) - (range.location + range.length))

@implementation NSString (Extensions)

#pragma mark -
#pragma mark URL encode

- (NSString *)URLEncodedString {
	NSString * encodedString = (NSString *)CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)self,
                                                                                   NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                   kCFStringEncodingUTF8);
	return [encodedString autorelease];
}

#pragma mark -
#pragma mark HTTP forms

// < name="asdasd" value="asdasd" />

- (NSString *)formValueByName:(NSString *)name {
    int length = [self length];
    NSRange nameRange = [self rangeOfString:[NSString stringWithFormat:@"name=\"%@\"", name]];
    if (nameRange.length <= 0) {
        return nil;
    }    
    NSRange valueRange = [self rangeOfString:@"value=\""
                                     options:NSCaseInsensitiveSearch
                                       range:CRangeAfterRange(nameRange, length)];
    NSRange afterValueRange = CRangeAfterRange(valueRange, length);
    NSRange endRange = [self rangeOfString:@"\""
                                   options:NSCaseInsensitiveSearch
                                     range:afterValueRange];
    return [self substringWithRange:NSMakeRange(afterValueRange.location,
                                                endRange.location - afterValueRange.location)];
}

//https://api.vkontakte.ru/oauth/grant_access?hash=f765a4ba87a94fc64a&client_id=2438559&settings=65544&redirect_uri=blank.html&response_type=token&state=

//https://oauth.vk.com/grant_access?hash=f765a4ba87a94fc64a&client_id=2438559&settings=65544&redirect_uri=blank.html&response_type=token&state=&token_type=                

- (NSString *)valueFromLink:(NSString *)link byName:(NSString *)name {    
    NSRange valueNameRange = [self rangeOfString:name];
    if (valueNameRange.length == 0) {
        return nil;        
    }
    
    int length = [self length];
    NSRange linkRange = [self rangeOfString:link];
    if (linkRange.length <= 0) {
        return nil;
    }
    NSRange keyRange = [self rangeOfString:[NSString stringWithFormat:@"%@=", name]
                                   options:NSCaseInsensitiveSearch
                                     range:CRangeAfterRange(linkRange, length)];
    NSRange afterKeyRange = CRangeAfterRange(keyRange, length);    
    NSRange endRange = [self rangeOfString:@"&"
                                   options:NSCaseInsensitiveSearch
                                     range:afterKeyRange];
    if (endRange.length <= 0) { // if there no last separator
        endRange.location = length;
    }
    return [self substringWithRange:NSMakeRange(afterKeyRange.location,
                                                endRange.location - afterKeyRange.location)];
}

- (BOOL)isEmpty {
    return [self isEqualToString:@""];
}

+ (BOOL)isNotNillOrEmpty:(NSString *)string {
    return (string != nil) && (![string isEmpty]);
}

@end
