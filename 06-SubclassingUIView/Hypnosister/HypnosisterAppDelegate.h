//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Marjan Hratson on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

// forward class declaration
// they say it speeds compilation up
@class HypnosisView;

@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate, UIScrollViewDelegate> {

    HypnosisView *view; 
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
