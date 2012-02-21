//
//  PosessionStore.h
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Posession.h"


@interface PosessionStore : NSObject

+(PosessionStore *)defaultStore;

@property (retain,nonatomic,strong) NSMutableArray* posessions;

-(Posession *)createPosession;
-(Posession *)removePosession:(Posession*)p;

-(void)moveAtIndex:(int)from toIndex:(int)to;
-(NSString *)posessionArchivePath;
-(NSString *)pathInDocumentDirectory:(NSString *)filename;

-(BOOL)saveChanges;
-(void)loadChanges;


@end

