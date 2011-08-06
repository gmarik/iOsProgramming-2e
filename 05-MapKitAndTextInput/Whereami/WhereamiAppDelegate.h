//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by Marjan Hratson on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate> {

    CLLocationManager *locationManager;
    MKMapView *worldView;  // pointer to view instance displaying Map 
    UIActivityIndicatorView *activityIndicatorView;
    UITextField *locationTitleField;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
