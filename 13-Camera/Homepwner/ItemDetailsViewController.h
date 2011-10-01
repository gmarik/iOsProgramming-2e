//
//  ItemDetailsViewController.h
//  Homepwner
//
//  Created by Marjan Hratson on 9/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Posession.h"

// TIP: 
// Option-click on *.h file to open in assistant editor
// ^-drag the view to the editor
// name the property in the popup
// it will auto-generate everything
// PROFIT!!!

@interface ItemDetailsViewController : UIViewController <UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *serialField;
@property (strong, nonatomic) IBOutlet UITextField *valueField;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property  (strong,nonatomic) Posession *posession;

// Picture
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePicture:(id)sender;
- (IBAction)bgTapped:(id)sender;

@end
