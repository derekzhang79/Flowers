// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderedItem.m instead.

#import "_OrderedItem.h"

const struct OrderedItemAttributes OrderedItemAttributes = {
	.count = @"count",
};

const struct OrderedItemRelationships OrderedItemRelationships = {
	.item = @"item",
	.order = @"order",
};

const struct OrderedItemFetchedProperties OrderedItemFetchedProperties = {
};

@implementation OrderedItemID
@end

@implementation _OrderedItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"OrderedItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"OrderedItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"OrderedItem" inManagedObjectContext:moc_];
}

- (OrderedItemID*)objectID {
	return (OrderedItemID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"countValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"count"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic count;



- (int32_t)countValue {
	NSNumber *result = [self count];
	return [result intValue];
}

- (void)setCountValue:(int32_t)value_ {
	[self setCount:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveCountValue {
	NSNumber *result = [self primitiveCount];
	return [result intValue];
}

- (void)setPrimitiveCountValue:(int32_t)value_ {
	[self setPrimitiveCount:[NSNumber numberWithInt:value_]];
}





@dynamic item;

	

@dynamic order;

	






@end
