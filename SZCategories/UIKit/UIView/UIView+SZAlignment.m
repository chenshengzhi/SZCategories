//
//  UIView+SZAlignment.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIView+SZAlignment.h"
#import "UIView+SZFrameHelper.h"

@implementation UIView (SZAlignment)

- (void)sz_verticalAlignCenterByView:(UIView *)anotherView {
    self.top = anotherView.frame.origin.y + (anotherView.frame.size.height - self.frame.size.height)/2;
}

- (void)sz_horizantalCenterInSuperViewWithAnotherView:(UIView *)anotherView {
    [self sz_horizantalCenterInSuperViewWithAnotherView:anotherView padding:0];
}

- (void)sz_horizantalCenterInSuperViewWithAnotherView:(UIView *)anotherView padding:(CGFloat)padding {
    NSAssert(self.superview, @"self.superview == nil");
    NSAssert(self.superview == anotherView.superview, @"self.superview != anotherView.superview");
    
    UIView *superview = self.superview;
    
    self.left = superview.width/2 - (self.width + anotherView.width + padding);
    anotherView.left = self.right + padding;
    
    self.centerY = superview.height/2;
    anotherView.centerY = self.centerY;
}

@end
