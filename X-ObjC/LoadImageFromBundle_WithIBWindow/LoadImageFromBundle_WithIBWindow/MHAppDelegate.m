//
//  MHAppDelegate.m
//  LoadImageFromBundle_WithIBWindow
//
//  Created by Marjan Hratson on 3/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MHAppDelegate.h"

@implementation MHAppDelegate

@synthesize window = _window, 
           imgView = _imgView;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 1) Set Custom Class of File's Owner to UIApplication
    // 2) Drop Object from UI library in IB
    // 3) Set Object's Custom Class to MHAppDelegate (so it becomes App Delegate)
    // 4) decorate MHAppDelegate window property with IBOutled
    // 5) remove programmatically created window assignment
    // 6) Connect App Delegate's window property with UIWindow in IB
    // 7) Connect File Owners's delegate with App Delegate
    // 8) Set Main Interface to Window in Summary Tab
    // 7) DONE!
    // http://www.trappers.tk/site/2011/06/16/mainwindow-xib/    
    
    // UIWindow gets loaded from Window.xib
    //
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    //self.window.backgroundColor = [UIColor whiteColor];
    
    NSBundle *b = [NSBundle mainBundle];
    
    NSString *imgPath = [b pathForResource:@"img" ofType:@"png"];
    UIImage *img = [[UIImage alloc] initWithContentsOfFile:imgPath];
    
    self.imgView.image = img;
    
    NSLog(@"%@", self.window.subviews);
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
