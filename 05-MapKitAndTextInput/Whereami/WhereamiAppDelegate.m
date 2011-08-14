//
//  WhereamiAppDelegate.m
//  Whereami
//
//  Created by Marjan Hratson on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "WhereamiAppDelegate.h"
#import "MapPoint.h"

@implementation WhereamiAppDelegate


@synthesize window=_window;

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
    NSLog(@"%@", newLocation);
    [self foundLocation:newLocation];
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

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"%@", userLocation);
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([userLocation coordinate], 250,250);

//  MKCoordinateRegion region;
//  region.center = userLocation.coordinate;
//  MKCoordinateSpan span = {0.4, 0.4};
//  region.span = span;    
    [mapView setRegion:region animated:true];
}

// called when 'return' key pressed. return NO to ignore.
- (BOOL)textFieldShouldReturn:(UITextField *)tf {
    NSLog(@"%@",tf);
  
    [self findLocation];
  
    [tf resignFirstResponder];
  
    return YES;
}

// it doesn't actuall looks location up by name
// it just returns CurrentLocation for MapPoint to be used for MKAnnotationView
- (void)findLocation {
    [locationManager startUpdatingLocation];
    [activityIndicatorView startAnimating];
    [locationTitleField setHidden:YES];
}

- (void)foundLocation:(CLLocation *)loc {
    // create an instance of MapPoint with the current data
    rgeoc = [[MKReverseGeocoder alloc] initWithCoordinate:[loc coordinate]];
    rgeoc.delegate = self;
    [rgeoc start];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    locationManager = [[CLLocationManager alloc] init];
    
    [locationManager setDelegate: self];
    
    [locationManager setDistanceFilter  :kCLDistanceFilterNone];
    [locationManager setDesiredAccuracy :kCLLocationAccuracyBest];    

    //[locationManager startUpdatingLocation];
    
    // App is a delegate and handles messages from MapView
    [worldView setDelegate:self];
    
// Actually MKMapView doesn't really look location up on emulator
// it just shows Apple's HQ location at Infinite Loop instead
//    [worldView setShowsUserLocation:YES];
        
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

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark {
    
    NSString *title = [NSString stringWithFormat:@"%@, city: %@",[locationTitleField text], [placemark locality]];
    
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:[placemark coordinate] title:title];
    
    [worldView addAnnotation:mp];
    // release as MKMapView retains annotations
    [mp release];
    
    //Zoom
    MKCoordinateRegion reg = MKCoordinateRegionMakeWithDistance([placemark coordinate], 250, 250);
    [worldView setRegion:reg animated:YES];
    [activityIndicatorView stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
    
    // not needed anymore
    [rgeoc release];

    NSLog(@"Mark: %@",placemark);
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error {
    NSLog(@"Mark ERR: %@",error);
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
