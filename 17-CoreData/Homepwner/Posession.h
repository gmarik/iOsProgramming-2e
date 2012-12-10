//
//  Posession.h
//  Homepwner
//
//  Created by Maryan Hratson on 2012-12-10.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Posession : NSManagedObject

@property (nonatomic, retain) NSString * posessionName;
@property (nonatomic, retain) NSString * serialNumber;
@property (nonatomic, retain) NSNumber * valueInDollars;
@property (nonatomic, retain) NSDate * dataCreated;
@property (nonatomic, retain) NSString * imageKey;
@property (nonatomic, retain) NSData * thumbnailData;
@property (nonatomic, retain) UIImage * thumbnail;
@property (nonatomic, retain) NSNumber * orderingValue;
@property (nonatomic, retain) NSManagedObject *assetType;

@end
