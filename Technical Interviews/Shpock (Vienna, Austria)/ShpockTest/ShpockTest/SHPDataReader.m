//
//  SHPDataReader.m
//  ShpockTest
//
//  Created by Kurt Jacobs on 2016/10/24.
//  Copyright © 2016 RandomDudes. All rights reserved.
//

#import "SHPDataReader.h"
#import "SHPProduct.h"

@implementation SHPDataReader

+ (NSArray *)getdata
{
  NSError *error;
  NSArray *json = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"Mock" withExtension:@"json"]] options:NSJSONReadingMutableLeaves error:&error];
  __block NSMutableArray *datasource = [NSMutableArray array];
  [json enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    SHPProduct *product = [[SHPProduct alloc]init];
    product.productTitle = obj[@"title"];
    product.productPrice = obj[@"price"];
    product.imageURL = obj[@"media"];
    [datasource addObject:product];
  }];
  return datasource;
}

@end
