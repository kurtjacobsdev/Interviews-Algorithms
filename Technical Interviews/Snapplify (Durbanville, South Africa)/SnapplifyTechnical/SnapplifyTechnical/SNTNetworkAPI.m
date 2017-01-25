//
//  SNTNetworkAPI.m
//  SnapplifyTechnical
//
//  Created by Kurt Jacobs on 2017/01/25.
//  Copyright © 2017 RandomDudes. All rights reserved.
//

#import "SNTNetworkAPI.h"

@implementation SNTNetworkAPI

+ (void)getWeatherForLocation:(CLLocation *)location andCompletion:(void (^)(NSDictionary *jsonData))completionBlock andFailure:(void (^)(void))failureBlock
{
  //Probably not best practice storing an APPID in code but for the sake of this exercise its okay considering that the data is not sensitive and the provided API does not care about security (i.e. there is no https:// endpoint)
  NSString *urlWithLocationStr = [NSString stringWithFormat:@"http://api.openweathermap.org/data/2.5/weather?lat=%f&lon=%f&APPID=53f9d8e4213222cf517d86dc406d67fc",location.coordinate.latitude,location.coordinate.longitude];
  
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlWithLocationStr]];
  
  [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error){
      if (failureBlock != nil){
        failureBlock();
      }
    }
    
    if (data){
      NSError *jsonReadError;
      NSDictionary *jsonData = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&jsonReadError];
      completionBlock(jsonData);
    }
  }] resume];
}

@end
