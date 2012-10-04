//
//  AsyncAbstractDAO.h
//  DropSend
//
//  Created by Arty on 6/21/11.
//  Copyright 2011 dropsend. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AsyncEntityDAOResult.h"
#import "EntityDAO.h"

@protocol AsyncEntityDAODelegate;

@interface AsyncEntityDAO : NSObject {
}

@property (nonatomic, retain) id<AsyncEntityDAODelegate> delegate;
@property (nonatomic, retain) EntityDAO *dao;

- (id)initWithEntityName:(NSString *)entityName andDelegate:(id<AsyncEntityDAODelegate>)delegate;
- (NSString *)entityName;

- (void)createOne;

- (void)findOneWithUID:(NSString *)uid;
- (void)findAll;

- (void)deleteOneWithUID:(NSString *)uid;
- (void)deleteAll;

- (void)dealloc;
@end

@protocol AsyncEntityDAODelegate<NSObject>
@required
- (void)asyncDAO:(AsyncEntityDAO *)DAO didStartRequestForOperation:(AsyncDAOOperation)operation;
- (void)asyncDAO:(AsyncEntityDAO *)DAO didFinishedWithResult:(AsyncEntityDAOResult *)result;
@end