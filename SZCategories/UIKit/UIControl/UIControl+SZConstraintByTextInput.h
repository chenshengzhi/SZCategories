//
//  UIControl+SZConstraintByTextInput.h
//  SZCategories
//
//  Created by 陈圣治 on 16/8/18.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (SZConstraintByTextInput)

- (void)sz_addConstraintTo:(id<UITextInput>)inputeView min:(NSInteger)min max:(NSInteger)max;

@end
