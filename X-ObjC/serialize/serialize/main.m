//
//  main.m
//  serialize
//
//  Created by Marjan Hratson on 3/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

void serialize_demo();

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        serialize_demo();
        
    }
    return 0;
}

void serialize_demo() {
    // The only objects  that are property list serializable are 
    // NSString, NSNumber, NSDate, NSData, NSArray, NSDictionary
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init]; 
    [dic setObject:@"Hey" forKey:@"Hey"];
    
    [dic writeToFile:@"./data" atomically:YES];

    NSDictionary *dic2 = [[NSDictionary alloc] initWithContentsOfFile:@"./data"]; 
    
    NSLog(@"%@", dic2);
}