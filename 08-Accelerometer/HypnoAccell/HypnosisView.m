//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Marjan Hratson on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView

@synthesize xShift,yShift;

- (void)drawRect:(CGRect) rect {
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) /2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 10);
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [[UIColor grayColor] setStroke];
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2, YES);
        CGContextStrokePath(context);
    }
}


@end
