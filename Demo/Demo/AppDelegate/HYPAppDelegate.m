//
//  HYPAppDelegate.m
//  Demo
//
//  Created by Elvis Nunez on 4/15/14.
//  Copyright (c) 2014 Hyper. All rights reserved.
//

#import "HYPAppDelegate.h"
#import "HYPMainViewController.h"
#import "HYPLocalNotificationManager.h"

@implementation HYPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    HYPMainViewController *mainController = [[HYPMainViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainController];
    self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    // Make sure to handle the notification if the app is open too. (:
}

@end