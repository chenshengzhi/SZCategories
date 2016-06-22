//
//  UIViewController+Visible.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIViewController+Visible.h"

@implementation UIViewController (Visible)

- (BOOL)isVisible {
    return [self isViewLoaded] && self.view.window;
}

@end
