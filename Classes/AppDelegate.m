//
//  AppDelegate.m
//  Flowers
//
//  Created by admin on 21.04.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

#import "RootViewController.h"
#import "BasketViewController.h"
#import "WishListViewController.h"
#import "SettingsViewController.h"

@interface AppDelegate ()
{
    NSMutableData *receivedData;
}
@end

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    [self.window makeKeyAndVisible];
    
    RootViewController *rootVC = [[[RootViewController alloc] init] autorelease];
    UINavigationController *rootNavController = [[[UINavigationController alloc] initWithRootViewController:rootVC] autorelease];
    
    WishListViewController *wishListVC = [[[WishListViewController alloc] initWithNibName:@"WishListViewController" bundle:nil] autorelease];
    UINavigationController *wishListNavController = [[[UINavigationController alloc] initWithRootViewController:wishListVC] autorelease];
    wishListVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Избранное" image:[UIImage imageNamed:@"tabbar_wishlist.png"] tag:2];
    
    BasketViewController *basketVC = [[[BasketViewController alloc] initWithNibName:@"BasketViewController" bundle:nil] autorelease];
    UINavigationController *basketNavController = [[[UINavigationController alloc] initWithRootViewController:basketVC] autorelease];
    basketVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Корзина" image:[UIImage imageNamed:@"tabbar_basket.png"] tag:3];
    
    SettingsViewController *settingsVC = [[SettingsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *settingsNavController = [[UINavigationController alloc] initWithRootViewController:settingsVC];
    settingsVC.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Настройки" image:[UIImage imageNamed:@"tabbar_settings.png"] tag:4];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:rootNavController, wishListNavController, basketNavController, settingsNavController, nil];
    self.window.rootViewController = self.tabBarController;
//    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/


@end
