//
//  PaymentSelectingViewController.m
//  Flowers
//
//  Created by admin on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaymentSelectingViewController.h"

#define darkBlueColor [UIColor colorWithRed:60.0f/255.0f green:131.0f/255.0f blue:194.0f/255.0f alpha:1.0f]

@interface PaymentSelectingViewController ()

@property (nonatomic, retain) NSArray *arrayWithPaymentMethods;

@end

@implementation PaymentSelectingViewController

@synthesize arrayWithPaymentMethods, paymentMethod, delegate;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrayWithPaymentMethods = [NSArray arrayWithObjects:@"WebMoney", @"Yandex", @"VISA", @"Master card", nil];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    cell.textLabel.text = [arrayWithPaymentMethods objectAtIndex:indexPath.row];
    if (indexPath.row == (int)self.paymentMethod) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        cell.textLabel.textColor = darkBlueColor;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UITableViewCell *cell in tableView.visibleCells) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor blackColor];
    }
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setSelected:NO animated:YES];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.textLabel.textColor = darkBlueColor;
    paymentMethod = (PaymentMethod)indexPath.row;
    [self.delegate setNewPymentMethod:paymentMethod];
}

@end
