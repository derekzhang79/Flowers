// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Group.h instead.

#import <CoreData/CoreData.h>


extern const struct GroupAttributes {
	 NSString *name;
	 NSString *serverId;
} GroupAttributes;

extern const struct GroupRelationships {
	 NSString *city;
	 NSString *items;
} GroupRelationships;

extern const struct GroupFetchedProperties {
} GroupFetchedProperties;

@class City;
@class Item;




@interface GroupID : NSManagedObjectID {}
@end

@interface _Group : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (GroupID*)objectID;




@property (nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *serverId;


@property int32_t serverIdValue;
- (int32_t)serverIdValue;
- (void)setServerIdValue:(int32_t)value_;

//- (BOOL)validateServerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSSet* city;

- (NSMutableSet*)citySet;




@property (nonatomic, retain) NSSet* items;

- (NSMutableSet*)itemsSet;





@end

@interface _Group (CoreDataGeneratedAccessors)

- (void)addCity:(NSSet*)value_;
- (void)removeCity:(NSSet*)value_;
- (void)addCityObject:(City*)value_;
- (void)removeCityObject:(City*)value_;

- (void)addItems:(NSSet*)value_;
- (void)removeItems:(NSSet*)value_;
- (void)addItemsObject:(Item*)value_;
- (void)removeItemsObject:(Item*)value_;

@end

@interface _Group (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveName;
- (void)setPrimitiveName:(NSString *)value;




- (NSNumber *)primitiveServerId;
- (void)setPrimitiveServerId:(NSNumber *)value;

- (int32_t)primitiveServerIdValue;
- (void)setPrimitiveServerIdValue:(int32_t)value_;





- (NSMutableSet*)primitiveCity;
- (void)setPrimitiveCity:(NSMutableSet*)value;



- (NSMutableSet*)primitiveItems;
- (void)setPrimitiveItems:(NSMutableSet*)value;


@end
