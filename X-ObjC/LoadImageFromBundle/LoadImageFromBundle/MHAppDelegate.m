//
//  MHAppDelegate.m
//  LoadImageFromBundle
//
//  Created by Marjan Hratson on 3/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MHAppDelegate.h"

@implementation MHAppDelegate

@synthesize window = _window;


// HOWDOI
// 1) i think I forgot how to associate window created in IB with appDelegate's window
//    A: see LoadImageFromBundle_withIBWindow project
// 2) how do I scroll image?
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  
    // too easy
    //UIImage *img = [UIImage  imageNamed:@"img.png"];
    // use Bundle to retrieve resource
    NSBundle *appBundle = [NSBundle mainBundle];
    NSString *path = [appBundle pathForResource:@"img" ofType:@"png"];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:path]; 
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    [imageView setAutoresizesSubviews:YES];
    [imageView setContentMode:UIViewContentModeCenter];
    
    [self.window addSubview:imageView];
    
    [self.window makeKeyAndVisible];
    return YES;
}
@end
