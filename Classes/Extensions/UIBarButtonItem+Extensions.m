//
//  UIBarButtonItem+Extensions.m
//  Meloman
//
//  Created by vyacheslav artemev on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UIBarButtonItem+Extensions.h"

@implementation UIBarButtonItem (Extensions)

+ (UIBarButtonItem*)itemWithImage:(UIImage *)defaultImage
                    selectedImage:(UIImage *)selectedImage
                           target:(id)target
                           action:(SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:defaultImage forState:UIControlStateNormal];
    [button setBackgroundImage:selectedImage forState:UIControlStateSelected];
    button.frame = CGRectMake(0.0, 0.0, defaultImage.size.width, defaultImage.size.height);
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchDown];
    
    UIView *buttonWrapper = [[UIView alloc] initWithFrame:button.frame];
    [buttonWrapper addSubview:button];
    
    UIBarButtonItem *toReturn = [[UIBarButtonItem alloc] initWithCustomView:buttonWrapper];
    [buttonWrapper release];

    return [toReturn autorelease];
}

@end
