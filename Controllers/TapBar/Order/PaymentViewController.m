//
//  PaymentViewController.m
//  Flowers
//
//  Created by admin on 13.05.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PaymentViewController.h"
#import <BlocksKit/BlocksKit.h>
#import "PayPal.h"

@interface PaymentViewController () <UIWebViewDelegate>

@property (nonatomic, retain) UIWebView *webView;

@end

@implementation PaymentViewController

@synthesize webView;

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] init];
    self.webView.delegate = self;
    self.view = self.webView;
    
//    NSURL *imaladecLink = [NSURL URLWithString:@"http://m.paypal.com"];
//    [self.webView loadRequest:[NSURLRequest requestWithURL:imaladecLink]];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(dismissYourself)];
}

- (void)dismissYourself
{
    [self.webView stopLoading];
    [self dismissModalViewControllerAnimated:YES];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

#pragma mark - UIWebView delegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    if (error.code != -999) {
        UIAlertView *alertView = [UIAlertView alertViewWithTitle:@"Ошибка!" message:@"У тебя кончился интернет."];
        [alertView setCancelButtonWithTitle:@"ОК" handler:nil];
        [alertView show];
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)dealloc
{
    self.webView = nil;
    [super dealloc];
}

@end
