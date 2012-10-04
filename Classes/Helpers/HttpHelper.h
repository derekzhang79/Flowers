//
//  HttpHelper.h
//  FlickerClient
//
//  Created by Dmitry on 24.12.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^HttpHelperBlock)(NSData *);

@interface HttpHelper : NSObject

+ (void)getDataWithURL:(NSURL *)url completeBlock:(HttpHelperBlock)block;

- (void)asyncRequest;

@end