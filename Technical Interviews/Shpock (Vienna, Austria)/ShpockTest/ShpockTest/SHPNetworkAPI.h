//
//  NetworkStuff.h
//  ShpockTest
//
//  Created by Kurt Jacobs on 2016/10/24.
//  Copyright © 2016 RandomDudes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SHPNetworkAPI : NSObject

+ (void)getImageURL:(NSString *)url andComplete:(void(^)(UIImage *image))complete;

@end
