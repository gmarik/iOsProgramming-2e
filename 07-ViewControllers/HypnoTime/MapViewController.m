//
//  MapViewController.m
//  HypnoTime
//
//  Created by Marjan Hratson on 8/31/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"


@implementation MapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self tabBarItem] setTitle:@"Map"];
        [[self tabBarItem] setImage:[UIImage imageNamed:@"Hypno.png"]];
        
        locationManager = [[CLLocationManager alloc] init];
        [locationManager setDelegate:self];
    }
    return self;
}

- (void)dealloc
{
    [locationManager release];
    [mapView release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [locationManager startUpdatingLocation];
    mapView.showsUserLocation = YES;
    if ([locationManager location]) {
        NSLog(@"Location %@", [locationManager location]);
    }
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    NSLog(@"Unloading MapViewController's view");
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    [mapView release];
    mapView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    NSLog(@"NewLocation: %@", newLocation);

    // Blue dot won't be set properly in Simulator though
    // In simulator blue dot is always located at Cupertino, CA
    [mapView setCenterCoordinate:[newLocation coordinate] animated:YES];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([newLocation coordinate], 250,250);
    [mapView setRegion:region animated:true];

}


@end
