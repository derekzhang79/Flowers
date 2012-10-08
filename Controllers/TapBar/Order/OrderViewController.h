//
//  OrderViewController.h
//  Flowers
//
//  Created by admin on 01.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaymentSelectingViewController.h"

@interface OrderViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITextField *address;
@property (nonatomic, retain) IBOutlet UITextField *date;
@property (nonatomic, retain) IBOutlet UITextField *from;
@property (nonatomic, retain) IBOutlet UITextField *to;
@property (nonatomic, retain) NSString *selectedPaymentMethod;

@end
