//
//  PaymentSelectingViewController.h
//  Flowers
//
//  Created by admin on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PaymentSelectingViewController : UITableViewController
{
    NSArray *arrayWithPaymentMethods;
    NSString *paymentMethod;
}

@property (nonatomic, retain) NSArray *arrayWithPaymentMethods;
@property (nonatomic, retain) NSString *paymentMethod;

@end
