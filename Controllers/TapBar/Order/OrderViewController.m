//
//  OrderViewController.m
//  Flowers
//
//  Created by admin on 01.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OrderViewController.h"
#import "PaymentSelectingViewController.h"
#import "ReviewOrderViewController.h"

@interface OrderViewController () <UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, PaymentSelectingDelegate, UITextFieldDelegate>
{
    UITableViewCell *paymentMethodCell;
    UITableViewCell *payCell;
}


@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic) PaymentMethod paymentMethod;
@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *arrayWithPaymentMethods;


@end

@implementation OrderViewController

@synthesize address, date, from, to,
    selectedPaymentMethod, scrollView, paymentMethod = _paymentMethod,
    tableView = _tableView, arrayWithPaymentMethods;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Заказ";
    if (!selectedPaymentMethod)
        selectedPaymentMethod = @"no";
    self.paymentMethod = PaymentMethodVISA;
    self.scrollView.contentSize = CGSizeMake(320.0f, 461.0f);
    self.arrayWithPaymentMethods = [NSArray arrayWithObjects:@"WebMoney", @"Yandex", @"VISA", @"Master card", nil];
    
    paymentMethodCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    paymentMethodCell.textLabel.text = @"Способ оплаты";
    paymentMethodCell.detailTextLabel.text = [self.arrayWithPaymentMethods objectAtIndex:self.paymentMethod];
    paymentMethodCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    payCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    payCell.textLabel.text = @"Подробнее";
    payCell.textLabel.textAlignment = UITextAlignmentCenter;
}

- (void)dealloc
{
    arrayWithPaymentMethods = nil;
    _tableView = nil;
    scrollView = nil;
    [paymentMethodCell release];
    [payCell release];
    [super dealloc];
}

#pragma mark - Set new Payment method

- (void)setNewPymentMethod:(PaymentMethod)paymentMethod
{
    self.paymentMethod = paymentMethod;
    [self.tableView reloadData];
}

#pragma mark - UITextField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

#pragma mark - UTableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        return paymentMethodCell;
    else
        return payCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        PaymentSelectingViewController *paymentSelectingVC = [[PaymentSelectingViewController alloc] init];
        paymentSelectingVC.paymentMethod = self.paymentMethod;
        paymentSelectingVC.delegate = self;
        [self.navigationController pushViewController:paymentSelectingVC animated:YES];
        [paymentSelectingVC release];
    } else {
        [self reviewOrder];
    }
    [[tableView cellForRowAtIndexPath:indexPath] setSelected:NO animated:YES];
}


#pragma mark - Review order
- (void)reviewOrder {
    ReviewOrderViewController *reviewOrderVC = [[ReviewOrderViewController alloc] init];
    [self.navigationController pushViewController:reviewOrderVC animated:YES];
    [reviewOrderVC release];
}

@end
