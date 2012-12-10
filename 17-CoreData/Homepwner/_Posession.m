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
            imageKey,
            thumbnail,
            thumbnailData;

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
    
    [aCoder encodeObject:thumbnailData forKey: @"thumbnailData"];
}

- (Posession *)decodeWithCoder:(NSCoder *)aDecoder {
    [self setPosessionName:[aDecoder decodeObjectForKey:@"posessionName"]];
    [self setSerialNumber:[aDecoder decodeObjectForKey:@"serialNumber"]];
    [self setDateCreated:[aDecoder decodeObjectForKey:@"dateCreated"]];
    [self setImageKey:[aDecoder decodeObjectForKey:@"imageKey"]];
    
    [self setValueInDollars:[aDecoder decodeIntForKey:@"valueInDollars"]];
    [self setThumbnailData:[aDecoder decodeObjectForKey:@"thumbnailData"]];

    return self;
}

+ (CGSize)thumnailSize {
    return CGSizeMake(40, 40);
}

- (UIImage *)thumbnail {
    if (!thumbnailData) {
        return nil;
    }
    
    if (!thumbnail) {
        thumbnail = [UIImage imageWithData:thumbnailData];
        
    }
    return thumbnail;
}

- (void)setThumbnailDataFromImage:(UIImage *)image {
    CGSize origImageSize = [image size];
    
    CGRect newRect;
    newRect.origin = CGPointZero;
    newRect.size  = CGSizeMake(40, 40);
    
    // how do we scale
    float ratio = MAX(newRect.size.width/origImageSize.width, newRect.size.height/origImageSize.height);
    
    UIGraphicsBeginImageContext(newRect.size);
    
    //Round the corners
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    //into whant rectangle shall I compsite the image?
    
    CGRect projectRect;
    projectRect.size.width = ratio * origImageSize.width;
    projectRect.size.height = ratio * origImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage *small = UIGraphicsGetImageFromCurrentImageContext();
    [self setThumbnail:small];
    
    //
    NSData *data = UIImagePNGRepresentation(small);
    [self setThumbnailData:data];
    
    UIGraphicsEndImageContext();

}

@end
