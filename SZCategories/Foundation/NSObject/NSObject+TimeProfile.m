//
//  NSObject+TimeProfile.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSObject+TimeProfile.h"
#import <QuartzCore/QuartzCore.h>

@implementation NSObject (TimeProfile)

+ (void)timeProfileWithBlock:(void(^)())block {
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
