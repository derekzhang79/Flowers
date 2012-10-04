//
//  BasketViewController.m
//  Flowers
//
//  Created by admin on 01.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BasketViewController.h"
#import "OrderedItem.h"
#import "Order.h"
#import "Item.h"
#import "ItemCell.h"
#import "ItemViewController.h"
#import "CRTableViewCell.h"

@interface BasketViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *selectedMarks; // You need probably to save the selected cells for use in the future.

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *itemsInBasket;

@end

@implementation BasketViewController

@synthesize itemsInBasket, tableView = _tableView, selectedMarks;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Корзина";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.itemsInBasket = [NSMutableArray arrayWithCapacity:0];
    self.selectedMarks = [NSMutableArray arrayWithCapacity:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.itemsInBasket removeAllObjects];
    [self.itemsInBasket addObjectsFromArray:[Item findAllInBasket]];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsInBasket.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CRTableViewCellIdentifier = @"cellIdentifier";
    
    // init the CRTableViewCell
    CRTableViewCell *cell = (CRTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CRTableViewCellIdentifier];
    
    if (cell == nil) {
        cell = [[CRTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CRTableViewCellIdentifier];
    }
    
    // Check if the cell is currently selected (marked)
    Item *item = [self.itemsInBasket objectAtIndex:indexPath.row];
    cell.isSelected = [selectedMarks containsObject:item] ? YES : NO;
    cell.textLabel.text = item.name;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Item *item = [self.itemsInBasket objectAtIndex:indexPath.row];
    
    if ([selectedMarks containsObject:item])// Is selected?
        [selectedMarks removeObject:item];
    else
        [selectedMarks addObject:item];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end