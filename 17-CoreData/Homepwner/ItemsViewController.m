//
//  ItemsViewController.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ItemsViewController.h"
#import "PosessionStore.h"
#import "HomepwnerItemCell.h"

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
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] 
                                initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                                     target:self 
                                                     action:@selector(addNewPosession:)];
        // Every UIViewController has navigationItem property pointing
        // to UINavigationController instance
        // property probably gets set when ViewController 
        // gets connected with UINavigationController
        [[self navigationItem] setRightBarButtonItem:bbi];
        //[bbi release];
        [[self navigationItem] setTitle:@"Homepwner"];
        
        // UIViewController has editButtonItem property instance
        // which is a button with default target:self action:toggleEditing mode
        [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];

//        for (int i = 0; i < 3; i++) {
//            [[PosessionStore defaultStore] createPosession];
//        }
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


#pragma mark Model CRUD
-(IBAction)addNewPosession:(id)sender {
    Posession *posession = [[PosessionStore defaultStore] createPosession];
    
    ItemDetailsViewController *detailsView = 
        [[ItemDetailsViewController alloc] initForNewItem:YES];

    detailsView.delegate = self; // ItemDetailsViewControllerDelegate
    detailsView.posession = posession;
    
    UINavigationController *navController = 
        [[UINavigationController alloc] initWithRootViewController:detailsView];
    
    [navController setModalPresentationStyle:UIModalPresentationFormSheet];
    [navController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentModalViewController:navController animated:YES];
    
    [[self tableView] reloadData];     
}

//UINavigationController
-(void)           tableView:(UITableView *)tableView 
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    ItemDetailsViewController *dc = 
        [[ItemDetailsViewController alloc] initForNewItem:NO];

    NSArray *all = [[PosessionStore defaultStore] posessions];
    Posession *p = [all objectAtIndex:[indexPath row]];

    [dc setPosession:p];
    
    [[self navigationController] pushViewController:dc animated:YES];
    
}

//View callbacks

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[self tableView] reloadData];
}

// ItemDetailsViewControllerDelegate
-(void)itemDetailsViewControllerWillDissmiss:(ItemDetailsViewController *)vc {
    [[self tableView] reloadData];
}


#pragma mark UITableViewDataSource protocol
// Deletion
-(void)      tableView:(UITableView *)tableView 
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
     forRowAtIndexPath:(NSIndexPath *)indexPath 
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PosessionStore *ps = [PosessionStore defaultStore];
        [ps removePosession:[ps.posessions objectAtIndex:[indexPath row]]];
        
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
    }
}

-(void)     tableView:(UITableView *)tableView 
   moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath 
          toIndexPath:(NSIndexPath *)destinationIndexPath 
{
    [[PosessionStore defaultStore] 
        moveAtIndex:[sourceIndexPath row] 
            toIndex:[destinationIndexPath row]];
}

//Sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [NSArray arrayWithObjects:@"Radios", @"Phones", @"Cartones", nil];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[NSArray arrayWithObjects:@"Radios", @"Phones", @"Cartones", nil] objectAtIndex:section];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[PosessionStore.defaultStore posessions] count] / [self numberOfSectionsInTableView:tableView];
}

// Cells
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Check for reusable cell from pull first
    HomepwnerItemCell *cell = (HomepwnerItemCell *)[tableView
        dequeueReusableCellWithIdentifier:@"HomepwnerItemCell"];
    
    if (!cell) { // otherwise create
        cell = [[HomepwnerItemCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:@"HomepwnerItemCell"];
    }
    
    // 5 is number of rows in section
    int idx = [indexPath section] * 5 + [indexPath row];
    
    Posession *p = [[[PosessionStore defaultStore] posessions] objectAtIndex:idx];
    
    //[[cell textLabel] setText:[p description]];
    //[[cell detailTextLabel] setText:s];
    [cell setPosession:p];
    
    return cell;
}
@end
