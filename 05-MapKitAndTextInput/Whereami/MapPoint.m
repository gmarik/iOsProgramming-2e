//
//  MyClass.m
//  Whereami
//
//  Created by Marjan Hratson on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapPoint.h"


@implementation MapPoint

@synthesize coordinate, title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t {
    self = [self init];
    
    if (self) {
        coordinate = c;
        [self setTitle:t];
    }
    
    return self;
}

-(void)dealloc {
    
    // NOTE: coordinate isn't an Objective-C object so doesn't receive messages
    // the CLLocationCoordinate2D structure will be stored in memory inside each instance
    // of MapPoint and will be created/destroyed automatically along with the object
    [title release];
    [super dealloc];
}
@end
