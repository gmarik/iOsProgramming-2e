//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "PosessionStore.h"

// I was wondering where is the view for this controller
// Turns out that UITableViewController gets view automatically
// as from UITableViewController's docs:

// The UITableViewController class creates a controller object that manages a table view.
// If a nib file is specified via the initWithNibName:bundle: method (which is declared by the superclass UIViewController), 
// UITableViewController loads the table view archived in the nib file. 
// Otherwise, it creates an unconfigured UITableView object with the correct dimensions and autoresize mask. 
// You can access this view through the tableView property.

@implementation ItemsViewController

- (id)init {

    self = [super initWithStyle:UITableViewStyleGrouped];

    if (self) {
        for (int i = 0; i < 15; i++) {
            [[PosessionStore defaultStore] createPosession];
        }
    }

    return self;
}

// this is required in order to be consistent
// otherwise UITableViewStyleGrouped style 
// may be lost in case non-overriden initWithStyle 
// gets called
-(id)initWithStyle:(UITableViewStyle)style {
    return [self init];
}



#pragma mark UITableViewDataSource protocol

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[PosessionStore.defaultStore posessions] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Check for reusable cell from pull first
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    
    
    if (!cell) { // otherwise create
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:@"UITableViewCell"];
    }
    
    Posession *p = [[[PosessionStore defaultStore] posessions] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[p description]];
    
    return cell;
}
@end
