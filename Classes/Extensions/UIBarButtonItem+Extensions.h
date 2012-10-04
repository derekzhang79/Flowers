//
//  UIBarButtonItem+Extensions.h
//  Meloman
//
//  Created by vyacheslav artemev on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIBarButtonItem (Extensions)

+ (UIBarButtonItem*)itemWithImage:(UIImage *)defaultImage
                    selectedImage:(UIImage *)selectedImage
                           target:(id)target
                           action:(SEL)action;

@end
