//
//  TableViewController.m
//  ShpockTest
//
//  Created by Kurt Jacobs on 2016/10/24.
//  Copyright © 2016 RandomDudes. All rights reserved.
//

#import "SHPTableViewController.h"
#import "SHPDataReader.h"
#import "SHPTableViewCell.h"
#import "SHPNetworkAPI.h"
#import "SHPProduct.h"

@interface SHPTableViewController ()

@property (nonatomic) NSArray *data;

@end

@implementation SHPTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [SHPDataReader getdata];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SHPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    SHPProduct *product  = self.data[indexPath.row];
    cell.titlex.text = product.productTitle;
    cell.pricex.text = [NSString stringWithFormat:@"%f",[product.productPrice doubleValue]];
    cell.loadingURL = product.imageURL;
    __weak typeof(SHPTableViewCell) *weakCell = cell;
    __weak typeof(self) weakSelf = self;
    [SHPNetworkAPI getImageURL:((SHPProduct *)self.data[indexPath.row]).imageURL andComplete:^(UIImage *image) {
      dispatch_async(dispatch_get_main_queue(), ^{
        if ([weakCell.loadingURL isEqualToString:((SHPProduct *)weakSelf.data[indexPath.row]).imageURL])
        {
          weakCell.imagex.image = image;
        }
      });
    }];
    return cell;
}

@end
