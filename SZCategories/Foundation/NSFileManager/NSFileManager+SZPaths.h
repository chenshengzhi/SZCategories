//
//  NSFileManager+SZPaths.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (SZPaths)

+ (NSString *)sz_documentsPath;

+ (NSString *)sz_libraryPath;

+ (NSString *)sz_cachesPath;

+ (double)sz_availableDiskSpace;

@end
