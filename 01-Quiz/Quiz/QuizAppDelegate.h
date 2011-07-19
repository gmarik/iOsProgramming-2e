//
//  QuizAppDelegate.h
//  Quiz
//
//  Created by Marjan Hratson on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuizAppDelegate : NSObject <UIApplicationDelegate> {
    int currentQuestionIndex;
    
    // main model objects
    NSMutableArray *questions;
    NSMutableArray *answers;
    
    //
    
    IBOutlet UILabel *questionField;
    IBOutlet UILabel *answerField;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

- (IBAction)showQuestion:(id)sender;
- (IBAction)showAnswer:(id)sender;

@end
