//
//  UIWindow+SZHierarchy.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIWindow+SZHierarchy.h"

@implementation UIWindow (SZHierarchy)

- (UIViewController *)sz_topMostController {
    UIViewController *topController = [self rootViewController];
    
    while ([topController presentedViewController]) {
        topController = [topController presentedViewController];
    }

    return topController;
}

- (UIViewController *)sz_currentViewController; {
    UIViewController *currentViewController = [self sz_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *)currentViewController topViewController]) {
        currentViewController = [(UINavigationController *)currentViewController topViewController];
    }
    return currentViewController;
}

@end
