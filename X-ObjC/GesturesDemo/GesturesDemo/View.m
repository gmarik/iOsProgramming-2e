//
//  View.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
 CGRect bounds = [self bounds];
 
 CGPoint center;
 
 center.x = bounds.origin.x + bounds.size.width / 2.0;
 center.y = bounds.origin.y + bounds.size.height / 2.0;
 
 CGContextRef context = UIGraphicsGetCurrentContext();
 
 CGContextSetLineWidth(context, 1);
 
 CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
 
 CGRect r = CGRectMake(center.x - 50, center.y - 50, 100, 100);
 CGContextClearRect(context, rect);
 CGContextFillRect(context, r);

}

@end
