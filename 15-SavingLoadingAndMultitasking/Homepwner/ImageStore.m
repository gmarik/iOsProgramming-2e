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

// ImageStore API

-(void)setImage:(UIImage *)i 
         forKey:(NSString *)s 
{
    [dict setObject:i forKey:s];
}

-(UIImage *)imageForKey:(NSString *)s 
{
    return [dict objectForKey:s];
}

-(void)deleteImageForKey:(NSString *)s 
{
    [dict removeObjectForKey:s];
}


// init
- (id)init {
    self = [super init];
    if (self) {
        dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

// Singleton
+(ImageStore *)defaultStore 
{
    if (defaultStore) {
        return defaultStore;
    }
    
    return (defaultStore = [[self alloc] init]);
}

@end
