//
//  TableViewCell.h
//  ShpockTest
//
//  Created by Kurt Jacobs on 2016/10/24.
//  Copyright © 2016 RandomDudes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titlex;
@property (weak, nonatomic) IBOutlet UILabel *pricex;
@property (weak, nonatomic) IBOutlet UIImageView *imagex;
@property (nonatomic) NSString *loadingURL;
@end
