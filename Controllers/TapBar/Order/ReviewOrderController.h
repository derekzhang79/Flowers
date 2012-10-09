//
//  ReviewOrderController.h
//  Flowers
//
//  Created by Danis Ziganshin on 10/9/12.
//
//
#import <UIKit/UIKit.h>
#import "PayPal.h"
#import "OrderViewController.h"
#import "ECNetworkHandler.h"

//ExpressCheckoutResponseHandler is not part of the Express Checkout library and should
//generally not be used because doing the Express Checkout calls on the device requires
//that the merchant API credentials be stored in the executable, which is a security risk.
@interface ReviewOrderController : UIViewController <ExpressCheckoutResponseHandler> {
	float orderAmount;
	float taxAmount;
	float shippingAmount;
	
	IBOutlet UILabel *amountLabel;
	IBOutlet UILabel *numberLabel;
	IBOutlet UILabel *forDeliveryLabel;
	IBOutlet UILabel *descriptionLabel;
	IBOutlet UILabel *shippingLabel;
	IBOutlet UILabel *shippingAmountLabel;
	IBOutlet UILabel *totalAmountLabel;
	IBOutlet UILabel *topping1Label;
	IBOutlet UILabel *topping1Price;
	IBOutlet UILabel *topping2Label;
	IBOutlet UILabel *topping2Price;
	IBOutlet UILabel *topping3Label;
	IBOutlet UILabel *topping3Price;
	IBOutlet UILabel *topping4Label;
	IBOutlet UILabel *topping4Price;
	IBOutlet UILabel *taxAmountLabel;
	IBOutlet UILabel *subTotalLabel;
	
	//passed in from OrderViewController
//	PizzaSize pizzaSize;
//	NSArray *toppingsArray;
	
	//passed in from Order2ViewController
//	NSUInteger pizzaCount;
//	BOOL forDelivery;
}

@property (nonatomic, assign) float orderAmount;
@property (nonatomic, assign) float taxAmount;
@property (nonatomic, assign) float shippingAmount;

@property (nonatomic, retain) IBOutlet UILabel *amountLabel;
@property (nonatomic, retain) IBOutlet UILabel *numberLabel;
@property (nonatomic, retain) IBOutlet UILabel *forDeliveryLabel;
@property (nonatomic, retain) IBOutlet UILabel *descriptionLabel;
@property (nonatomic, retain) IBOutlet UILabel *shippingLabel;
@property (nonatomic, retain) IBOutlet UILabel *shippingAmountLabel;
@property (nonatomic, retain) IBOutlet UILabel *totalAmountLabel;
@property (nonatomic, retain) IBOutlet UILabel *subTotalLabel;
@property (nonatomic, retain) IBOutlet UILabel *topping1Label;
@property (nonatomic, retain) IBOutlet UILabel *topping1Price;
@property (nonatomic, retain) IBOutlet UILabel *topping2Label;
@property (nonatomic, retain) IBOutlet UILabel *topping2Price;
@property (nonatomic, retain) IBOutlet UILabel *topping3Label;
@property (nonatomic, retain) IBOutlet UILabel *topping3Price;
@property (nonatomic, retain) IBOutlet UILabel *topping4Label;
@property (nonatomic, retain) IBOutlet UILabel *topping4Price;

//@property (nonatomic, assign) PizzaSize pizzaSize;
//@property (nonatomic, retain) NSArray *toppingsArray;
//
//@property (nonatomic, assign) NSUInteger pizzaCount;
//@property (nonatomic, assign) BOOL forDelivery;

- (IBAction)Cancel;
- (IBAction)textFieldDoneEditing:(id)sender;
- (void)payWithPayPal;

@end
