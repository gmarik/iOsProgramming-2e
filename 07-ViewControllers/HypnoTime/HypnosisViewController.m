//
//  HypnosisViewController.m
//  HypnoTime
//
//  Created by Marjan Hratson on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HypnosisViewController.h"


@implementation HypnosisViewController
-(id)init {
    self = [super initWithNibName: nil
                           bundle: nil];

    if (self) {
        UITabBarItem *tbi = [self tabBarItem];
        [tbi setTitle:@"Hypnosis"];
        
        [tbi setImage:[UIImage imageNamed:@"Hypno.png"]];
    }

    return self;
}

-(id)initWithNibName:(NSString *)nibName bundle:(NSBundle *) bundle {
    return [self init];
}


-(void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"Loaded the view for HypnosisViewController");

    //set the background color
    [[self view] setBackgroundColor:[UIColor orangeColor]];
}
@end
