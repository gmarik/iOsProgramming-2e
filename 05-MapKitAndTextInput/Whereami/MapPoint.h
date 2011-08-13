//
//  MyClass.h
//  Whereami
//
//  Created by Marjan Hratson on 8/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"


@interface MapPoint : NSObject <MKAnnotation> {
}

- (id)initWithCoordinate: (CLLocationCoordinate2D)c title:(NSString *) t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

@end
