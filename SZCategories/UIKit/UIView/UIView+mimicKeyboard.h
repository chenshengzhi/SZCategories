//
//  UIView+mimicKeyboard.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (mimicKeyboard)

#pragma mark - 模拟系统键盘动画 -
/**
 *	模拟系统键盘动画
 *
 *	@param animations 动画
 *	@param completion 动画完成后处理
 */
+ (void)mimicKeyboardAnimations:(void (^)(void))animations completion:(void (^)(BOOL finished))completion;

@end
