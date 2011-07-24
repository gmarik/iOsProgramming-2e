//
//  main.m
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Posession.h"
#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

    // allocate and init items
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    [items addObject:[Posession randomPosession]];
    [items addObject:[Posession randomPosession]];
    [items addObject:[Posession randomPosession]];
    
    [items insertObject:[Posession randomPosession] atIndex:0];
    
    for(NSString *item in items) {
        NSLog(@"%@", item);
    }
    
    // we coul'd release items here manually looping through the items array
    // but that's too expensive
    
    //release
    [items release];
    items = nil;

    [pool drain];
    return 0;
}