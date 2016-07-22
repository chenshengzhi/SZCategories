//
//  NSBundle+SZAppVersion.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/22.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSBundle+SZAppVersion.h"

@implementation NSBundle (SZAppVersion)

+ (NSString *)sz_version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}

@end
