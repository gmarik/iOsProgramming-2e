//
//  PosessionStore.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PosessionStore.h"

@implementation PosessionStore

@synthesize posessions;

#pragma mark 

// Simplest Singleton implementation
// NOTE: it doesn't protect you from doing stupid things
// if you need "real" singleton - see http://stackoverflow.com/questions/145154/what-does-your-objective-c-singleton-look-like
static PosessionStore *_defaultStore = nil;

+(PosessionStore *)defaultStore {    
    if (!_defaultStore) {
        _defaultStore = [[self alloc] init];
    }
    return _defaultStore;
}

#pragma mark constructor

- (id)init {
    self = [super init];
    if (self) {
        self.posessions = [[NSMutableArray alloc] init];
    }
    return self;
}


#pragma mark Posessions manipulation

-(Posession *)createPosession {
    Posession *p = [Posession randomPosession];
    [self.posessions addObject:p];
    return p;
}

@end