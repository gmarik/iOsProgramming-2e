//
//  PosessionStore.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/15/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageStore.h"
#import "PosessionStore.h"


@implementation PosessionStore

//@synthesize posessions = _posessions;

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
    
    //Read model
    
    model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    NSString *path = pathInDocumentDirectory(@"store.data");
    NSURL *storeURL = [NSURL fileURLWithPath:path];
    
    NSError *error = nil;
    if (![psc addPersistentStoreWithType:NSSQLiteStoreType
                           configuration:nil
                                     URL:storeURL
                                 options:nil
                                   error:&error]) {
        
        [NSException raise:@"Open failed"
                    format:@"Reason: %@", [error localizedDescription]];
        
    }
    
    // Create the managed object context
    
    context = [[NSManagedObjectContext alloc] init];
    [context setPersistentStoreCoordinator:psc];
    
    [context setUndoManager:nil];
    
    return self;
}


#pragma mark Posessions manipulation

-(NSArray *)posessions {
    [self fetchPosessionsIfNecessary];
    return _posessions;
}

-(Posession *)createPosession {
    
    double order = [self orderingValue:_posessions];
    
    NSLog(@"Adding after %d items, order = %.2f", [_posessions count], order);
    
    Posession *p = [NSEntityDescription insertNewObjectForEntityForName:@"Posession" inManagedObjectContext:context];
    
    [p setOrderingValue: [NSNumber numberWithDouble:order]];
    
    [_posessions addObject:p];
    
    return p;
}

-(void)removePosession:(Posession*)p {
    NSString *key = [p imageKey];
    
    [[ImageStore defaultStore] deleteImageForKey:key];
    [context deleteObject:p];
    [_posessions removeObjectIdenticalTo:p];
}


-(double)orderingValue: (NSArray *)orderedItems {
    return ([[[orderedItems lastObject] orderingValue] doubleValue] || 0) + 1;
}

-(double)orderingValue:(NSArray *) orderedItems to:(int) to from:(int) from {
    double nextbound = 0;
    double to_bound = [[[orderedItems objectAtIndex:to] orderingValue] doubleValue];
    
    if (to == 0) {
        nextbound = 0;
    } else if (to == orderedItems.count - 1) {
        nextbound = orderedItems.count + 1;
    } else {
        int nextIdx = to - (to < from ? 1 : -1);
        nextbound = [[[orderedItems objectAtIndex:  nextIdx] orderingValue] doubleValue];
    }
    
    double ov = (to_bound + nextbound) / 2.0;
    
    NSLog(@"Ordering value: [%d => %d] %.2f", from, to, ov);
    
    return ov;
}

-(void)moveAtIndex:(int)from 
           toIndex:(int)to 
{
    if (from == to) {
        return;
    }
    
    Posession *p = [self.posessions objectAtIndex:from];
    p.orderingValue = [NSNumber numberWithDouble: [self orderingValue:_posessions to:to from:from]];
    
    [_posessions removeObjectAtIndex:from];
    [_posessions insertObject:p
                      atIndex:to];
    
    
    //We should have released `p` 
    // as adding object to an array retains it
    // [p release];
}

-(NSString *)posessionArchivePath {
    
    return pathInDocumentDirectory(@"posessions.data");
}

#pragma mark Archiving

- (void)fetchPosessionsIfNecessary {
    if (!_posessions) {
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        
        NSEntityDescription *e = [[model entitiesByName] objectForKey:@"Posession"];
        [request setEntity:e];
        
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:@"orderingValue"
                                                             ascending:YES];
        
        [request setSortDescriptors:[NSArray arrayWithObject:sd]];
        
        NSError *error;
        NSArray *result = [context executeFetchRequest:request error:&error];
        if (!result ) {
            [NSException raise:@"Fetch Failed" format:@"Reason: %@", [error localizedDescription]];
        }
        
        for (int i=0; i < result.count; i++) {
            NSLog(@"%.2f", [[[result objectAtIndex:i] orderingValue] doubleValue]);
        }
        
        _posessions = [[NSMutableArray alloc] initWithArray:result];
    }
}

-(BOOL)saveChanges {
    NSError *err = nil;
    BOOL successful = [context save:&err];
    if (!successful) {
        NSLog(@"Error saving: %@", [err localizedDescription]);
    }
    return successful;
}

-(void)loadChanges {
    if (!_posessions) {
        NSString *path = [self posessionArchivePath];
        _posessions = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    }
    
    if (!_posessions) {
        _posessions = [[NSMutableArray alloc] init];
    }
}

NSString *pathInDocumentDirectory(NSString *filename) {
    NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docs objectAtIndex:0];
    return [docDir stringByAppendingPathComponent:filename];
}

@end