//
//  ReviewOrderViewController.m
//
//  This is the review screen.
//  Here you review the order and decide if you want to change anything, then pay or cancel.
//

#import "ReviewOrderViewController.h"
#import "PayPal.h"
#import "PaymentViewController.h"
#import "SetExpressCheckoutRequestDetails.h"
#import "PaymentViewController.h"
#import "WebViewController.h"

#define RETURN_URL @"http://ReturnURL"
#define CANCEL_URL @"http://CancelURL"

#define SMALL_PRICE 5.99
#define MEDIUM_PRICE 7.99
#define LARGE_PRICE 9.99

@implementation ReviewOrderViewController

@synthesize orderAmount, taxAmount, shippingAmount, amountLabel, forDelivery, numberLabel, forDeliveryLabel, descriptionLabel;
@synthesize shippingLabel, shippingAmountLabel, toppingsArray, pizzaCount, totalAmountLabel, subTotalLabel, pizzaSize;
@synthesize topping1Label, topping1Price, topping2Label, topping2Price, topping3Label, topping3Price, topping4Label, topping4Price;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.title = @"Review your order";
	
	//compute total and build description
	NSMutableString *buf = [NSMutableString string];
	[buf appendFormat:@"%u ", pizzaCount];
	switch (pizzaSize) {
		case SIZE_SMALL:
			orderAmount = SMALL_PRICE;
			[buf appendString:@"Small"];
			break;
		case SIZE_MEDIUM:
			orderAmount = MEDIUM_PRICE;
			[buf appendString:@"Medium"];
			break;
		case SIZE_LARGE:
			orderAmount = LARGE_PRICE;
			[buf appendString:@"Large"];
			break;
	}
	[buf appendString:@" Pizza"];
	if (pizzaCount > 1) {
		[buf appendString:@"s"];
	}
	descriptionLabel.text = buf;
	
	amountLabel.text = [NSString stringWithFormat:@"$%.2f", orderAmount * pizzaCount];
	
	orderAmount += toppingsArray.count; //$1 per topping, per pizza
	orderAmount *= pizzaCount;
	
	taxAmount = orderAmount * .06;
	shippingAmount = forDelivery ? [[shippingAmountLabel.text substringFromIndex:1] floatValue] : 0.0f;
	
	subTotalLabel.text = [NSString stringWithFormat:@"$%.2f",orderAmount];
	taxAmountLabel.text = [NSString stringWithFormat:@"$%.2f",taxAmount];
	totalAmountLabel.text = [NSString stringWithFormat:@"$%.2f",orderAmount + taxAmount + shippingAmount];
	
	forDeliveryLabel.text = forDelivery ? @"Delivery" : @"Pick Up";
	shippingLabel.hidden = shippingAmountLabel.hidden = !forDelivery;
	
	//display the applicable topping strings
	UILabel *toppingLabels[4];
	toppingLabels[0] = topping1Label;
	toppingLabels[1] = topping2Label;
	toppingLabels[2] = topping3Label;
	toppingLabels[3] = topping4Label;
	
	UILabel *toppingPrices[4];
	toppingPrices[0] = topping1Price;
	toppingPrices[1] = topping2Price;
	toppingPrices[2] = topping3Price;
	toppingPrices[3] = topping4Price;
	
	for (int i = 0; i < toppingsArray.count; i++) {
		toppingLabels[i].hidden = toppingPrices[i].hidden = FALSE;
		toppingLabels[i].text = [toppingsArray objectAtIndex:i];
		toppingPrices[i].text = [NSString stringWithFormat:@"$%d.00", pizzaCount];
	}
    [[PayPal getPayPalInst] fetchDeviceReferenceTokenWithAppID:@"APP-80W284485P519543T" forEnvironment:ENV_SANDBOX withDelegate:self];
	UIButton *button = [[PayPal getPayPalInst] getPayButtonWithTarget:self andAction:@selector(payWithPayPal) andButtonType:BUTTON_278x43];
	CGRect theRect = button.frame;
	
	if ([[UIDevice currentDevice] respondsToSelector:@selector(userInterfaceIdiom)]) {
		if ([[UIDevice currentDevice] userInterfaceIdiom] == 1) {
			theRect = CGRectMake(self.view.frame.size.width / 2 - button.frame.size.width / 2 , 267, button.frame.size.width, button.frame.size.height);
		}
		else {
			theRect = CGRectMake(20, 267, button.frame.size.width, button.frame.size.height);
		}
	}
	else {
		theRect = CGRectMake(20, 267, button.frame.size.width, button.frame.size.height);
	}
	
	for (UIView *v in button.subviews) {
		if ([v isKindOfClass:[UIButton class]]) {
			theRect.origin.y -= (button.frame.size.height - v.frame.size.height);
			break;
		}
	}
	
	button.frame = theRect;
	[self.view addSubview:button];
}

#pragma mark -
#pragma mark DeviceReferenceTokenDelegate methods

//This method is called when a device reference token has been successfully fetched.
- (void)receivedDeviceReferenceToken:(NSString *)token {
	//store the token for later use
	[ECNetworkHandler sharedInstance].deviceReferenceToken = token;

}

