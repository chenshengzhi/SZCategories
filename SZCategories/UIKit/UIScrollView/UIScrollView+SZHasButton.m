//
//  UIScrollView+SZHasButton.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIScrollView+SZHasButton.h"
#import <objc/runtime.h>

@implementation UIScrollView (SZHasButton)

+ (void)load {
    Method origin = class_getInstanceMethod([UIScrollView class], @selector(gestureRecognizer:shouldReceiveTouch:));
    if (origin != NULL) {
        Method now = class_getInstanceMethod([UIScrollView class], @selector(sz_gestureRecognizer:shouldReceiveTouch:));
        method_exchangeImplementations(origin, now);
    }
}

- (BOOL)sz_gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    CGPoint point = [touch locationInView:self];
    UIView *topMostView = [self hitTest:point withEvent:nil];
    if ([topMostView isKindOfClass:[UIControl class]]) {
        return NO;
    } else {
        return [self sz_gestureRecognizer:gestureRecognizer shouldReceiveTouch:touch];
    }
}

@end
