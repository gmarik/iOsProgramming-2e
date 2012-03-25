//
//  ViewController.m
//  GesturesDemo
//
//  Created by Marjan Hratson on 3/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "View.h"

@interface ViewController ()

@end

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
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] init];
    [pinch addTarget:self action:@selector(onPinch:)];
    [self.view addGestureRecognizer:pinch];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(onPan:)];
    
    [self.view addGestureRecognizer:pan];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    NSLog(@"Pan");
/* 
    CGPoint translate = [sender translationInView:self.view];
    
    CGRect newFrame = currentImageFrame;
    newFrame.origin.x += translate.x;
    newFrame.origin.y += translate.y;
    sender.view.frame = newFrame;
    
    if (sender.state == UIGestureRecognizerStateEnded)
        currentImageFrame = newFrame;
 */
}
@end
