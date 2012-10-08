//
//  BasketCell.m
//  Flowers
//
//  Created by Danis Ziganshin on 10/8/12.
//
//

#import "BasketCell.h"

@implementation BasketCell

@synthesize detailTextLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(250.0f, 10.0f, 30.0f, 20.0f)];
        [self addSubview:detailTextLabel];
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    detailTextLabel = nil;
    [detailTextLabel release];
    [super dealloc];
}


@end
