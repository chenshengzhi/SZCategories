//
//  UIView+SZRecursiveDescription.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SZRecursiveDescription)

#ifdef DEBUG
//打印视图层级
- (NSString *)sz_recursiveView;
//打印约束
- (NSString *)sz_constraintsDescription;
//打印整个视图树的字符串
- (NSString *)sz_autolayoutTraceDescription;
#endif

@end
