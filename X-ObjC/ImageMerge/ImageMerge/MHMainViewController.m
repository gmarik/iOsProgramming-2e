//
//  MHMainViewController.m
//  ImageMerge
//
//  Created by Marjan Hratson on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MHMainViewController.h"

@implementation MHMainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        // http://stackoverflow.com/a/9209044/320273
        
        UIImage *bottomImage = [UIImage imageNamed:@"top.png"];
        UIImage *image = [UIImage imageNamed:@"base.png"];
        
        CGSize newSize = CGSizeMake(300, 600);
        UIGraphicsBeginImageContext( newSize );
        
        
        // Use existing opacity as is
        [bottomImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
        // Apply supplied opacity
        [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height) blendMode:kCGBlendModeNormal alpha:0.5];
        
        
        // Draw text
        [[UIColor blackColor] set];
        [[NSString stringWithString:@"Test"] drawAtPoint:CGPointMake(100, 100) withFont:[UIFont boldSystemFontOfSize:20]];
        
        
        _mergedImage = UIGraphicsGetImageFromCurrentImageContext();

        
        
        UIGraphicsEndImageContext();
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imageView.image = _mergedImage;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
