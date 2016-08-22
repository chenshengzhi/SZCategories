//
//  UINavigationController+SZStackManager.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UINavigationController+SZStackManager.h"

@implementation UINavigationController (SZStackManager)

- (id)sz_findViewController:(NSString *)className {
    for (UIViewController *viewController in self.viewControllers) {
        if ([viewController isKindOfClass:NSClassFromString(className)]) {
            return viewController;
        }
    }
    
    return nil;
}

- (BOOL)sz_isOnlyContainRootViewController {
    if (self.viewControllers &&
        self.viewControllers.count == 1) {
        return YES;
    }
    return NO;
}

- (UIViewController *)sz_rootViewController {
    if (self.viewControllers && [self.viewControllers count] >0) {
        return [self.viewControllers firstObject];
    }
    return nil;
}

- (NSArray *)sz_popToViewControllerWithClassName:(NSString *)className animated:(BOOL)animated; {
    return [self popToViewController:[self sz_findViewController:className] animated:YES];
}

- (NSArray *)sz_popViewControllerCount:(NSInteger)count animated:(BOOL)animated {
    NSAssert(count < self.viewControllers.count, @"out of index");
    UIViewController *toVc = self.viewControllers[self.viewControllers.count - count - 1];
    return [self popToViewController:toVc animated:animated];
}

@end
