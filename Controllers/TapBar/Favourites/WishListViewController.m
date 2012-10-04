//
//  WishListViewController.m
//  Flowers
//
//  Created by admin on 02.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WishListViewController.h"
#import "Item.h"
#import "ItemCell.h"
#import "ItemViewController.h"

@interface WishListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *favItems;

@end

@implementation WishListViewController

@synthesize tableView = _tableView;
@synthesize favItems;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Избранное";
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    self.favItems = [NSMutableArray arrayWithCapacity:0];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.favItems removeAllObjects];
    [self.favItems addObjectsFromArray:[Item findAllInFavs]];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 63.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favItems.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = [self.favItems objectAtIndex:indexPath.row];
    return [self cellForItem:item];
    
}

- (UITableViewCell *)cellForItem:(Item *)item
{
    static NSString *CellIdentifier = @"Cell";
    
    ItemCell *cell = (ItemCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = (ItemCell *)[[[NSBundle mainBundle] loadNibNamed:@"ItemCell" owner:nil options:nil] objectAtIndex:0];
    }
    [cell setupWithItem:item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemViewController *itemVC = [[ItemViewController alloc] initWithNibName:nil bundle:nil];
    itemVC.item = [self.favItems objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:itemVC animated:YES];
    [itemVC release];
}


@end
