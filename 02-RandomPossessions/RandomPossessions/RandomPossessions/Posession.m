//
//  Posession.m
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Posession.h"


@implementation Posession

+ (id)randomPosession {

    NSArray *adjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
    NSArray *nounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
    
    long adjIdx = rand() % [adjectiveList count];
    long nounIdx = rand() % [nounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", 
                            [adjectiveList objectAtIndex:adjIdx], 
                            [nounList objectAtIndex:nounIdx]];
    
    int randomValue = rand() % 100;
    
    NSString *randomSerial = [NSString stringWithFormat:@"%c%c%c%c%c",
                        'O' + rand() % 10,
                        'A' + rand() % 26,
                        'O' + rand() % 10,
                        'A' + rand() % 26,
                        'O' + rand() % 10];
    
    // self here is a class
    Posession *p = [[self alloc] initWithName:randomName
                               valueInDollars:randomValue
                                 serialNumber:randomSerial];
    
    return p;
                        
}

// initializers return (id) by convenience
- (id)init {
    return [self initWithName:@"Posession" valueInDollars:0 serialNumber:@""];
}

// initializers return (id) by convenience
- (id)initWithName:(NSString *)name 
    valueInDollars:(int) value
       serialNumber:(NSString *)num {
    // we can't call [self init] anymore 
    // as it uses this method now
    self = [super init];
    
    if (!self) return self;
    
    [self setPosessionName:name];
    [self setValueInDollars:value];
    [self setSerialNumber:num];
    [self setDateCreated:[[NSDate alloc] init]];
    
    return self;
}

// Getters/Setters follow naming convention
// setter: (void)setPropertyName
// getter: propertyName

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
