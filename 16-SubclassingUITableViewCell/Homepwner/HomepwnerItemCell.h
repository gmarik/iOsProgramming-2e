//
//  HomepwnerItemCell.h
//  Homepwner
//
//  Created by Marjan Hratson on 12/1/12.
//
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@class Posession;

@interface HomepwnerItemCell : UITableViewCell
{
    UILabel *valueLabel;
    UILabel *nameLabel;
    UIImageView *imageView;
    
}

- (void)setPosession: (Posession *)posession;

@end
