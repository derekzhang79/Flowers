//
//  OrderViewController.m
//  Flowers
//
//  Created by admin on 01.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OrderViewController.h"
#import "PaymentSelectingViewController.h"
#import "PaymentViewController.h"

@interface OrderViewController () <UIScrollViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIButton *paymentMethod;

- (IBAction)paymentMethodTapped:(UIButton *)sender;
- (IBAction)payButtonTapped:(id)sender;

@end

@implementation OrderViewController

@synthesize scrollView;

@synthesize address, date, from, to, paymentMethod, selectedPaymentMethod;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Заказ";
    if (!selectedPaymentMethod)
        selectedPaymentMethod = @"no";
    self.scrollView.contentSize = CGSizeMake(320.0f, 461.0f);
}

#pragma mark - UIButton actions

- (IBAction)paymentMethodTapped:(UIButton *)sender
{
    PaymentSelectingViewController *paymentSelectingVC = [[PaymentSelectingViewController alloc] init];
    paymentSelectingVC.paymentMethod = self.selectedPaymentMethod;
    [self.navigationController pushViewController:paymentSelectingVC animated:YES];
    [paymentSelectingVC release];
}

- (IBAction)payButtonTapped:(id)sender
{
    PaymentViewController *paymentVC = [[PaymentViewController alloc] init];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:paymentVC];
    [self presentModalViewController:navController animated:YES];
    [paymentVC release];
    [navController release];
}

@end
