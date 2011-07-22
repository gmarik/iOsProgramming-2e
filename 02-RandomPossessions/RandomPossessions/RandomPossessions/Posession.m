//
//  Posession.m
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Posession.h"


@implementation Posession

- (id)initWithName:(NSString *)name 
    valueInDollars:(int) value
       serialNumber:(NSString *)num {

    // [self init] could be translated into
    self = [super init];
    
    if (!self) return self;
    
    [self setPosessionName:name];
    [self setValueInDollars:value];
    [self setSerialNumber:num];
    [self setDateCreated:[[NSDate alloc] init]];
    
    return self;
}

- (NSString *)posessionName {
    return posessionName;
}
-(void)setPosessionName:(NSString *)newValue {
    posessionName = newValue;
}

- (NSString *)serialNumber {
    return serialNumber;
}
- (void)setSerialNumber:(NSString *)newValue {
    serialNumber = newValue;
}

- (NSDate *)dateCreated {
    return dateCreated;
}
- (void)setDateCreated:(NSDate *)newValue {
    dateCreated = newValue;
}

- (int)valueInDollars {
    return valueInDollars;
}
- (void)setValueInDollars:(int)newValue {
    valueInDollars = newValue;
}

// Override Posession description
// ala to_s in Ruby
- (NSString *)description {
    NSString *desc = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded %@", posessionName, serialNumber, valueInDollars, dateCreated];
    return desc;
}

@end