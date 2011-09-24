//
//  ItemDetailsViewController.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ItemDetailsViewController.h"
#import "ImageStore.h"

@implementation ItemDetailsViewController
@synthesize nameField;
@synthesize serialField;
@synthesize valueField;
@synthesize dateLabel;
@synthesize posession;
@synthesize imageView;


// ViewCallbacks

-(void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
    [nameField setText:[posession posessionName]];
    [serialField setText:[posession serialNumber]];

    [valueField setText:[NSString stringWithFormat:@"%d", [posession valueInDollars]]];

    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    [fmt setDateStyle:NSDateFormatterMediumStyle];
    [fmt setTimeStyle:NSDateFormatterNoStyle];
    
    [dateLabel setText:
     [fmt stringFromDate:[posession dateCreated]]];
}

-(void)viewWillDisappear:(BOOL)animated 
{
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [[self view] endEditing:YES];
    
    [posession setPosessionName:[nameField text]];
    [posession setSerialNumber:[serialField text]];
    [posession setValueInDollars:[[valueField text] intValue]];
    
}

- (void)viewDidUnload {
//    [setNameField release];
//    [setSerialField release];
//    [setValueField release];
//    [setDateLabel release];

    // reset pointers to not point to 
    // deallocated objects
    [self setNameField:nil];
    [self setSerialField:nil];
    [self setValueField:nil];
    [self setDateLabel:nil];
    [self setImageView:nil];
    [super viewDidUnload];
}

-(void)dealloc {
//    [setNameField relese];
//    [setSerialField release];
//    [setValueField release];
//    [setDateLabel release];
//    [super dealloc];
}

// Image picker
- (IBAction)takePicture:(id)sender {
    
    // THIS doesn't work - TODO: understand why
    //UIImagePickerController *imgPicker = [[UIImagePickerController alloc] initWithRootViewController:[self navigationController]];

    UIImagePickerController *imgPicker = [[UIImagePickerController alloc] init];
  
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imgPicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    
    [imgPicker setDelegate:self];
    [self presentModalViewController:imgPicker animated:YES];
    
}

// Image Picker callbacks

-(void)     imagePickerController:(UIImagePickerController *)picker 
    didFinishPickingMediaWithInfo:(NSDictionary *)info 
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];

    NSString *oldKey = [posession imageKey];
    if (oldKey) {
        [[ImageStore defaultStore] deleteImageForKey:oldKey];
    }
    
    CFUUIDRef _UUID = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef _UUIDString = CFUUIDCreateString(kCFAllocatorDefault, _UUID);
    posession.imageKey = (__bridge_transfer NSString *)_UUIDString;
    [[ImageStore defaultStore] setImage:image forKey:posession.imageKey];
    
    [imageView setImage:image];
    [self dismissModalViewControllerAnimated:YES];
}

@end
