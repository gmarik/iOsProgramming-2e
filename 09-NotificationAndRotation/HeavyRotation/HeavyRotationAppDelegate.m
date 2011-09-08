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
    
    UIDevice *device = [UIDevice currentDevice];

    [device beginGeneratingDeviceOrientationNotifications];
    
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    // observe orientation change notifications from the UI device
    [nc addObserver:self 
           selector:@selector(orientationChanged:) 
               name:UIDeviceOrientationDidChangeNotification 
             object:device];
    
    
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    return YES;
}

//notification callback
-(void)orientationChanged:(NSNotification *)note {
    
    NSLog(@"%@", note);
    
}

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

@end
