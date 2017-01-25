//
//  SNTNetworkAPI.h
//  SnapplifyTechnical
//
//  Created by Kurt Jacobs on 2017/01/25.
//  Copyright © 2017 RandomDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface SNTNetworkAPI : NSObject

+ (void)getWeatherForLocation:(CLLocation *)location andCompletion:(void (^)(NSDictionary *jsonData))completionBlock andFailure:(void (^)(void))failureBlock;

@end
