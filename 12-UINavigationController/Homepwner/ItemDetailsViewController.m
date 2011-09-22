//
//  ItemDetailsViewController.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ItemDetailsViewController.h"

@implementation ItemDetailsViewController
@synthesize nameField;
@synthesize serialField;
@synthesize valueField;
@synthesize dateLabel;

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
    [super viewDidUnload];
}

-(void)dealloc {
//    [setNameField relese];
//    [setSerialField release];
//    [setValueField release];
//    [setDateLabel release];
//    [super dealloc];
}

@end
