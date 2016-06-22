//
//  NSFileManager+Paths.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSFileManager+Paths.h"
#include <sys/xattr.h>

@implementation NSFileManager (Paths)

+ (NSString *)pathForDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSString *)documentsPath {
    return [self pathForDirectory:NSDocumentDirectory];
}

+ (NSString *)libraryPath {
    return [self pathForDirectory:NSLibraryDirectory];
}

+ (NSString *)cachesPath {
    return [self pathForDirectory:NSCachesDirectory];
}

+ (double)availableDiskSpace {
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.documentsPath error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

@end
