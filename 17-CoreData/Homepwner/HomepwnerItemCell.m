//
//  HomepwnerItemCell.m
//  Homepwner
//
//  Created by Marjan Hratson on 12/1/12.
//
//

#import "HomepwnerItemCell.h"
#import "Posession.h"

@implementation HomepwnerItemCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        valueLabel = [[UILabel alloc] initWithFrame: CGRectZero];
        [[self contentView] addSubview:valueLabel];
        
        //[valueLabel release];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [[self contentView] addSubview:nameLabel];
        //[nameLabel release];
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [[self contentView] addSubview:imageView];
        [imageView setContentMode:UIViewContentModeCenter];
    }
    
    return self;
}

// when a view changes size, it is sent the message layoutSubviews

- (void)layoutSubviews {

    [super layoutSubviews];
    
    float inset = 5.0;
    CGRect bounds = [[self contentView] bounds];
    float h = bounds.size.height;
    float w = bounds.size.width;
    
    float valueWidth = 40.0;
    
    CGSize size = [Posession thumnailSize];
    float imageSpace = h - size.height;
    CGRect imageFrame = CGRectMake(inset, imageSpace, size.width, size.height);
    
    
    //CGRect imageFrame = CGRectMake(inset, inset, 40, 40);
    [imageView setFrame:imageFrame];
    
    CGRect nameFrame = CGRectMake(
        imageFrame.size.width + imageFrame.origin.x + inset,
        inset,
        w - (h + valueWidth + inset * 4.0),
        h - inset * 2.0);

    [nameLabel setFrame:nameFrame];
    CGRect valueFrame = CGRectMake(nameFrame.size.width + nameFrame.origin.x + inset,
        inset,
        valueWidth,
        h - inset * 2.0);
    
    [valueLabel setFrame:valueFrame];
}

- (void) setPosession: (Posession *) posession
{
    [valueLabel setText:[NSString stringWithFormat:@"$%@", posession.valueInDollars]];
    [nameLabel setText:posession.posessionName];
    [imageView setImage: posession.thumbnail];

}

@end
