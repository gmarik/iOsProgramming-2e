//
//  View.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RectView.h"

@implementation RectView

- (id)init
{
    self = [super initWithFrame:CGRectMake(20, 20, 150, 150)];
    if (self) {
        // Initialization code
        self.alpha = 0.4;
    }
    return self;
}

// dedicated initilzer implementation deliberately ignored

- (void)drawRect:(CGRect)rect
{
  
 CGContextRef context = UIGraphicsGetCurrentContext();
 CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor); 
 CGContextFillRect(context, rect);
    
}

@end
