//
//  AsyncAbstractDAO.m
//  DropSend
//
//  Created by Arty on 6/21/11.
//  Copyright 2011 dropsend. All rights reserved.
//

#import "AsyncEntityDAO.h"
#import "CoreDataStack.h"

@implementation AsyncEntityDAO

@synthesize delegate = _delegate;
@synthesize dao = _dao;

- (id)initWithEntityName:(NSString *)entityName andDelegate:(id<AsyncEntityDAODelegate>)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
        self.dao = [[[EntityDAO alloc] initWithEntityName:entityName] autorelease];
    }
    return self;
}

- (NSString *)entityName {
    return [self.dao entityName];    
}

- (void)createOne {
    AsyncEntityDAOResult *result = [[AsyncEntityDAOResult alloc] initWithData:[self.dao createOne]];
    [self.delegate asyncDAO:self didFinishedWithResult:result];
    [result dealloc];
}

- (void)findOneWithUID:(NSString *)uid {
    AsyncEntityDAOResult *result = [[AsyncEntityDAOResult alloc] initWithData:[self.dao findOneWithUID:uid]];
    [self.delegate asyncDAO:self didFinishedWithResult:result];
    [result dealloc];
}

- (void)findAll {
    AsyncEntityDAOResult *result =
        [((AsyncEntityDAOResult *)[AsyncEntityDAOResult alloc]) initWithData:[self.dao findAll]];
    [self.delegate asyncDAO:self didFinishedWithResult:result];
    [result dealloc];
}

- (void)deleteOneWithUID:(NSString *)uid {
    [self.dao deleteOneWithUID:uid];
    
    AsyncEntityDAOResult *result = [[AsyncEntityDAOResult alloc] initWithOperation:AsyncDAOOperationDelete];
    [self.delegate asyncDAO:self didFinishedWithResult:result];
    [result dealloc];
}

- (void)deleteAll {
    [self.dao deleteAll];
    
    AsyncEntityDAOResult *result = [[AsyncEntityDAOResult alloc] initWithData:[self.dao createOne]];
    [self.delegate asyncDAO:self didFinishedWithResult:result];
    [result dealloc];
}

- (void)dealloc {
    self.delegate = nil;
    self.dao = nil;
    
    [super dealloc];
}

@end
