//
//  UIScrollView+HasButton.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIScrollView+HasButton.h"
#import <objc/runtime.h>

@implementation UIScrollView (HasButton)

+ (void)load {
    Method origin = class_getInstanceMethod([UIScrollView class], @selector(gestureRecognizer:shouldReceiveTouch:));
    if (origin != NULL) {
        Method now = class_getInstanceMethod([UIScrollView class], @selector(SZ_gestureRecognizer:shouldReceiveTouch:));
        method_exchangeImplementations(origin, now);
    }
}

- (BOOL)SZ_gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self];
    UIView *topMostView = [self hitTest:point withEvent:nil];
    if ([topMostView isKindOfClass:[UIControl class]]) {
        return NO;
    } else {
        return [self SZ_gestureRecognizer:gestureRecognizer shouldReceiveTouch:touch];
    }
}

@end
