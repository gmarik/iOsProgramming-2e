//
//  Posession.h
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Posession : NSObject <NSCoding>
{
}

@property (strong, nonatomic) NSString *posessionName;
@property (strong, nonatomic) NSString *serialNumber;
@property (strong, nonatomic) NSDate *dateCreated;
@property (assign, nonatomic) int valueInDollars;
@property (strong, nonatomic) NSString *imageKey;

+ (id)randomPosession;

- (id)initWithName:(NSString *)name 
    valueInDollars:(int) value
       serialNumber:(NSString *)num;


@end
