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
@synthesize stripeColor;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setStripeColor:[UIColor lightGrayColor]];
    }
    return self;
}

- (void)drawRect:(CGRect) rect {
    CGRect bounds = [self bounds];
    
    [self setBackgroundColor:[UIColor greenColor]];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) /2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 10);
    
    [stripeColor setStroke];

    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        center.x += self.xShift;
        center.y += self.yShift;
        
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2, YES);
        CGContextStrokePath(context);
    }
}

-(void)dealloc {
    [self.stripeColor release];
    [super dealloc];
}

@end
