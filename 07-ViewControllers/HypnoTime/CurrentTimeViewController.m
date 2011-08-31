//
//  CurrentTimeViewController.m
//  HypnoTime
//
//  Created by Marjan Hratson on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CurrentTimeViewController.h"


@implementation CurrentTimeViewController
-(id) init {
    self = [super initWithNibName: nil
                           bundle: nil];
    
    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Time"];

        [tbi setImage:[UIImage imageNamed:@"Time.png"]];
    }
    
    return self;
}

// is used to associate controller and XIB file (nibName)
// so there are 3 options:
// 1) use nibName to set the XIB name
// 2) use nil to set default one (controller's name is used)
// 3) ig none above worked we can still associate it using IB (setting File's owner)
-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *) bundle {
    return [self init];
}

// default implementation is used with XIB, so it should be overriden in that case
// programmatical view creation requires this overriden
//-(void)loadView {
//}


-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Loaded the view for HypnosisViewController");
}
@end
