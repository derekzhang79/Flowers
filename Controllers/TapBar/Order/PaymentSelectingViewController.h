//
//  PaymentSelectingViewController.h
//  Flowers
//
//  Created by admin on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PaymentMethodWebMoney,
    PaymentMethodYandex_money,
    PaymentMethodVISA,
    PaymentMethodMaster_card
} PaymentMethod;

@protocol PaymentSelectingDelegate <NSObject>
@required
- (void)setNewPymentMethod:(PaymentMethod)paymentMethod;
@end

@interface PaymentSelectingViewController : UITableViewController

@property (nonatomic) PaymentMethod paymentMethod;
@property (nonatomic, assign) id<PaymentSelectingDelegate> delegate;

@end
