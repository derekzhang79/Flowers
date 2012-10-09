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
#import "ItemViewController.h"
#import "BasketCell.h"
#import "OrderViewController.h"

@interface BasketViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) NSMutableArray *selectedMarks; // You need probably to save the selected cells for use in the future.

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *itemsInBasket;

- (IBAction)orderButtonTouched:(id)sender;

@end

@implementation BasketViewController

@synthesize itemsInBasket, tableView = _tableView, selectedMarks;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Корзина";
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.itemsInBasket = [NSMutableArray arrayWithCapacity:0];
    self.selectedMarks = [NSMutableArray arrayWithCapacity:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.itemsInBasket removeAllObjects];
    [self.itemsInBasket addObjectsFromArray:[OrderedItem findAll]];
    [self.selectedMarks removeAllObjects];
    [self.selectedMarks addObjectsFromArray:self.itemsInBasket];
    [self.tableView reloadData];
}

#pragma mark - UIButton action

- (IBAction)orderButtonTouched:(id)sender
{
    OrderViewController *orderVC = [[OrderViewController alloc] initWithNibName:@"OrderViewController" bundle:nil];
    [self.navigationController pushViewController:orderVC animated:YES];
    [orderVC release];
}

#pragma mark - UITableView delegate

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    // Updates the appearance of the Edit|Done button as necessary.
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    
}

//For the table view i use this method
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        OrderedItem *oItem = [self.itemsInBasket objectAtIndex:indexPath.row];
        [OrderedItem deleteOneWithUID:oItem.serverId.stringValue];
        [self.itemsInBasket removeObjectAtIndex:indexPath.row];
        [[CoreDataStack sharedInstance] saveContextForCurrentThread];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }	
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemsInBasket.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CRTableViewCellIdentifier = @"cellIdentifier";
    
    // init the CRTableViewCell
    BasketCell *cell = (BasketCell *)[tableView dequeueReusableCellWithIdentifier:CRTableViewCellIdentifier];
    
    if (cell == nil) {
        cell = [[BasketCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CRTableViewCellIdentifier];
    }
    
    // Check if the cell is currently selected (marked)
    OrderedItem *oItem = [self.itemsInBasket objectAtIndex:indexPath.row];
    cell.isSelected = [selectedMarks containsObject:oItem] ? YES : NO;
    cell.textLabel.text = oItem.item.name;
    cell.detailTextLabel.text = oItem.count.stringValue;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    OrderedItem *oItem = [self.itemsInBasket objectAtIndex:indexPath.row];
    
    if ([selectedMarks containsObject:oItem])// Is selected?
        [selectedMarks removeObject:oItem];
    else
        [selectedMarks addObject:oItem];
    
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


@end
