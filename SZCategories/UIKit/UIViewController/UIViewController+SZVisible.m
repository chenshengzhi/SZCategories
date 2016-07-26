//
//  UIViewController+SZVisible.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIViewController+SZVisible.h"

@implementation UIViewController (SZVisible)

- (BOOL)sz_isVisible {
    return [self isViewLoaded] && self.view.window;
}

@end
