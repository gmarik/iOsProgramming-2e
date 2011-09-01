//
//  MapViewController.h
//  HypnoTime
//
//  Created by Marjan Hratson on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapKit/MapKit.h"
#import "CoreLocation/CoreLocation.h"

// Was getting error
// cannot decode object of class (MKMapView)
// SOLUTION: link MapKit.framework in App/Targets/BuildPhases/Link Binary with libraries

@interface MapViewController : UIViewController <CLLocationManagerDelegate> {
    IBOutlet MKMapView *mapView;
    CLLocationManager *locationManager;
}

@end
