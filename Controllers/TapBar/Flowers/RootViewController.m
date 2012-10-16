//
//  MainViewController.m
//  Flowers
//
//  Created by admin on 26.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "RootViewController.h"
#import "DataModel.h"
#import "CityViewController.h"
#import "City.h"
#import "PagedFlowView.h"

@interface RootViewController ()<PagedFlowViewDelegate, PagedFlowViewDataSource>

@property (nonatomic, retain) NSMutableArray *cities;
@property (nonatomic, retain) IBOutlet UIPageControl *hPageControl;
@property (nonatomic, retain) IBOutlet PagedFlowView *hFlowView;
@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) IBOutlet UIButton *townNameButton;

- (IBAction)pageControlValueDidChange:(id)sender;
- (IBAction)townNameButtonTapped:(id)sender;
- (void)allCitiesLoaded;

@end

@implementation RootViewController

@synthesize cities = _cities,
hPageControl, hFlowView, imageArray, townNameButton;

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Выберите город";
  hFlowView.delegate = self;
  hFlowView.dataSource = self;
  hFlowView.pageControl = hPageControl;
  hFlowView.minimumPageAlpha = 0.3;
  hFlowView.minimumPageScale = 0.9;
  self.imageArray = [[NSArray alloc] initWithObjects:@"kazan.png", @"moscow.png", @"piter", nil];
  
  
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
//  [self.tableView reloadData];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView {
  return CGSizeMake(300, 200);
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(PagedFlowView *)flowView {
  self.townNameButton.titleLabel.text = [self.imageArray objectAtIndex:pageNumber];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Datasource
//返回显示View的个数
- (NSInteger)numberOfPagesInFlowView:(PagedFlowView *)flowView{
  return [imageArray count];
}

//返回给某列使用的View
- (UIView *)flowView:(PagedFlowView *)flowView cellForPageAtIndex:(NSInteger)index{
  UIImageView *imageView = (UIImageView *)[flowView dequeueReusableCell];
  if (!imageView) {
    imageView = [[[UIImageView alloc] init] autorelease];
    imageView.layer.cornerRadius = 6;
    imageView.layer.masksToBounds = YES;
  }
  imageView.image = [UIImage imageNamed:[imageArray objectAtIndex:index]];
  return imageView;
}

- (IBAction)pageControlValueDidChange:(id)sender {
  UIPageControl *pageControl = sender;
  [hFlowView scrollToPage:pageControl.currentPage];
}


- (IBAction)townNameButtonTapped:(id)sender {
    CityViewController *cityVC = [[CityViewController alloc] initWithStyle:UITableViewStyleGrouped];
    City *city = [self.cities objectAtIndex:0];
    cityVC.city = city;
    [self.navigationController pushViewController:cityVC animated:YES];
    [cityVC release];
}

//#pragma mark - UITableView delegate
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//  return self.cities.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  
//  City *city = [self.cities objectAtIndex:indexPath.row];
//  return [self cellForCity:city];
//}
//
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  CityViewController *cityVC = [[CityViewController alloc] initWithStyle:UITableViewStyleGrouped];
//  City *city = [self.cities objectAtIndex:indexPath.row];
//  cityVC.city = city;
//  [self.navigationController pushViewController:cityVC animated:YES];
//  [cityVC release];
//}


@end
