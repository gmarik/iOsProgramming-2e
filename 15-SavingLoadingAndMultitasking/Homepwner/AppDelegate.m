//
//  AppDelegate.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemsViewController.h"
#import "PosessionStore.h"
#import "ImageStore.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"%@", NSStringFromSelector(_cmd));

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ItemsViewController *itemsCtrlr = [[ItemsViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:itemsCtrlr];

    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];

    //    [c release];
    //    [nav release];    
    return YES;
}

-(void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [PosessionStore.defaultStore saveChanges];
}

-(void)applicationWillTerminate:(UIApplication *)application {
    // if iOS < 4
//    [self applicationDidEnterBackground:application];
}

-(void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [ImageStore.defaultStore clearCache];
}

-(void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
