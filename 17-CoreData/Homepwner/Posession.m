//
//  Posession.m
//  Homepwner
//
//  Created by Maryan Hratson on 2012-12-10.
//
//

#import "Posession.h"


@implementation Posession

@dynamic posessionName;
@dynamic serialNumber;
@dynamic valueInDollars;
@dynamic dataCreated;
@dynamic imageKey;
@dynamic thumbnailData;
@dynamic thumbnail;
@dynamic orderingValue;
@dynamic assetType;

//+ (id)randomPosession {
//    
//    NSArray *adjectiveList = [NSArray arrayWithObjects:@"Fluffy", @"Rusty", @"Shiny", nil];
//    NSArray *nounList = [NSArray arrayWithObjects:@"Bear", @"Spork", @"Mac", nil];
//    
//    long adjIdx = rand() % [adjectiveList count];
//    long nounIdx = rand() % [nounList count];
//    
//    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
//                            [adjectiveList objectAtIndex:adjIdx],
//                            [nounList objectAtIndex:nounIdx]];
//    
//    int randomValue = rand() % 100;
//    
//    NSString *randomSerial = [NSString stringWithFormat:@"%c%c%c%c%c",
//                              'O' + rand() % 10,
//                              'A' + rand() % 26,
//                              'O' + rand() % 10,
//                              'A' + rand() % 26,
//                              'O' + rand() % 10];
//    
//    // self here is a class
//    Posession *p = [[self alloc] initWithName:randomName
//                               valueInDollars:randomValue
//                                 serialNumber:randomSerial];
//    
//    return p;
//    
//}

+ (CGSize)thumnailSize {
    return CGSizeMake(40, 40);
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

- (void)awakeFromFetch
{
    [super awakeFromFetch];
    
    UIImage *tn =[UIImage imageWithData:[self thumbnailData]];
    [self setPrimitiveValue:tn forKey:@"thumnail"];
}

@end
