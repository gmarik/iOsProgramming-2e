//
//  MHAppDelegate.m
//  ImageMerge
//
//  Created by Marjan Hratson on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MHAppDelegate.h"
#import "MHMainViewController.h"

@implementation MHAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[MHMainViewController alloc] init];
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
