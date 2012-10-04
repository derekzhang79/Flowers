//
//  AsyncDaoResult.m
//  DropSend
//
//  Created by Arty on 6/21/11.
//  Copyright 2011 dropsend. All rights reserved.
//

#import "AsyncEntityDAOResult.h"

@implementation AsyncEntityDAOResult

@synthesize operation = _operation;

@synthesize isSuccessed = _isSuccessed;
@synthesize errorMessage = _errorMessage;

@synthesize data = _data;
@synthesize subdata = _subdata;

- (id)initWithData:(id)data {
    self = [super init];
    if (self) {
        self.isSuccessed = YES;
        self.operation = AsyncDAOOperationFind;
        
        self.data = data;      
    }
    return self;
}

- (id)initWithData:(id)data andSubData:(id)subdata {
    self = [self initWithData:data];
    if (self) {
        self.subdata = subdata;        
    }
    return self;
}

- (id)initWithErrorMessage:(NSString *)errorMessage {
    self = [super init];
    if (self) {
        self.isSuccessed = NO;        
        self.operation = AsyncDAOOperationFind;
        
        self.errorMessage = errorMessage;
    }
    return self;
}

- (id)initWithOperation:(AsyncDAOOperation)operation {
    self = [super init];
    if (self) {
        self.isSuccessed = YES;
        self.operation = operation;        
    }
    return self;
}

- (void)dealloc {
    [_data release];
    [_subdata release];
    
    [_errorMessage release];
    
    [super dealloc];
}

@end