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

@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate, MKReverseGeocoderDelegate> {

    MKReverseGeocoder *rgeoc;
    CLLocationManager *locationManager;
    IBOutlet MKMapView *worldView;  // pointer to view instance displaying Map 
    IBOutlet UIActivityIndicatorView *activityIndicatorView;
    IBOutlet UITextField *locationTitleField;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

-(void)findLocation;
-(void)foundLocation:(CLLocation*)loc;

@end
