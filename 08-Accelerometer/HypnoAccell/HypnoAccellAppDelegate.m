//
//  HypnoAccellAppDelegate.m
//  HypnoAccell
//
//  Created by Marjan Hratson on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnoAccellAppDelegate.h"
#import "HypnosisView.h"

@implementation HypnoAccellAppDelegate


@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    HypnosisView *hv = [[HypnosisView alloc] initWithFrame:[self.window frame]];
    [self.window addSubview:hv];
    [hv release];

    //utilize accelerometer
    UIAccelerometer *acc = [UIAccelerometer sharedAccelerometer];
    [acc setUpdateInterval:0.1];
    [acc setDelegate:self];

    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
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

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

#pragma mark - UIAccelerometerDelegate

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)accel {
    NSLog(@"%f, %f, %f",[accel x], [accel y], [accel z]);
    
    HypnosisView *hv = [[self.window subviews] objectAtIndex:0];
    [hv setXShift:10 * [accel x]];
    [hv setYShift:-10 * [accel y]];
    
    [hv setNeedsDisplay];
}

@end
