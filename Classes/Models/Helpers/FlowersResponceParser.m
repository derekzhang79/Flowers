//
//  FlowersResponceParser.m
//  Flowers
//
//  Created by admin on 09.08.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FlowersResponceParser.h"
#import "CJSONDeserializer.h"

@interface FlowersResponceParser () <NSXMLParserDelegate>

@property (nonatomic, retain) NSData *data;
@property (nonatomic, retain) NSArray *objects;

@end

@implementation FlowersResponceParser

@synthesize data, objects;

- (id)initWithData:(NSData *)aData {
    self = [super init];
    if (self) {
        self.data = aData;
    }
    return self;
}

- (NSArray *)parseFlowersObjects {

    NSError *theError = NULL;
    self.objects = [[CJSONDeserializer deserializer] deserializeAsArray:self.data error:&theError];
    
    return self.objects;
}

- (void)dealloc {
    self.objects = nil;
    self.data = nil;
    [super dealloc];
}


@end
