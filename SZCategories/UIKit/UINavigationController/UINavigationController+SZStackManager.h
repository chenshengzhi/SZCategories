//
//  UINavigationController+SZStackManager.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (SZStackManager)

- (id)sz_findViewController:(NSString *)className;

- (BOOL)sz_isOnlyContainRootViewController;

- (UIViewController *)sz_rootViewController;

- (NSArray *)sz_popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated;

- (NSArray *)sz_popViewControllerCount:(NSInteger)count animated:(BOOL)animated ;

@end
