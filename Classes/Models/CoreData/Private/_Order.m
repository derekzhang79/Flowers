// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Order.m instead.

#import "_Order.h"

const struct OrderAttributes OrderAttributes = {
	.buyerName = @"buyerName",
	.buyerPhone = @"buyerPhone",
	.deliveringTimeFrom = @"deliveringTimeFrom",
	.deliveringTimeTo = @"deliveringTimeTo",
	.destination = @"destination",
};

const struct OrderRelationships OrderRelationships = {
	.orderedItems = @"orderedItems",
};

const struct OrderFetchedProperties OrderFetchedProperties = {
};

@implementation OrderID
@end

@implementation _Order

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Order" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Order";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Order" inManagedObjectContext:moc_];
}

- (OrderID*)objectID {
	return (OrderID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic buyerName;






@dynamic buyerPhone;






@dynamic deliveringTimeFrom;






@dynamic deliveringTimeTo;






@dynamic destination;






@dynamic orderedItems;

	
- (NSMutableSet*)orderedItemsSet {
	[self willAccessValueForKey:@"orderedItems"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"orderedItems"];
  
	[self didAccessValueForKey:@"orderedItems"];
	return result;
}
	






@end
