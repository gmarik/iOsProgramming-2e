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

@property (retain,atomic,strong) NSMutableArray* posessions;

-(Posession *)createPosession;

@end

