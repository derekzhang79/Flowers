//
//  GroupViewController.m
//  Flowers
//
//  Created by admin on 27.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GroupViewController.h"
#import "ItemViewController.h"
#import "DataModel.h"
#import "City.h"
#import "Group.h"
#import "Item.h"
#import "ItemCell.h"

@interface GroupViewController ()

@property (nonatomic, retain) NSMutableArray *items;

- (ItemCell *)cellForItem:(Item *)item;
- (void)allItemsLoaded;

@end

@implementation GroupViewController

@synthesize group = _group, city = _city, items;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.group.name;
    Item *oneItem = [Item findOneWithUID:@"1"];
    if (!oneItem) {
        oneItem = [Item createOne];
        oneItem.name = @"Красная роза";
        oneItem.priceValue = 100.0f;
        oneItem.inBasketValue = NO;
        oneItem.inFavoritesValue = NO;
        oneItem.serverIdValue = 1;
        oneItem.city = self.city;
        oneItem.group = self.group;
        oneItem.ratingValue = 5;
        [[CoreDataStack sharedInstance] saveContextForCurrentThread];
    }
    self.items = [NSMutableArray arrayWithArray:[Item findAllWithCity:self.city andGroup:self.group]];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Назад" style: UIBarButtonItemStyleBordered target: nil action: nil];
    [[self navigationItem] setBackBarButtonItem: newBackButton];
    [newBackButton release];
    
    [DataModel findItemsInCity:self.city andGroup:self.group withCompleteBlock:^(NSArray *array) {
        for (id item in array) {
            // проверяем нет ли уже этой группы в БД
            Item *searchedItem = [Item findOneWithUID:[item valueForKey:@"id"]];
            if (!searchedItem) {
                searchedItem = [Item createOne];
                [searchedItem populateWithDictionary:item];
            }
            NSLog(@"group sid = %@, city sid = %@", self.group.serverId.stringValue, self.city.serverId.stringValue);
            NSLog(@"item name = %@", searchedItem.name);
            searchedItem.group = self.group;
            searchedItem.city = self.city;
        }
        if ([[[CoreDataStack sharedInstance] contextForCurrentThread] hasChanges]) {
            [[CoreDataStack sharedInstance] saveContextForCurrentThread];
            [self allItemsLoaded];
        } 
    }];
}

- (void)allItemsLoaded
{
    self.items = [NSMutableArray arrayWithArray:[Item findAllWithCity:self.city andGroup:self.group]];
    NSLog(@"Items count = %d", self.items.count);
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 63.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Item *item = [self.items objectAtIndex:indexPath.row];
    return [self cellForItem:item];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemViewController *itemVC = [[ItemViewController alloc] initWithNibName:@"ItemViewController" bundle:nil];
    itemVC.item = [self.items objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:itemVC animated:YES];
    [itemVC release];
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

@end
