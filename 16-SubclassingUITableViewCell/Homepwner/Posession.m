//
//  Posession.m
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Posession.h"


@implementation Posession

@synthesize posessionName, 
            serialNumber,
            dateCreated,
            valueInDollars,
            imageKey;

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

-(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    
    if (self) {
        [self decodeWithCoder:aDecoder];
    }
    
    return self;
}

// Override Posession description
// ala to_s in Ruby
- (NSString *)description {
    NSString *desc = [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded %@", posessionName, serialNumber, valueInDollars, dateCreated];
    return desc;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:posessionName forKey:@"posessionName"];
    [aCoder encodeObject:serialNumber forKey:@"serialNumber"];
    [aCoder encodeObject:dateCreated forKey:@"dateCreated"];
    [aCoder encodeObject:imageKey forKey:@"imageKey"];
    
    [aCoder encodeInt:valueInDollars forKey:@"valueInDollars"];
}

- (Posession *)decodeWithCoder:(NSCoder *)aDecoder {
    [self setPosessionName:[aDecoder decodeObjectForKey:@"posessionName"]];
    [self setSerialNumber:[aDecoder decodeObjectForKey:@"serialNumber"]];
    [self setDateCreated:[aDecoder decodeObjectForKey:@"dateCreated"]];
    [self setImageKey:[aDecoder decodeObjectForKey:@"imageKey"]];
    
    [self setValueInDollars:[aDecoder decodeIntForKey:@"valueInDollars"]];

    return self;
}

@end
