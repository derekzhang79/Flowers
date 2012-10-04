// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.m instead.

#import "_Item.h"

const struct ItemAttributes ItemAttributes = {
	.images = @"images",
	.inBasket = @"inBasket",
	.inFavorites = @"inFavorites",
	.name = @"name",
	.price = @"price",
	.rating = @"rating",
	.serverId = @"serverId",
};

const struct ItemRelationships ItemRelationships = {
	.city = @"city",
	.group = @"group",
	.orderedItem = @"orderedItem",
};

const struct ItemFetchedProperties ItemFetchedProperties = {
};

@implementation ItemID
@end

@implementation _Item

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Item";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Item" inManagedObjectContext:moc_];
}

- (ItemID*)objectID {
	return (ItemID*)[super objectID];
}

+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"inBasketValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inBasket"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"inFavoritesValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"inFavorites"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"priceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"price"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"ratingValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"rating"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}
	if ([key isEqualToString:@"serverIdValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"serverId"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
	}

	return keyPaths;
}




@dynamic images;






@dynamic inBasket;



- (BOOL)inBasketValue {
	NSNumber *result = [self inBasket];
	return [result boolValue];
}

- (void)setInBasketValue:(BOOL)value_ {
	[self setInBasket:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveInBasketValue {
	NSNumber *result = [self primitiveInBasket];
	return [result boolValue];
}

- (void)setPrimitiveInBasketValue:(BOOL)value_ {
	[self setPrimitiveInBasket:[NSNumber numberWithBool:value_]];
}





@dynamic inFavorites;



- (BOOL)inFavoritesValue {
	NSNumber *result = [self inFavorites];
	return [result boolValue];
}

- (void)setInFavoritesValue:(BOOL)value_ {
	[self setInFavorites:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveInFavoritesValue {
	NSNumber *result = [self primitiveInFavorites];
	return [result boolValue];
}

- (void)setPrimitiveInFavoritesValue:(BOOL)value_ {
	[self setPrimitiveInFavorites:[NSNumber numberWithBool:value_]];
}





@dynamic name;






@dynamic price;



- (double)priceValue {
	NSNumber *result = [self price];
	return [result doubleValue];
}

- (void)setPriceValue:(double)value_ {
	[self setPrice:[NSNumber numberWithDouble:value_]];
}

- (double)primitivePriceValue {
	NSNumber *result = [self primitivePrice];
	return [result doubleValue];
}

- (void)setPrimitivePriceValue:(double)value_ {
	[self setPrimitivePrice:[NSNumber numberWithDouble:value_]];
}





@dynamic rating;



- (int32_t)ratingValue {
	NSNumber *result = [self rating];
	return [result intValue];
}

- (void)setRatingValue:(int32_t)value_ {
	[self setRating:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveRatingValue {
	NSNumber *result = [self primitiveRating];
	return [result intValue];
}

- (void)setPrimitiveRatingValue:(int32_t)value_ {
	[self setPrimitiveRating:[NSNumber numberWithInt:value_]];
}





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

	

@dynamic group;

	

@dynamic orderedItem;

	






@end
