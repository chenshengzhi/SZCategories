//
//  UINavigationController+StackManager.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (StackManager)

- (id)findViewController:(NSString *)className;
- (BOOL)isOnlyContainRootViewController;
- (UIViewController *)rootViewController;
- (NSArray *)popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated;

@end
