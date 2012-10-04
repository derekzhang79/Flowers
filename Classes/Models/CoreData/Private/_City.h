// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to City.h instead.

#import <CoreData/CoreData.h>


extern const struct CityAttributes {
	 NSString *name;
	 NSString *serverId;
} CityAttributes;

extern const struct CityRelationships {
	 NSString *groups;
	 NSString *items;
} CityRelationships;

extern const struct CityFetchedProperties {
} CityFetchedProperties;

@class Group;
@class Item;




@interface CityID : NSManagedObjectID {}
@end

@interface _City : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (CityID*)objectID;




@property (nonatomic, retain) NSString *name;


//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) NSNumber *serverId;


@property int32_t serverIdValue;
- (int32_t)serverIdValue;
- (void)setServerIdValue:(int32_t)value_;

//- (BOOL)validateServerId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSSet* groups;

- (NSMutableSet*)groupsSet;




@property (nonatomic, retain) NSSet* items;

- (NSMutableSet*)itemsSet;





@end

@interface _City (CoreDataGeneratedAccessors)

- (void)addGroups:(NSSet*)value_;
- (void)removeGroups:(NSSet*)value_;
- (void)addGroupsObject:(Group*)value_;
- (void)removeGroupsObject:(Group*)value_;

- (void)addItems:(NSSet*)value_;
- (void)removeItems:(NSSet*)value_;
- (void)addItemsObject:(Item*)value_;
- (void)removeItemsObject:(Item*)value_;

@end

@interface _City (CoreDataGeneratedPrimitiveAccessors)


- (NSString *)primitiveName;
- (void)setPrimitiveName:(NSString *)value;




- (NSNumber *)primitiveServerId;
- (void)setPrimitiveServerId:(NSNumber *)value;

- (int32_t)primitiveServerIdValue;
- (void)setPrimitiveServerIdValue:(int32_t)value_;





- (NSMutableSet*)primitiveGroups;
- (void)setPrimitiveGroups:(NSMutableSet*)value;



- (NSMutableSet*)primitiveItems;
- (void)setPrimitiveItems:(NSMutableSet*)value;


@end
