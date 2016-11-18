//
//  NSBundle+SZAppVersion.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/22.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSBundle+SZAppVersion.h"

@implementation NSBundle (SZAppVersion)

+ (NSString *)sz_bundleShortVersionString {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)sz_bundleVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleVersion"];
}

@end
