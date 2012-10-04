//
//  AppDelegate.h
//  Flowers
//
//  Created by admin on 21.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;;

@end


#define ApplicationDelegate() ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#define ApplicationDirectoryPath(DirectoryToSearch) ((NSString *)[NSSearchPathForDirectoriesInDomains(DirectoryToSearch, NSUserDomainMask, YES) objectAtIndex:0])
#define ApplicationDirectoryURL(DirectoryToSearch) ((NSURL *)[[[NSFileManager defaultManager] URLsForDirectory:DirectoryToSearch inDomains:NSUserDomainMask] lastObject])