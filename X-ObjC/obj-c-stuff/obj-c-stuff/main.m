//
//  main.m
//  obj-c-stuff
//
//  Created by Marjan Hratson on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

void readwrite();

// executable is generated inside Products group (see Project Navigator drawer) 
int main (int argc, const char * argv[])
{

    @autoreleasepool {
        readwrite();
    }
    
    return 0;
}

void readwrite() {
    
    NSError *err;
    
    NSString *buf = [[NSString alloc] initWithContentsOfFile:@"/etc/hosts" encoding:NSUTF8StringEncoding error:&err];
    
    [buf writeToFile:@"outFile" atomically:YES encoding:NSUTF8StringEncoding error:&err];
    
    NSLog(@"%@",buf);
    
}

