//
//  AppDelegate.m
//  CTRNavigationControllerExampleWithoutStoryboard
//
//  Created by hokuron on 2013/01/24.
//  Copyright (c) 2013年 Takuma Shimizu. All rights reserved.
//

#import "AppDelegate.h"

#import "CTRNavigationController.h"

#import "MasterViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.

    MasterViewController *masterViewController = [[MasterViewController alloc] initWithNibName:@"MasterViewController" bundle:nil];
    self.navigationController = [[CTRNavigationController alloc] initWithRootViewController:masterViewController andScrollView:masterViewController.tableView];
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];

    
    NSDictionary *attrs = @{
    UITextAttributeFont            : [UIFont fontWithName:@"Thonburi" size:24.0f],
    UITextAttributeTextColor       : [UIColor colorWithWhite:0.122 alpha:1.000],
    UITextAttributeTextShadowColor : [UIColor clearColor],
	};
    
	[[UINavigationBar appearance] setTitleTextAttributes:attrs];
	[[UINavigationBar appearance] setTintColor:[UIColor colorWithWhite:0.933 alpha:1.000]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
