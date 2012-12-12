//
//  PosessionStore.h
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreData/CoreData.h"
#import "Posession.h"

// @class Posession;


@interface PosessionStore : NSObject {

    NSMutableArray *_posessions;
    NSMutableArray *allAssetTypes;
    NSManagedObjectContext *context;
    
    NSManagedObjectModel *model;
    
}


+(PosessionStore *)defaultStore;

//@property (retain,atomic,strong) NSMutableArray* posessions;

-(NSString *)posessionArchivePath;

-(BOOL)saveChanges;
-(void)loadChanges;


#pragma mark Posessions

- (NSArray *) posessions;
- (Posession *)createPosession;
- (void) removePosession: (Posession *)p;
- (void) movePosessionAtIndex:(int)from toIndex:(int) to;


//-(Posession *)createPosession;
//-(Posession *)removePosession:(Posession*)p;
//
-(void)moveAtIndex:(int)from toIndex:(int)to;


#pragma mark AssetTypes
//#- (NSArray *)allAssetTypes;


@end

