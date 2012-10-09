// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to OrderedItem.h instead.

#import <CoreData/CoreData.h>


extern const struct OrderedItemAttributes {
	 NSString *count;
	 NSString *serverId;
} OrderedItemAttributes;

extern const struct OrderedItemRelationships {
	 NSString *item;
	 NSString *order;
} OrderedItemRelationships;

extern const struct OrderedItemFetchedProperties {
} OrderedItemFetchedProperties;

@class Item;
@class Order;




@interface OrderedItemID : NSManagedObjectID {}
@end

@interface _OrderedItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (OrderedItemID*)objectID;




@property (nonatomic, retain) NSNumber *count;


@property int32_t countValue;
- (int32_t)countValue;
- (void)setCountValue:(int32_t)value_;

//- (BOOL)validateCount:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *serverId;


@property int32_t serverIdValue;
- (int32_t)serverIdValue;
- (void)setServerIdValue:(int32_t)value_;

//- (BOOL)validateServerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) Item* item;

//- (BOOL)validateItem:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) Order* order;

//- (BOOL)validateOrder:(id*)value_ error:(NSError**)error_;





@end

@interface _OrderedItem (CoreDataGeneratedAccessors)

@end

@interface _OrderedItem (CoreDataGeneratedPrimitiveAccessors)


- (NSNumber *)primitiveCount;
- (void)setPrimitiveCount:(NSNumber *)value;

- (int32_t)primitiveCountValue;
- (void)setPrimitiveCountValue:(int32_t)value_;




- (NSNumber *)primitiveServerId;
- (void)setPrimitiveServerId:(NSNumber *)value;

- (int32_t)primitiveServerIdValue;
- (void)setPrimitiveServerIdValue:(int32_t)value_;





- (Item*)primitiveItem;
- (void)setPrimitiveItem:(Item*)value;



- (Order*)primitiveOrder;
- (void)setPrimitiveOrder:(Order*)value;


@end
