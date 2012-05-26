//
//  View.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RectView.h"

@implementation RectView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
//        self.backgroundColor = [UIColor redColor];
//        self.alpha = 0.4;
        self.opaque = NO;
    }
    return self;
}

// dedicated initilzer implementation deliberately ignored

- (void)drawRect:(CGRect)rect
{
  
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor); 
 CGContextFillRect(context, self.bounds);
 CGContextClearRect(context, CGRectMake(100, 100, 100, 100));
    
}

@end
