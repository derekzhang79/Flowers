//
//  ReviewOrderController.m
//  Flowers
//
//  Created by Danis Ziganshin on 10/9/12.
//
//

#import "ReviewOrderController.h"

#define RETURN_URL @"http://ReturnURL"
#define CANCEL_URL @"http://CancelURL"

@interface ReviewOrderController ()

@end

@implementation ReviewOrderController

@synthesize orderAmount, taxAmount, shippingAmount, amountLabel, numberLabel, forDeliveryLabel, descriptionLabel;
@synthesize shippingLabel, shippingAmountLabel, totalAmountLabel, subTotalLabel;
@synthesize topping1Label, topping1Price, topping2Label, topping2Price, topping3Label, topping3Price, topping4Label, topping4Price;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
