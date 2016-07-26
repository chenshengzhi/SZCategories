//
//  NSObject+SZTimeProfile.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSObject+SZTimeProfile.h"
#import <QuartzCore/QuartzCore.h>

@implementation NSObject (SZTimeProfile)

+ (void)sz_timeProfileWithBlock:(void(^)())block {
    if (block) {
        CFTimeInterval begin = CACurrentMediaTime();
        block();
        CFTimeInterval end = CACurrentMediaTime();
        NSLog(@"second useage: %f", end - begin);
    } else {
        NSLog(@"[WARNING] no block, second useage: 0");
    }
}

@end
