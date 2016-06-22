//
//  UIWindow+Hierarchy.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (Hierarchy)

- (UIViewController *) topMostController;

- (UIViewController *)currentViewController;

@end
