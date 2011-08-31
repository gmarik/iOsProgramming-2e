//
//  CurrentTimeViewController.h
//  HypnoTime
//
//  Created by Marjan Hratson on 8/29/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CurrentTimeViewController : UIViewController {
    // NOTE: When an object is connected via an outlet, it is retained by the object that has the outlet to it
    // For example, the timeLabel is an outlet of CurrentTimeViewController. 
    // Therefore, CurrentTimeViewController retains timeLabel.
    // A view is also retained by its superview, so timeLabel has a retain count of two 
    IBOutlet UILabel *timeLabel;
}
-(IBAction)showCurrentTime:(id)sender;

@end
