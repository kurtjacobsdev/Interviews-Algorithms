//
//  NetworkStuff.m
//  ShpockTest
//
//  Created by Kurt Jacobs on 2016/10/24.
//  Copyright © 2016 RandomDudes. All rights reserved.
//

#import "SHPNetworkAPI.h"

static NSCache *cache;

@implementation SHPNetworkAPI

+ (void)getImageURL:(NSString *)urlString andComplete:(void(^)(UIImage *image))complete
{
  if (cache == nil)
  {
    cache = [[NSCache alloc] init];
  }
  
  UIImage *image = [cache objectForKey:urlString];
  if (!image)
  {
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *data = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      UIImage *image2 = [UIImage imageWithData:data];
      if (image2)
      {
        [cache setObject:image2 forKey:urlString];
      }
      complete (image2);
    }];
    [data resume];
  }
  else
  {
    complete(image);
  }
}

@end
