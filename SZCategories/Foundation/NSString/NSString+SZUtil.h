//
//  NSString+SZUtil.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (SZUtil)

- (CGFloat)sz_heightWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGFloat)sz_widthWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

- (CGSize)sz_sizeWithFont:(UIFont *)font constrainedToWidth:(CGFloat)width;
- (CGSize)sz_sizeWithFont:(UIFont *)font constrainedToHeight:(CGFloat)height;

+ (NSString *)sz_reverseString:(NSString *)strSrc;

@end
