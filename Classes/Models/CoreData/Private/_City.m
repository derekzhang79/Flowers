// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to City.m instead.

#import "_City.h"

const struct CityAttributes CityAttributes = {
	.name = @"name",
	.serverId = @"serverId",
};

const struct CityRelationships CityRelationships = {
	.groups = @"groups",
	.items = @"items",
};

const struct CityFetchedProperties CityFetchedProperties = {
};

@implementation CityID
@end

@implementation _City

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"City" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"City";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"City" inManagedObjectContext:moc_];
}

- (CityID*)objectID {
	return (CityID*)[super objectID];
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





@dynamic groups;

	
- (NSMutableSet*)groupsSet {
	[self willAccessValueForKey:@"groups"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"groups"];
  
	[self didAccessValueForKey:@"groups"];
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
