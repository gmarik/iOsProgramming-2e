//
//  main.m
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // allocate and init items
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    [items addObject:@"One"];
    [items addObject:@"Two"];
    [items addObject:@"Tre"];
    
    [items insertObject:@"Zero" atIndex:0];
    
    for(int i = 0; i < [items count]; i+=1) {
        NSLog(@"%@", [items objectAtIndex:i]);
        // %@ is a shorthand for
        // NSLog(@"%s", [[items objectAtIndex:i] description]);
        // which is kind of Object#to_s or Object#inspect in Ruby

    }
    
    //release
    [items release];
    // Don't leave items pointint at freed memory!
    items = nil;
    // sending messages to nil is isgnored
    // sending messages to "released object" causes issues 

    [pool drain];
    return 0;
}

