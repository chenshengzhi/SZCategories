//
//  NSFileManager+SZPaths.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSFileManager+SZPaths.h"
#include <sys/xattr.h>

@implementation NSFileManager (SZPaths)

+ (NSString *)sz_pathForDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
}

+ (NSString *)sz_documentsPath {
    return [self sz_pathForDirectory:NSDocumentDirectory];
}

+ (NSString *)sz_libraryPath {
    return [self sz_pathForDirectory:NSLibraryDirectory];
}

+ (NSString *)sz_cachesPath {
    return [self sz_pathForDirectory:NSCachesDirectory];
}

+ (double)sz_availableDiskSpace {
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.sz_documentsPath error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}

@end
