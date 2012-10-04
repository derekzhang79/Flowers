// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Item.h instead.

#import <CoreData/CoreData.h>


extern const struct ItemAttributes {
	 NSString *images;
	 NSString *inBasket;
	 NSString *inFavorites;
	 NSString *name;
	 NSString *price;
	 NSString *rating;
	 NSString *serverId;
} ItemAttributes;

extern const struct ItemRelationships {
	 NSString *city;
	 NSString *group;
	 NSString *orderedItem;
} ItemRelationships;

extern const struct ItemFetchedProperties {
} ItemFetchedProperties;

@class City;
@class Group;
@class OrderedItem;









@interface ItemID : NSManagedObjectID {}
@end

@interface _Item : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (ItemID*)objectID;




@property (nonatomic, retain) NSString *images;


//- (BOOL)validateImages:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *inBasket;


@property BOOL inBasketValue;
- (BOOL)inBasketValue;
- (void)setInBasketValue:(BOOL)value_;

//- (BOOL)validateInBasket:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *inFavorites;


@property BOOL inFavoritesValue;
- (BOOL)inFavoritesValue;
- (void)setInFavoritesValue:(BOOL)value_;

//- (BOOL)validateInFavorites:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *price;


@property double priceValue;
- (double)priceValue;
- (void)setPriceValue:(double)value_;

//- (BOOL)validatePrice:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *rating;


@property int32_t ratingValue;
- (int32_t)ratingValue;
- (void)setRatingValue:(int32_t)value_;

//- (BOOL)validateRating:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *serverId;


@property int32_t serverIdValue;
- (int32_t)serverIdValue;
- (void)setServerIdValue:(int32_t)value_;

//- (BOOL)validateServerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) City* city;

//- (BOOL)validateCity:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) Group* group;

//- (BOOL)validateGroup:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) OrderedItem* orderedItem;

//- (BOOL)validateOrderedItem:(id*)value_ error:(NSError**)error_;





@end

@interface _Item (CoreDataGeneratedAccessors)

@end

@interface _Item (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveImages;
- (void)setPrimitiveImages:(NSString *)value;




- (NSNumber *)primitiveInBasket;
- (void)setPrimitiveInBasket:(NSNumber *)value;

- (BOOL)primitiveInBasketValue;
- (void)setPrimitiveInBasketValue:(BOOL)value_;




- (NSNumber *)primitiveInFavorites;
- (void)setPrimitiveInFavorites:(NSNumber *)value;

- (BOOL)primitiveInFavoritesValue;
- (void)setPrimitiveInFavoritesValue:(BOOL)value_;




- (NSString *)primitiveName;
- (void)setPrimitiveName:(NSString *)value;




- (NSNumber *)primitivePrice;
- (void)setPrimitivePrice:(NSNumber *)value;

- (double)primitivePriceValue;
- (void)setPrimitivePriceValue:(double)value_;




- (NSNumber *)primitiveRating;
- (void)setPrimitiveRating:(NSNumber *)value;

- (int32_t)primitiveRatingValue;
- (void)setPrimitiveRatingValue:(int32_t)value_;




- (NSNumber *)primitiveServerId;
- (void)setPrimitiveServerId:(NSNumber *)value;

- (int32_t)primitiveServerIdValue;
- (void)setPrimitiveServerIdValue:(int32_t)value_;





- (City*)primitiveCity;
- (void)setPrimitiveCity:(City*)value;



- (Group*)primitiveGroup;
- (void)setPrimitiveGroup:(Group*)value;



- (OrderedItem*)primitiveOrderedItem;
- (void)setPrimitiveOrderedItem:(OrderedItem*)value;


@end
