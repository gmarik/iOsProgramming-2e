//
//  HeavyRotationAppDelegate.m
//  HeavyRotation
//
//  Created by Marjan Hratson on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HeavyRotationAppDelegate.h"

@implementation HeavyRotationAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
