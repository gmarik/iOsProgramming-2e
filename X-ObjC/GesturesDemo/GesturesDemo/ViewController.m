//
//  ViewController.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RectView.h"


@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // it's required to have a base view before using any other
    // otherwise the one gets stretched to fill whole window
    // that's why View.xib got added
    // so this one could be used as intented with desired dimension
    [self.view addSubview:[[RectView alloc] init]];

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

    UIView *v = sender.view;
    
    v.transform = CGAffineTransformScale(v.transform, sender.scale, sender.scale);
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
    
    UIView *v = [self.view.subviews objectAtIndex:0];
    
    v.transform = CGAffineTransformRotate(v.transform, recognizer.rotation);
    recognizer.rotation = 0;
}

- (IBAction)onPan:(UIPanGestureRecognizer *)recognizer {
    NSLog(@"Pan");
    
    UIView *v = [self.view.subviews objectAtIndex:0];
    UIView *source = self.view;
    
    // Important to note where self.view and v are used
    CGPoint translation = [recognizer translationInView:source];
    v.center = CGPointMake(v.center.x + translation.x, 
                           v.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:source];
}
@end
