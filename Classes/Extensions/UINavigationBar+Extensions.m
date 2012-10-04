//
//  UINavigationBar+Extensions.m
//  Meloman
//
//  Created by Arty on 8/22/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "UINavigationBar+Extensions.h"


@implementation UINavigationBar (Extensions)

- (void)drawRect:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"top_bar.png"];
    [image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end
