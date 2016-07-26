//
//  NSString+SZFilePath.h
//  SZCategories
//
//  Created by 陈圣治 on 16/7/26.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZFilePath)

- (BOOL)sz_exist;

- (BOOL)sz_isDirectory;

- (NSArray *)sz_filesInDirectory;

@end
