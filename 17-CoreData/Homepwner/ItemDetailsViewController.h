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

@class ItemDetailsViewController;


// provide protocol in order to notify parent controller
// which instantiates this onw
@protocol ItemDetailsViewControllerDelegate <NSObject>
@optional
-(void)itemDetailsViewControllerWillDissmiss:(ItemDetailsViewController*)vc;
@end

@interface ItemDetailsViewController : UIViewController <UIPopoverControllerDelegate, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIPopoverController *imagePickerPopover;
}

@property (weak, nonatomic) IBOutlet UIButton *clearImgButton;

@property (strong, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) IBOutlet UITextField *serialField;
@property (strong, nonatomic) IBOutlet UITextField *valueField;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property  (strong,nonatomic) Posession *posession;
@property  (assign, nonatomic) id <ItemDetailsViewControllerDelegate> delegate;


// Designated initializer
-(id)initForNewItem:(BOOL)isNew;

// Picture
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePicture:(id)sender;
- (IBAction)bgTapped:(id)sender;
- (IBAction)clearImage:(id)sender;

@end
