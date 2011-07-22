//
//  Posession.m
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Posession.h"


@implementation Posession

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

@end
