//
//  UIScrollView+SZDirection.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIScrollView+SZDirection.h"


@implementation UIScrollView (SZDirection)

- (ScrollDirection)sz_scrollDirection {
    ScrollDirection direction;
    
    if ([self.panGestureRecognizer translationInView:self.superview].y > 0.0f) {
        direction = ScrollDirectionUp;
    } else if ([self.panGestureRecognizer translationInView:self.superview].y < 0.0f) {
        direction = ScrollDirectionDown;
    } else if ([self.panGestureRecognizer translationInView:self].x < 0.0f) {
        direction = ScrollDirectionLeft;
    } else if ([self.panGestureRecognizer translationInView:self].x > 0.0f) {
        direction = ScrollDirectionRight;
    } else {
        direction = ScrollDirectionWTF;
    }
    
    return direction;
}

@end
