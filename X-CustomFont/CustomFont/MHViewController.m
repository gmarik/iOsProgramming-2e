//
//  MHViewController.m
//  CustomFont
//
//  Created by Marjan Hratson on 10/14/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MHViewController.h"

@implementation MHViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, 240, 40)];
    [label1 setFont: [UIFont fontWithName: @"Terminus" size:24]];
    [label1 setText:@"Terminus Font"];
    [[self view] addSubview:label1]; 
    
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 300, 40)];
    [label2 setFont: [UIFont fontWithName: @"JUNEBUG" size:24]];
    [label2 setText:@"Junebug Font"];
    [[self view] addSubview:label2]; 
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
