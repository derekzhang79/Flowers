//
//  ItemCell.h
//  Flowers
//
//  Created by admin on 02.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Item;

@interface ItemCell : UITableViewCell

@property (nonatomic, retain) Item *item;

- (void)setupWithItem:(Item *)newItem;

@end
