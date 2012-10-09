//
//  ItemViewController.m
//  Flowers
//
//  Created by admin on 01.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemViewController.h"
#import "Item.h"
#import "OrderedItem.h"
#import "DLStarRatingControl.h"
#import "PagedFlowView.h"
#import <QuartzCore/QuartzCore.h>
#import "V8HorizontalPickerView.h"

@interface ItemViewController () <PagedFlowViewDelegate,PagedFlowViewDataSource, V8HorizontalPickerViewDataSource, V8HorizontalPickerViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UILabel *priceLabel;
@property (nonatomic, retain) IBOutlet PagedFlowView *hFlowView;
@property (nonatomic, retain) IBOutlet DLStarRatingControl *starRatingControl;
@property (nonatomic, retain) IBOutlet UIPageControl *hPageControl;
@property (nonatomic, retain) IBOutlet V8HorizontalPickerView *horizontalPickerView;
@property (nonatomic, retain) NSArray *imageArray;

- (IBAction)pageControlValueDidChange:(id)sender;

- (IBAction)addItemToBasket:(id)sender;
- (IBAction)addItemToFavorites:(id)sender;

@end

@implementation ItemViewController

@synthesize item = _item, imageArray;
@synthesize scrollView, priceLabel, starRatingControl, hFlowView, hPageControl, horizontalPickerView;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.item.name;
    UIBarButtonItem *newBackButton = [[UIBarButtonItem alloc] initWithTitle: @"Назад" style: UIBarButtonItemStyleBordered target: nil action: nil];
    [[self navigationItem] setBackBarButtonItem: newBackButton];
    [newBackButton release];
    
    self.imageArray = [[NSArray alloc] initWithObjects:@"flower_1.png",
                       @"flower_2.png",
                       @"flower_3.png",
                       @"flower_4.png",
                       @"flower_5.png", nil];    
    
    hFlowView.delegate = self;
    hFlowView.dataSource = self;
    hFlowView.pageControl = hPageControl;
    hFlowView.minimumPageAlpha = 0.3;
    hFlowView.minimumPageScale = 0.9;
    
    self.starRatingControl.backgroundColor = [UIColor clearColor];
    self.starRatingControl.rating = self.item.ratingValue;
    self.scrollView.contentSize = CGSizeMake(320.0f, 500.0f);
    self.priceLabel.text = [NSString stringWithFormat:@"%@ р.", self.item.price.stringValue];
    
    // number picker

	self.horizontalPickerView.delegate    = self;
	self.horizontalPickerView.dataSource  = self;
	self.horizontalPickerView.elementFont = [UIFont boldSystemFontOfSize:14.0f];
	self.horizontalPickerView.selectionPoint = CGPointMake(20, 0);
    [self.horizontalPickerView scrollToElement:0 animated:NO];
	// add carat or other view to indicate selected element
	UIImageView *indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator"]];
	self.horizontalPickerView.selectionIndicatorView = indicator;
	[indicator release];
    
	[self.scrollView addSubview:self.horizontalPickerView];
    
}

#pragma mark - UIButton actions

- (IBAction)addItemToBasket:(id)sender {
    OrderedItem *orderedItem = [OrderedItem findOneWithItemUID:self.item.serverId.stringValue];
    if (!orderedItem) {
        orderedItem = [OrderedItem createOne];
        orderedItem.item = self.item;
        orderedItem.serverId = self.item.serverId;
    }
    orderedItem.countValue = self.horizontalPickerView.currentSelectedIndex + 1;
    
    [[CoreDataStack sharedInstance] saveContextForCurrentThread];
}

- (IBAction)addItemToFavorites:(id)sender {
    self.item.inFavoritesValue = !self.item.inFavoritesValue;
    [[CoreDataStack sharedInstance] saveContextForCurrentThread];
}

////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark PagedFlowView Delegate
- (CGSize)sizeForPageInFlowView:(PagedFlowView *)flowView;{
    return CGSizeMake(200, 200);
}

- (void)didScrollToPage:(NSInteger)pageNumber inFlowView:(PagedFlowView *)flowView {
    NSLog(@"Scrolled to page # %d", pageNumber);
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

#pragma mark - V*HorizontalPickerViewDelegate

- (NSInteger)numberOfElementsInHorizontalPickerView:(V8HorizontalPickerView *)picker
{
    return 15;
}

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index {
    self.priceLabel.text = [NSString stringWithFormat:@"%d р.", (int)((index + 1) * self.item.priceValue)];
}

- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%i", index + 1];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
    if (index < 9)
        return 15;
    else
        return 20;
}


@end
