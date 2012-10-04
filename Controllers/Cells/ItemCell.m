//
//  ItemCell.m
//  Flowers
//
//  Created by admin on 02.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemCell.h"
#import "Item.h"
#import "DYRateView.h"

@interface ItemCell ()
@property (nonatomic, retain) IBOutlet UIImageView *itemImage;
@property (nonatomic, retain) IBOutlet UILabel *itemName;
@property (nonatomic, retain) IBOutlet UILabel *itemPrice;
@property (nonatomic, retain) IBOutlet DYRateView *starRatingControl;
@end

@implementation ItemCell

@synthesize item;
@synthesize itemImage, itemName, itemPrice, starRatingControl;

- (void)setupWithItem:(Item *)newItem
{    
    self.textLabel.text = @"";
    self.itemName.text = newItem.name;
    self.itemPrice.text = [newItem.price.stringValue stringByAppendingString:@" р."];
    self.starRatingControl.rate = newItem.ratingValue;
}

@end
