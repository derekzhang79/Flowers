//
//  PaymentSelectingViewController.m
//  Flowers
//
//  Created by admin on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaymentSelectingViewController.h"

@implementation PaymentSelectingViewController
@synthesize arrayWithPaymentMethods, paymentMethod;


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrayWithPaymentMethods = [NSArray arrayWithObjects:@"WebMoney", @"Yandex.деньги", @"VISA", @"Master card", nil];
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
    cell.accessoryView = UITableViewCellAccessoryNone;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    for (UITableViewCell *cell in [tableView visibleCells]) {
        cell.accessoryView = UITableViewCellAccessoryNone;
    }
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    paymentMethod = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    [self.navigationController popViewControllerAnimated:YES];
}

@end
