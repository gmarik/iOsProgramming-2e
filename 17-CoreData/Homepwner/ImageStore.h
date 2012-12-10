//
//  ImageStore.h
//  Homepwner
//
//  Created by Marjan Hratson on 9/24/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageStore : NSObject 
{
    NSMutableDictionary *dict;
}

+(ImageStore*)defaultStore;

-(void)setImage:(UIImage *)i forKey:(NSString *)s;
-(UIImage *)imageForKey:(NSString *)s;
-(void)deleteImageForKey:(NSString *)s;
-(void)clearCache;



@end