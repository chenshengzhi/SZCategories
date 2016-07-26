//
//  UIView+SZmimicKeyboard.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIView+SZmimicKeyboard.h"

@implementation UIView (SZmimicKeyboard)

#pragma mark - 模拟系统键盘动画 -
/**
 *	模拟系统键盘动画
 *
 *	@param animations 动画
 *	@param completion 动画完成后处理
 */
+ (void)sz_mimicKeyboardAnimations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion {
    if (([[[UIDevice currentDevice] systemVersion] compare:@"7" options:NSNumericSearch] != NSOrderedAscending)) {
        [UIView animateWithDuration:.5 delay:0 usingSpringWithDamping:500.0f initialSpringVelocity:0.0f options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionBeginFromCurrentState animations:animations completion:completion];
    } else {
        [UIView animateWithDuration:.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState animations:animations completion:completion];
    }
}

@end
