//
//  ItemViewController.m
//  Flowers
//
//  Created by admin on 01.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ItemViewController.h"
#import "Item.h"
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
@property (nonatomic, retain) NSArray *imageArray;
@property (nonatomic, retain) IBOutlet V8HorizontalPickerView *horizontalPickerView;

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
    
    CGFloat margin = 5.0f;
	CGFloat width = 205.0f;
	CGFloat pickerHeight = 40.0f;
	CGFloat x = margin;
	CGFloat y = 300.0f;
	CGRect tmpFrame = CGRectMake(x, y, width, pickerHeight);
    
    self.horizontalPickerView = [[V8HorizontalPickerView alloc] initWithFrame:tmpFrame];
	self.horizontalPickerView.backgroundColor   = [UIColor clearColor];
	self.horizontalPickerView.selectedTextColor = [UIColor blackColor];
	self.horizontalPickerView.textColor   = [UIColor grayColor];
	self.horizontalPickerView.delegate    = self;
	self.horizontalPickerView.dataSource  = self;
	self.horizontalPickerView.elementFont = [UIFont boldSystemFontOfSize:14.0f];
	self.horizontalPickerView.selectionPoint = CGPointMake(60, 0);
    
	// add carat or other view to indicate selected element
	UIImageView *indicator = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"indicator"]];
	self.horizontalPickerView.selectionIndicatorView = indicator;
	[indicator release];
    
	// add gradient images to left and right of view if desired
	UIImageView *leftFade = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"left_fade"]];
	self.horizontalPickerView.leftEdgeView = leftFade;
	[leftFade release];
    
	UIImageView *rightFade = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"right_fade"]];
	self.horizontalPickerView.rightEdgeView = rightFade;
	[rightFade release];
    
	// add image to left of scroll area
	UIImageView *leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loopback"]];
	self.horizontalPickerView.leftScrollEdgeView = leftImage;
	[leftImage release];
	self.horizontalPickerView.scrollEdgeViewPadding = 20.0f;
    
	UIImageView *rightImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"airplane"]];
	self.horizontalPickerView.rightScrollEdgeView = rightImage;
	[rightImage release];
    
	[self.scrollView addSubview:self.horizontalPickerView];
    [self.horizontalPickerView scrollToElement:1 animated:YES];
    
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.horizontalPickerView scrollToElement:0 animated:NO];
}

- (IBAction)addItemToBasket:(id)sender {
    self.item.inBasketValue = !self.item.inBasketValue;
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
    return 10;
}

- (void)horizontalPickerView:(V8HorizontalPickerView *)picker didSelectElementAtIndex:(NSInteger)index {
    self.priceLabel.text = [NSString stringWithFormat:@"%d р.", (int)(index * self.item.priceValue)];
}

- (NSString *)horizontalPickerView:(V8HorizontalPickerView *)picker titleForElementAtIndex:(NSInteger)index {
    return [NSString stringWithFormat:@"%i", index];
}

- (NSInteger) horizontalPickerView:(V8HorizontalPickerView *)picker widthForElementAtIndex:(NSInteger)index {
    return 15;
}


@end
