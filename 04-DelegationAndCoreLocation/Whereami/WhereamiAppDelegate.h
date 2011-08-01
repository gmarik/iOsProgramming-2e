//
//  WhereamiAppDelegate.h
//  Whereami
//
//  Created by Marjan Hratson on 7/28/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

// Angle brackets<UIApplicationDelegate, CLLocationManagerDelegate> here list what protocols AppDelegate conforms to 
@interface WhereamiAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {

    CLLocationManager *locationManager;
    
}

//- (void)doSmthWeird;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
