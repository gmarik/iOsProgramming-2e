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
-(Posession *)removePosession:(Posession*)posession {
    [self.posessions removeObjectIdenticalTo:posession];
    return  posession;
}

-(void)moveAtIndex:(int)from 
           toIndex:(int)to 
{
    if (from == to) {
        return;
    }
    
    Posession *p = [self.posessions objectAtIndex:from];
    // We should have retained `p` if we had no ARC
    // as array object removal decrements retain count
    //[p retain]
    
    [self.posessions removeObjectAtIndex:from];
    [self.posessions insertObject:p atIndex:to];
    
    //We should have released `p` 
    // as adding object to an array retains it
    // [p release];
}

-(NSString *)posessionArchivePath {
    
    return [self pathInDocumentDirectory:@"posessions.data"];
}

-(NSString *)pathInDocumentDirectory:(NSString *)filename {
    NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docs objectAtIndex:0];
    return [docDir stringByAppendingPathComponent:filename];
}
@end