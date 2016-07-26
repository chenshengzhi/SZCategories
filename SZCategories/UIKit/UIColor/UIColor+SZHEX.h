//
//  UIColor+SZHEX.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SZHEX)

+ (UIColor *)sz_colorWithHex:(UInt32)hex;
+ (UIColor *)sz_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;
+ (UIColor *)sz_colorWithHexString:(NSString *)hexString;
- (NSString *)sz_HEXString;

+ (UIColor *)sz_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;

+ (UIColor *)sz_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;

@end
