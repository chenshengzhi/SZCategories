//
//  UIWindow+SZHierarchy.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (SZHierarchy)

- (UIViewController *)sz_topMostController;

- (UIViewController *)sz_currentViewController;

@end
