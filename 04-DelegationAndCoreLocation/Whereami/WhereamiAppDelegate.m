//
//  WhereamiAppDelegate.m
//  Whereami
//
//  Created by Marjan Hratson on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhereamiAppDelegate.h"

@implementation WhereamiAppDelegate


@synthesize window=_window;

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    NSLog(@"%@", newLocation);
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"%@", error);
}

- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading {
    NSLog(@"%@", newHeading);
}

// RunTime warning for declared but non-implemented method:
// Whereami[8415:207] -[WhereamiAppDelegate doSmthWeird]: unrecognized selector sent to instance 0x4e16120
//- (void)doSmthWeird {
//    NSLog(@"Debugger test 1");
//    NSLog(@"Debugger test 2");
//    NSLog(@"Debugger test 3");
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    // code for playing with debugger
    // [self doSmthWeird];
    
    // create init
    locationManager = [[CLLocationManager alloc] init];
    
    // set the delegate to receive updates
    // delegate is an object-oriented analogy for callbacks
    // since OO aproach deals with objects
    // an object(the delegate) has to be set responsible to receive messages(callbacks)
    // usually delegate is used to respond for more than one message
    // TODO: describe all Cocoa design-patterns
    [locationManager setDelegate: self];
    
    // and setup location manager
    [locationManager setDistanceFilter  :kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy :kCLLocationAccuracyBest];    

    // tell location manager to start looking up the location now
    [locationManager startUpdatingLocation];
    
    // 
    if ([CLLocationManager headingAvailable]) {
        //this setting is default
        //[locationManager setHeadingFilter:kCLHeadingFilterNone];
        [locationManager startUpdatingHeading];
    } else {
        NSLog(@"Heading service isn't available on this device");
    }
    
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
    // delegates usually do not get retained as they're not owned
    // if locationManger decides to retain its delegate (which is AppDelegate)
    // it will cause Retain Cycle 
    // (as AppDelegate owns locationManger)
    // leading to deallocation failure of both instances
    // that's why properties are declared without retain/copy attr, ie: @property (nonatomic, assign)  

    // Above makes delegate responsible for manual release management of its instance variables, ie
    // remove the delegate on location manager in case AppDelegate is still a delegate
    if ([locationManager delegate] == self)
        [locationManager setDelegate:nil];

    // and release location manager instance, as we own it
    [locationManager release];

    [_window release];
    [super dealloc];
}

@end
