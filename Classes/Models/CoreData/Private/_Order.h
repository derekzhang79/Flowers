// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Order.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderAttributes {
	 NSString *buyerName;
	 NSString *buyerPhone;
	 NSString *deliveringTimeFrom;
	 NSString *deliveringTimeTo;
	 NSString *destination;
} OrderAttributes;

extern const struct OrderRelationships {
	 NSString *orderedItems;
} OrderRelationships;

extern const struct OrderFetchedProperties {
} OrderFetchedProperties;

@class OrderedItem;







@interface OrderID : NSManagedObjectID {}
@end

@interface _Order : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderID*)objectID;




@property (nonatomic, retain) NSString *buyerName;


//- (BOOL)validateBuyerName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDecimalNumber *buyerPhone;


//- (BOOL)validateBuyerPhone:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDate *deliveringTimeFrom;


//- (BOOL)validateDeliveringTimeFrom:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSDate *deliveringTimeTo;


//- (BOOL)validateDeliveringTimeTo:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSString *destination;


//- (BOOL)validateDestination:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSSet* orderedItems;

- (NSMutableSet*)orderedItemsSet;





@end

@interface _Order (CoreDataGeneratedAccessors)

- (void)addOrderedItems:(NSSet*)value_;
- (void)removeOrderedItems:(NSSet*)value_;
- (void)addOrderedItemsObject:(OrderedItem*)value_;
- (void)removeOrderedItemsObject:(OrderedItem*)value_;

@end

@interface _Order (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveBuyerName;
- (void)setPrimitiveBuyerName:(NSString *)value;




- (NSDecimalNumber *)primitiveBuyerPhone;
- (void)setPrimitiveBuyerPhone:(NSDecimalNumber *)value;




- (NSDate *)primitiveDeliveringTimeFrom;
- (void)setPrimitiveDeliveringTimeFrom:(NSDate *)value;




- (NSDate *)primitiveDeliveringTimeTo;
- (void)setPrimitiveDeliveringTimeTo:(NSDate *)value;




- (NSString *)primitiveDestination;
- (void)setPrimitiveDestination:(NSString *)value;





- (NSMutableSet*)primitiveOrderedItems;
- (void)setPrimitiveOrderedItems:(NSMutableSet*)value;


@end
