//
//  HeavyViewController.m
//  HeavyRotation
//
//  Created by Marjan Hratson on 9/7/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HeavyViewController.h"


@implementation HeavyViewController

// NOTE:
// - since default view controller implementation loads NIB file having same name as the
//   controller it's totally safe to remove all that
// - also yet there's no instance variables so no reason to owerride defaults

// allow autorotation
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)x {
    return (x == UIInterfaceOrientationPortrait) || UIInterfaceOrientationIsLandscape(x);
}

@end
