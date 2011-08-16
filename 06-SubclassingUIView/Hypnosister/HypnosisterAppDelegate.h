//
//  HypnosisterAppDelegate.h
//  Hypnosister
//
//  Created by Marjan Hratson on 8/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"

@interface HypnosisterAppDelegate : NSObject <UIApplicationDelegate> {

    HypnosisView *view; 
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