//This method is called when a device reference token could not be fetched.
- (void)couldNotFetchDeviceReferenceToken {
	//optionally check the errorMessage property to see what the problem was
	NSLog(@"DEVICE REFERENCE TOKEN ERROR: %@", [PayPal getPayPalInst].errorMessage);
	
	//clear any previously-stored token
	[ECNetworkHandler sharedInstance].deviceReferenceToken = @"";
}


-(void)payWithPayPal {
	//In this example, we do the Express Checkout calls completely on the device.  This is not recommended because
	//it requires the merchant API credentials to be stored in the app on the device, and this is a security risk.
	[ECNetworkHandler sharedInstance].username = @"mly_1276123957_biz_api1.openpathproducts.com";
	[ECNetworkHandler sharedInstance].password = @"1276123964";
	[ECNetworkHandler sharedInstance].signature = @"APEsBweSZIQunluHsT2Zjs4p75HuAHSGJYlqMl76Iame-9BelVWpIj2v";
	[ECNetworkHandler sharedInstance].userAction = ECUSERACTION_COMMIT; //user completes payment on paypal site
	
	SetExpressCheckoutRequestDetails *sreq = [[[SetExpressCheckoutRequestDetails alloc] init] autorelease];
	PaymentDetails *paymentDetails = [[[PaymentDetails alloc] init] autorelease];
	[sreq addPaymentDetails:paymentDetails];

	if (!forDelivery) {
		sreq.NoShipping = DO_NOT_DISPLAY_SHIPPING;
	}
	sreq.ReturnURL = RETURN_URL;
	sreq.CancelURL = CANCEL_URL;
	
	paymentDetails.OrderTotal = orderAmount + taxAmount + shippingAmount;
	paymentDetails.ItemTotal = orderAmount;
	paymentDetails.TaxTotal = taxAmount;
	paymentDetails.ShippingTotal = shippingAmount;
	paymentDetails.OrderDescription = descriptionLabel.text;
	paymentDetails.NoteText = descriptionLabel.text;
	
	NSMutableString *itemName = [NSMutableString string];
	float pizzaCost = 0;
	switch (pizzaSize) {
		case SIZE_SMALL:
			pizzaCost = SMALL_PRICE;
			[itemName appendString:@"Small"];
			break;
		case SIZE_MEDIUM:
			pizzaCost = MEDIUM_PRICE;
			[itemName appendString:@"Medium"];
			break;
		case SIZE_LARGE:
			pizzaCost = LARGE_PRICE;
			[itemName appendString:@"Large"];
			break;
	}
	[itemName appendString:@" Pizza"];
	
	NSMutableString *description = nil;
	if (toppingsArray.count > 0) {
		description = [NSMutableString stringWithString:itemName];
		pizzaCost += toppingsArray.count;
		[description appendFormat:@" + %@", [toppingsArray objectAtIndex:0]];
		for (int i = 1; i < toppingsArray.count; i++) {
			[description appendFormat:@", %@", [toppingsArray objectAtIndex:i]];
		}
	}
	
	for (int i = 0; i < pizzaCount; i++) {
		PaymentDetailsItem *paymentDetailsItem = [[[PaymentDetailsItem alloc] init] autorelease];
		paymentDetailsItem.Name = itemName;
		paymentDetailsItem.Amount = pizzaCost;
		paymentDetailsItem.Description = description;
		[paymentDetails addPaymentDetailsItem:paymentDetailsItem];
	}
	
	//Call setExpressCheckout.  The response will be handled below in the expressCheckoutResponseReceived: method.
	[[ECNetworkHandler sharedInstance] setExpressCheckoutWithRequest:sreq withDelegate:self];
}

-(IBAction)Cancel {
	[self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
	[sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	self.forDeliveryLabel = nil;
	self.descriptionLabel = nil;
	self.shippingLabel = nil;
	self.shippingAmountLabel = nil;
	self.totalAmountLabel = nil;
	self.subTotalLabel = nil;
	self.numberLabel = nil;
	self.amountLabel = nil;
	self.toppingsArray = nil;
    [super dealloc];
}


#pragma mark -
#pragma mark ExpressCheckoutResponseHandler methods

//In this example, we do the Express Checkout calls completely on the device.  This is not recommended because
//it requires the merchant API credentials to be stored in the app on the device, and this is a security risk.
- (void)expressCheckoutResponseReceived:(NSObject *)response {
	if ([response isKindOfClass:[NSError class]]) {
		//If we get back an error, display an alert.
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Payment failed" 
														message:[(NSError *)response localizedDescription]
													   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
		[alert show];
		[alert release];
	} else if ([response isKindOfClass:[NSString class]]) { //got back token
		//The response from setExpressCheckout is an Express Checkout token.  The ECNetworkHandler class stores
		//this token for us, so we do not have to pass it back in.  Redirect to PayPal's login page.
		[self.navigationController pushViewController:[[[WebViewController alloc] initWithURL:[ECNetworkHandler sharedInstance].redirectURL
																					returnURL:RETURN_URL
																					cancelURL:CANCEL_URL] autorelease]
											 animated:TRUE];
	}
}


@end
