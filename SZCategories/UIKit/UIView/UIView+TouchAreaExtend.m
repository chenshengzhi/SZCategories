//
//  UIView+TouchAreaExtend.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIView+TouchAreaExtend.h"
#import  <objc/runtime.h>

@implementation UIView (TouchAreaExtend)

static char UIViewTouchAreaExtendKey;

- (void)extendTouchAreaWithLength:(int)length {
    objc_setAssociatedObject(self, &UIViewTouchAreaExtendKey, @(length), OBJC_ASSOCIATION_RETAIN);
    
    Method originalMethod = class_getInstanceMethod(self.class, @selector(hitTest:withEvent:));
    Method alteredMethod = class_getInstanceMethod(self.class, @selector(extend_HitTest:withEvent:));
    
    method_exchangeImplementations(originalMethod, alteredMethod);
}

- (UIView *)extend_HitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSNumber *number = objc_getAssociatedObject(self, &UIViewTouchAreaExtendKey);
    if (number && number.intValue != 0) {
        CGRect bounds = self.bounds;
        CGFloat length = number.intValue;
        bounds.origin.x -= length;
        bounds.origin.y -= length;
        bounds.size.width += 2 * length;
        bounds.size.height += 2 * length;
        if (CGRectContainsPoint(bounds, point)) {
            return self;
        }
        return nil;
    } else {
        return [self extend_HitTest:point withEvent:event];
    }
}

@end
