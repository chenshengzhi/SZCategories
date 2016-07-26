//
//  NSString+SZFilePath.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/26.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZFilePath.h"

@implementation NSString (SZFilePath)

- (BOOL)sz_exist {
    return [[NSFileManager defaultManager] fileExistsAtPath:self];
}

- (BOOL)sz_isDirectory {
    BOOL isDirectory = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:self isDirectory:&isDirectory];
    return isDirectory;
}

- (NSArray *)sz_filesInDirectory {
    if ([self sz_isDirectory]) {
        return [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self error:nil];
    } else {
        return nil;
    }
}

@end
