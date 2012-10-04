// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Group.m instead.

#import "_Group.h"

const struct GroupAttributes GroupAttributes = {
	.name = @"name",
	.serverId = @"serverId",
};

const struct GroupRelationships GroupRelationships = {
	.city = @"city",
	.items = @"items",
};

const struct GroupFetchedProperties GroupFetchedProperties = {
};

@implementation GroupID
@end

@implementation _Group

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Group" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Group";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Group" inManagedObjectContext:moc_];
}

- (GroupID*)objectID {
	return (GroupID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"serverIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"serverId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic name;






@dynamic serverId;



- (int32_t)serverIdValue {
	NSNumber *result = [self serverId];
	return [result intValue];
}

- (void)setServerIdValue:(int32_t)value_ {
	[self setServerId:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveServerIdValue {
	NSNumber *result = [self primitiveServerId];
	return [result intValue];
}

- (void)setPrimitiveServerIdValue:(int32_t)value_ {
	[self setPrimitiveServerId:[NSNumber numberWithInt:value_]];
}





@dynamic city;

	
- (NSMutableSet*)citySet {
	[self willAccessValueForKey:@"city"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"city"];
  
	[self didAccessValueForKey:@"city"];
	return result;
}
	

@dynamic items;

	
- (NSMutableSet*)itemsSet {
	[self willAccessValueForKey:@"items"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"items"];
  
	[self didAccessValueForKey:@"items"];
	return result;
}
	






@end
