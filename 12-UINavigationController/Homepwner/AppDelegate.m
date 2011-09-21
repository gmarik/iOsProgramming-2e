//
//  AppDelegate.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "ItemsViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    ItemsViewController *itemsCtrlr = [[ItemsViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:itemsCtrlr];
    [self.window setRootViewController:nav];
    
//    [c release];
//    [nav release];
    
    return YES;
}

@end
