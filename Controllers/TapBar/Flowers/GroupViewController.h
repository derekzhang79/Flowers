//
//  GroupViewController.h
//  Flowers
//
//  Created by admin on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class City;
@class Group;

@interface GroupViewController : UITableViewController

@property (nonatomic, retain) Group *group;
@property (nonatomic, retain) City *city;

@end
