//
//  AbstractDAO.h
//  CoreData
//
//  Created by Arty on 5/19/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EntityDAO : NSObject {
}

- (id)initWithEntityClass:(Class)clazz;
- (id)initWithEntityName:(NSString *)entityName;

- (NSString *)entityName;

- (id)createOne;

- (id)findOneWithUID:(NSString *)uid;

- (NSArray *)findAllWithUIDArray:(NSArray *)uidsArray;
- (NSArray *)findAllWithCriteria:(NSDictionary *)criteria;
- (NSArray *)findAll;
- (NSArray *)findAllWithPredicate:(NSPredicate *)predicate;

- (void)deleteOneWithUID:(NSString *)uid;
- (void)deleteAll;

- (void)dealloc;
@end
