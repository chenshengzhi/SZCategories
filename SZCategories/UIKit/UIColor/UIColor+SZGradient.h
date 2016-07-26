//
//  UIColor+SZGradient.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SZGradient)

//渐变
+ (UIColor *)sz_gradientFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor withHeight:(int)height;

@end
