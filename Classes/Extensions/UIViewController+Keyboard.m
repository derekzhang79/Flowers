//
//  UIViewController+Keyboard.m
//  Meloman
//
//  Created by Arty on 8/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIViewController+Keyboard.h"


@implementation UIViewController (Keyboard)

- (void)dismissKeyboard {
	UITextField *tempTextField = [[UITextField alloc] initWithFrame:CGRectZero];
	[self.view addSubview:tempTextField];
	[tempTextField becomeFirstResponder];
	[tempTextField resignFirstResponder];
	[tempTextField removeFromSuperview];
	[tempTextField release];
}

@end
