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
    
    //persist image
    NSString *imagePath = pathInDocumentDirectory1(s);
    NSData *d = UIImagePNGRepresentation(i);
    [d writeToFile:imagePath atomically:YES];
}

-(UIImage *)imageForKey:(NSString *)s 
{
    UIImage *image = [dict objectForKey:s];
    
    if (!image) {
        image = [UIImage imageWithContentsOfFile:pathInDocumentDirectory1(s)];
        if (image) { // otherwise exceptions
            [dict setObject:image forKey:s];
        }
    }
    return image;
}

-(void)deleteImageForKey:(NSString *)s
{
    if (s) {
        [dict removeObjectForKey:s];
    
        NSString *path = pathInDocumentDirectory1(s);
        [NSFileManager.defaultManager removeItemAtPath:path error:NULL];
    }
}

-(void)clearCache {
    NSLog(@"[ImageStore] clearCache");
    [dict removeAllObjects];
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

// TODO: this is a stupid duplicate 
NSString *pathInDocumentDirectory1(NSString *filename) {
    NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [docs objectAtIndex:0];
    return [docDir stringByAppendingPathComponent:filename];
}


@end
