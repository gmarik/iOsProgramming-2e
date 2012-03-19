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
    
    /*
    // Writes/Reads serialized NSDictionary to a property list file
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
	<key>Hey</key>
	<string>Hey</string>
    </dict>
    </plist>
    */
}