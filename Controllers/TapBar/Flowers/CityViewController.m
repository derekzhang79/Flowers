//
//  MainViewController.m
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CityViewController.h"
#import "GroupViewController.h"
#import "DataModel.h"
#import "City.h"
#import "Group.h"

@interface CityViewController ()

@property (nonatomic, retain) NSMutableArray *groups;

- (UITableViewCell *)cellForGroup:(Group *)group;
- (void)allGroupsLoaded;

@end

@implementation CityViewController

@synthesize city = _city, groups = _groups;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.city.name;
    Group *oneGroup = [Group findOneWithUID:@"1"];
    if (!oneGroup) {
        oneGroup = [Group createOne];
        oneGroup.name = @"Розы";
        oneGroup.serverIdValue = 1;
        [oneGroup addCityObject:self.city];
        [[CoreDataStack sharedInstance] saveContextForCurrentThread];
    }
    self.groups = [NSMutableArray arrayWithArray:[Group findAllWithCity:self.city]];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style: UIBarButtonItemStyleBordered target: nil action: nil];
    [[self navigationItem] setBackBarButtonItem: newBackButton];
    [newBackButton release];
    
    // загружаем группы для данного города
    [DataModel findGroupsInCity:self.city withCompleteBlock:^(NSArray *array) {
        for (id group in array) {
            // проверяем нет ли уже этой группы в БД
            Group *searchedGroup = [Group findOneWithUID:[group valueForKey:@"id"]];
            if (!searchedGroup) {
                searchedGroup = [Group createOne];
                searchedGroup.name = [group valueForKey:@"name"];
                searchedGroup.serverId = [group valueForKey:@"id"];
            }
            [searchedGroup addCityObject:self.city];
        }
        if ([[[CoreDataStack sharedInstance] contextForCurrentThread] hasChanges]) {
            [[CoreDataStack sharedInstance] saveContextForCurrentThread];
        }
            [self allGroupsLoaded];
    }];    
}

- (void)allGroupsLoaded
{
    self.groups= [NSMutableArray arrayWithArray:[Group findAllWithCity:self.city]];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groups.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Group *group = [self.groups objectAtIndex:indexPath.row];
    return [self cellForGroup:group];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupViewController *groupVC = [[GroupViewController alloc] initWithStyle:UITableViewStyleGrouped];
    Group *group = [self.groups objectAtIndex:indexPath.row];
    groupVC.group = group;
    groupVC.city = self.city;
    [self.navigationController pushViewController:groupVC animated:YES];
    [groupVC release];
}

- (UITableViewCell *)cellForGroup:(Group *)group
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = group.name;
    return cell;
}

@end
