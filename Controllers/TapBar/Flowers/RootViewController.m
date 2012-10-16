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
#import "BButton.h"

@interface RootViewController () <PagedFlowViewDelegate, PagedFlowViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, retain) IBOutlet UIButton *cityChooseButton; // used as dropdown
@property (nonatomic, retain) UIView *pickerPanelView; // used for picker
@property (nonatomic, retain) NSArray *pickerData; // Array to keep items of dropdown
@property (nonatomic, retain) IBOutlet UILabel *cityNameLabel; // to show selected name

- (IBAction)pickerSelected:(UIButton *)sender;

@property (nonatomic, retain) NSMutableArray *cities;
@property (nonatomic, retain) IBOutlet UIPageControl *hPageControl;
@property (nonatomic, retain) IBOutlet PagedFlowView *hFlowView;
@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) IBOutlet BButton *townNameButton;

- (IBAction)pageControlValueDidChange:(id)sender;
- (IBAction)townNameButtonTapped:(id)sender;
- (void)allCitiesLoaded;

@end

@implementation RootViewController

@synthesize cities = _cities, hPageControl, hFlowView,
    imageArray, townNameButton, cityChooseButton, cityNameLabel,
    pickerPanelView, pickerData;


- (IBAction)pickerSelected:(UIButton *)sender // calls when dropdown get pressed
{
	[UIView animateWithDuration:0.3f animations:^(void) {
        CGRect pickerPanelRect = self.pickerPanelView.frame;
        pickerPanelRect.origin.y -= pickerPanelRect.size.height;
        self.pickerPanelView.frame = pickerPanelRect;
    }];
}

- (void)doneClick { // calls when done button in toolbar get pressed
    [UIView animateWithDuration:0.3f animations:^(void) {
        CGRect pickerPanelRect = self.pickerPanelView.frame;
        pickerPanelRect.origin.y += pickerPanelRect.size.height;
        self.pickerPanelView.frame = pickerPanelRect;
    }];}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component //calls when any item gets select in picker
{
    self.cityNameLabel.text = [[pickerData objectAtIndex:row] name];
    [self.hFlowView scrollToPage:row];
}

#pragma mark -
#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
	return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
	return [pickerData count];
	
}
#pragma mark Picker Delegate Methods

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
	return [[pickerData objectAtIndex:row] name];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Выберите город";

    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                style:UIBarButtonItemStyleBordered
                                                               target:self
                                                               action:@selector(doneClick)];
    doneBtn.width = 60.0f;
    [toolbar setItems:[[[NSArray alloc] initWithObjects:doneBtn,nil] autorelease]];
    toolbar.barStyle = UIBarStyleBlackOpaque;
    [toolbar sizeToFit];    
    [doneBtn release];
    
    CGRect pickerFrame = CGRectMake(0.0f, 44.0f, 320.0f, 216.0f);
	UIPickerView *picker = [[UIPickerView alloc] initWithFrame:pickerFrame];
	picker.showsSelectionIndicator = YES;
	picker.dataSource = self;
	picker.delegate = self;
    
    self.pickerPanelView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 480.0f, 320.0f, 260.0f)];
    [self.pickerPanelView addSubview:toolbar];
    [self.pickerPanelView addSubview:picker];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.pickerPanelView];
    [toolbar release];
    [picker release];
    
    self.pickerData = [City findAll];
    
    self.townNameButton.color = [UIColor greenColor];
    self.townNameButton.tintColor = [UIColor blackColor];
    
    
    hFlowView.delegate = self;
    hFlowView.dataSource = self;
    hFlowView.pageControl = hPageControl;
    hFlowView.minimumPageAlpha = 0.3;
    hFlowView.minimumPageScale = 0.9;

    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle:@"Назад" style: UIBarButtonItemStyleBordered target: nil action: nil];
    [[self navigationItem] setBackBarButtonItem: newBackButton];
    [newBackButton release];
    self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Цветы" image:[UIImage imageNamed:@"tabbar_flower.png"] tag:1];
    
    City *oneCity;
    for (int i=1; i <= 3; i++) {
        oneCity = [City findOneWithUID:[NSString stringWithFormat:@"%i", i]];
        if (!oneCity) {
            oneCity = [City createOne];
            switch (i) {
                case 1:
                    oneCity.name = @"Казань";
                    break;
                case 2:
                    oneCity.name = @"Москва";
                    break;
                case 3:
                    oneCity.name = @"Питер";
                    break;
                default:
                    break;
            }
            oneCity.serverIdValue = i;
        }
    }
    [[CoreDataStack sharedInstance] saveContextForCurrentThread];
    self.cities = [NSMutableArray arrayWithArray:[City findAll]];
    self.imageArray = [[NSArray alloc] initWithObjects:@"kazan.png", @"moscow.png", @"piter.png", nil];
        
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
#ifndef DEBUG
#error Remove hard coded background setters
#endif
    self.hFlowView.backgroundColor = [UIColor clearColor];
    self.hPageControl.backgroundColor = [UIColor clearColor];
}

- (void)dealloc
{
    cityNameLabel = nil;
    cityChooseButton = nil;
    [pickerPanelView release];
	[pickerData release];
    [super dealloc];
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
    self.cityNameLabel.text = [[[City findAll] objectAtIndex:pageNumber] name];
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
    self.cityNameLabel.text = [[[City findAll] objectAtIndex:pageControl.currentPage] name];
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
