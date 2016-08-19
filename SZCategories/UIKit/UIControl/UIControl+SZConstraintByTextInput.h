//
//  UIControl+SZConstraintByTextInput.h
//  SZCategories
//
//  Created by 陈圣治 on 16/8/18.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (SZConstraintByTextInput)

- (void)sz_addConstraintWithTextInput:(id<UITextInput>)textInput min:(NSInteger)min max:(NSInteger)max;

- (void)sz_addConstraintWithTextInput:(id<UITextInput>)textInput length:(NSInteger)length;

- (void)sz_addConstraintWithTextInput:(id<UITextInput>)textInput regex:(NSString *)regex;

@end
