//
//  UIWindow+Hierarchy.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIWindow+Hierarchy.h"

@implementation UIWindow (Hierarchy)

- (UIViewController *) topMostController {
    UIViewController *topController = [self rootViewController];
    
    while ([topController presentedViewController]) {
        topController = [topController presentedViewController];
    }

    return topController;
}

- (UIViewController *)currentViewController; {
    UIViewController *currentViewController = [self topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController *)currentViewController topViewController]) {
        currentViewController = [(UINavigationController *)currentViewController topViewController];
    }
    return currentViewController;
}

@end
