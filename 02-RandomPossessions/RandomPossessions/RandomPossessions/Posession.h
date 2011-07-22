//
//  Posession.h
//  RandomPossessions
//
//  Created by Marjan Hratson on 7/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Posession : NSObject {

    NSString *posessionName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
    
}

-(NSString *)posessionName;
-(void)setPosessionName:(NSString *)newValue;

-(NSString *) serialNumber;
-(void)setSerialNumber:(NSString *)newValue;

-(NSDate *) dateCreated;
-(void)setDateCreated:(NSDate *)newValue;

-(int) valueInDollars;
-(void)setValueInDollars:(int)newValue;

@end
