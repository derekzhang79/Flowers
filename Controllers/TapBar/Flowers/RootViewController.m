//
//  MainViewController.m
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RootViewController.h"
#import "DataModel.h"
#import "CityViewController.h"
#import "City.h"

@interface RootViewController ()

@property (nonatomic, retain) NSMutableArray *cities;

- (UITableViewCell *)cellForCity:(City *)city;
- (void)allCitiesLoaded;

@end

@implementation RootViewController

@synthesize tableHeaderView = _toolbarView, cities = _cities;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Город"; 

    City *oneCity = [City findOneWithUID:@"1"];
    if (!oneCity) {
        oneCity = [City createOne];
        oneCity.name = @"Казань";
        oneCity.serverIdValue = 1;
        [[CoreDataStack sharedInstance] saveContextForCurrentThread];
    }
    self.cities = [NSMutableArray arrayWithArray:[City findAll]];
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style: UIBarButtonItemStyleBordered target: nil action: nil];
    [[self navigationItem] setBackBarButtonItem: newBackButton];
    [newBackButton release];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Цветы" image:[UIImage imageNamed:@"tabbar_flower.png"] tag:1];
    
    [DataModel findCitysWithCompleteBlock:^(NSArray *array) {
        for (id city in array) {
            // проверяем нет ли уже этого города в БД
            if (![City findOneWithUID:[city valueForKey:@"id"]]) {
                City *newCity = [City createOne];
                newCity.name = [city valueForKey:@"name"];
                newCity.serverId = [city valueForKey:@"id"];
            }
        }
        if ([[[CoreDataStack sharedInstance] contextForCurrentThread] hasChanges]) {
            [[CoreDataStack sharedInstance] saveContextForCurrentThread];
            [self allCitiesLoaded];
        }
    }];
}

- (void)allCitiesLoaded
{
    self.cities = [NSMutableArray arrayWithArray:[City findAll]];
    [self.tableView reloadData];
}

#pragma mark - UITableView delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    City *city = [self.cities objectAtIndex:indexPath.row];
    return [self cellForCity:city];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CityViewController *cityVC = [[CityViewController alloc] initWithStyle:UITableViewStyleGrouped];
    City *city = [self.cities objectAtIndex:indexPath.row];
    cityVC.city = city;
    [self.navigationController pushViewController:cityVC animated:YES];
    [cityVC release];
}

- (UITableViewCell *)cellForCity:(City *)city 
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
                                      reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = city.name;
    return cell;
}

@end
