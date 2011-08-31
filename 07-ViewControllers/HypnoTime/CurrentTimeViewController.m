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
        // NOTE: never access/modify view in controller's a initialization method
        // on low-memory warnings view get destroyed but controller doesn't
        // so any changes made inside initialization method won't be applied for newly recreated views
      
        //sending `view` message loads view up
//      [[self view] setBackgroundColor:[UIColor yellowColor]];
    }
    
    return self;
}

// override this method to initialize timelabel
-(void)viewWillAppear:(BOOL)animated {
    NSLog(@"View will appear");
    [super viewWillAppear:animated];
    [self showCurrentTime:nil];
}

// this one overriden just for example
-(void)viewWillDisappear:(BOOL)animated {
    NSLog(@"view will disappear");
    [super viewWillDisappear:animated];
}

-(void)showCurrentTime:(id)sender {
    
    NSDate *now = [NSDate date];
    
    //static means "only once"
    // memory for this object is allocated before this method runs
    // but it's still required to create instance
    // NOTE: default nil assignment
    static NSDateFormatter *formatter = nil;
    
    if (!formatter) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setTimeStyle:NSDateFormatterShortStyle];
    }
    
    [timeLabel setText:[formatter stringFromDate:now]];
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


// all view modifications should be done in this method
// it's called every time view is loaded for each instance
-(void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Loaded CurrentTimeViewController view");
    [[self view] setBackgroundColor:[UIColor yellowColor]];
}
@end
