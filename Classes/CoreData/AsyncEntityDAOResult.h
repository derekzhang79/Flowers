//
//  AsyncDaoResult.h
//  DropSend
//
//  Created by Arty on 6/21/11.
//  Copyright 2011 dropsend. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    AsyncDAOOperationFind = 0,
    AsyncDAOOperationDelete,
    AsyncDAOOperationUpdate
} AsyncDAOOperation;

@interface AsyncEntityDAOResult : NSObject {
}

@property (nonatomic, assign) AsyncDAOOperation operation;

@property (nonatomic, assign) BOOL isSuccessed;
@property (nonatomic, retain) NSString *errorMessage;

@property (nonatomic, retain) id data;
@property (nonatomic, retain) id subdata;

- (id)initWithData:(id)data;
- (id)initWithData:(id)data andSubData:(id)subdata;
- (id)initWithErrorMessage:(NSString *)errorMessage;
- (id)initWithOperation:(AsyncDAOOperation)operation;

@end
