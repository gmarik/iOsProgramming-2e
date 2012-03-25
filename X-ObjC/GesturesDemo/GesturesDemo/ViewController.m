//
//  ViewController.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "View.h"


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView {
    self.view = [[View alloc] initWithFrame:CGRectZero];
    [self.view setBackgroundColor:UIColor.whiteColor];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] init];
    [pinch addTarget:self action:@selector(onPinch:)];
    [self.view addGestureRecognizer:pinch];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(onPan:)];
    [self.view addGestureRecognizer:pan];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] init];
    [rotate addTarget:self action:@selector(onRotate:)];
    [self.view addGestureRecognizer:rotate];

	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark Gesture Recognizers

- (void)onPinch:(UIPinchGestureRecognizer *)sender {

    self.view.transform = CGAffineTransformScale(self.view.transform, sender.scale, sender.scale);
    // THIS IS IMPORTANT
    // otherwise it scales with geometrical progression
    sender.scale = 1;
    
    if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Pinch Ended");
    } else if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Pinch Started");
    } else {
        NSLog(@"Pinched");
    }
    
}

- (void)onRotate:(UIRotationGestureRecognizer *)recognizer {
    
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (IBAction)onPan:(UIPanGestureRecognizer *)recognizer {
    NSLog(@"Pan");
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, 
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}
@end
