//
//  Posession.h
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Posession : NSObject {
    
}

+ (id)randomPosession;

- (id)initWithName:(NSString *)name 
    valueInDollars:(int) value
       serialNumber:(NSString *)num;

// default attributes of properties:
// atomic, readwrite, assign

// Naming:
// getter=getterName
// setter=setterName

// Semantics:
// assign -
// copy - assigns newValue's copy, releases previousOne; useful for mutable objects
// retain - retain newValue and releases previousOne

// Writability
// readwrite - generates both getter and setter
// readonly - generates only getter

// Atomicity
// nonatomic - do not synchronize access to instance variables in threaded env

// For more details see "Declared properties" help

@property (nonatomic,copy) NSString *posessionName;
@property (nonatomic,copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

@property (nonatomic,retain) NSString *accessor;

-(void)dealloc;

@end
