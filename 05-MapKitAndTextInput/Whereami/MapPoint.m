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
@end
