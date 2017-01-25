//
//  TableViewCell.m
//  ShpockTest
//
//  Created by Kurt Jacobs on 2016/10/24.
//  Copyright © 2016 RandomDudes. All rights reserved.
//

#import "SHPTableViewCell.h"

@implementation SHPTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
  self.loadingURL = nil;
  self.imagex.image = nil;
  self.titlex.text = @"";
  self.pricex.text = @"";
}

@end
