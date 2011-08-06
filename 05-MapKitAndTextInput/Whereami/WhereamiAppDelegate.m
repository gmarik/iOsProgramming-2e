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

// handle additions of Annotation(s) sent by MapView instance
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
    NSLog(@"%@ : %@", mapView, views);
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager setDelegate: self];
    
    [locationManager setDistanceFilter  :kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy :kCLLocationAccuracyBest];    

    [locationManager startUpdatingLocation];
    
    // allocation
    worldView = [[MKMapView alloc] init];
    // App is a delegate and handles messages from MapView
    [worldView setDelegate:self];
    
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
    if ([locationManager delegate] == self)
        [locationManager setDelegate:nil];
 
    [locationManager release];

    [_window release];
    [super dealloc];
}

@end