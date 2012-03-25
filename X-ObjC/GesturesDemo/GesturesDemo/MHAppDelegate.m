//
//  MHAppDelegate.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MHAppDelegate.h"
#import "ViewController.h"

@implementation MHAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window setBackgroundColor: UIColor.whiteColor]; 

    [self.window makeKeyAndVisible];
    return YES;
}

@end
