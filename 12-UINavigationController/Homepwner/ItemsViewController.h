//
//  ItemsViewController.h
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


// set proper super-class
@interface ItemsViewController : UITableViewController
{
    IBOutlet UIView *headerView;
}

-(UIView *)headerView;
-(IBAction)addNewPosession:(id)sender;
-(IBAction)toggleEditMode:(id)sender;

@end
