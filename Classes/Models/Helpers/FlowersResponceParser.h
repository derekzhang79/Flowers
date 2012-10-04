//
//  FlowersResponceParser.h
//  Flowers
//
//  Created by admin on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FlowersResponceParser : NSObject

- (id)initWithData:(NSData *)data;
- (NSArray *)parseFlowersObjects; 

@end
