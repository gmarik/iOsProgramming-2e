//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by Marjan Hratson on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {

    CLLocationManager *locationManager;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
