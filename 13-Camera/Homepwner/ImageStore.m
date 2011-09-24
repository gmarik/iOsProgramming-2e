//
//  ImageStore.m
//  Homepwner
//
//  Created by Marjan Hratson on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ImageStore.h"

static ImageStore *defaultStore = nil;

@implementation ImageStore



// Singleton
+(ImageStore *)defaultStore 
{
    if (defaultStore) {
        return defaultStore;
    }
    
    return (defaultStore = [[self alloc] init]);
}

@end
