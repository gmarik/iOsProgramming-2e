//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Marjan Hratson on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView

- (void)drawRect:(CGRect) rect {
    CGRect bounds = [self bounds];
    
    CGPoint center;
    
    center.x = bounds.origin.x + bounds.size.width / 2.0;
    center.y = bounds.origin.y + bounds.size.height / 2.0;
    
    float maxRadius = hypot(bounds.size.width, bounds.size.height) /2.0;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 1);
    
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 1) {
        [[UIColor colorWithRed:(currentRadius / 256) green:(currentRadius / 256.0 + 0.4)  blue:0.3 alpha:0.5] setStroke];
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI * 2, YES);
        CGContextStrokePath(context);
    }
    
    
    NSString *text = @"I'm getting sleepy!";
    
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    
    CGRect textRect;
    textRect.size = [text sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width / 2.0;
    textRect.origin.y = center.y - textRect.size.height / 2.0;
    
    [[UIColor blackColor] setFill];
    
    //set the shadown to be offset 4 points right, 3 pts down,
    // dark gray and with a blur radius of 2 points
    CGSize offset = CGSizeMake(4, 3);
    CGColorRef color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    [text drawInRect:textRect withFont:font];
    
}


@end
