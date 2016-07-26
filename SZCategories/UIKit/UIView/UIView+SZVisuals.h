//
//  UIView+SZVisuals.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (SZVisuals)

- (void)sz_cornerRadius:(CGFloat)radius 
         strokeSize:(CGFloat)size 
              color:(UIColor *)color;

- (void)sz_setRoundedCorners:(UIRectCorner)corners
                  radius:(CGFloat)radius;

- (void)sz_shadowWithColor:(UIColor *)color 
                offset:(CGSize)offset 
               opacity:(CGFloat)opacity 
                radius:(CGFloat)radius;

- (void)sz_removeFromSuperviewWithFadeDuration:(NSTimeInterval)duration;

- (void)sz_addSubview:(UIView *)view withTransition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration;

- (void)sz_removeFromSuperviewWithTransition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration;

- (void)sz_rotateByAngle:(CGFloat)angle 
            duration:(NSTimeInterval)duration 
         autoreverse:(BOOL)autoreverse
         repeatCount:(CGFloat)repeatCount
      timingFunction:(CAMediaTimingFunction *)timingFunction;

- (void)sz_moveToPoint:(CGPoint)newPoint 
          duration:(NSTimeInterval)duration 
       autoreverse:(BOOL)autoreverse
       repeatCount:(CGFloat)repeatCount
    timingFunction:(CAMediaTimingFunction *)timingFunction;

@end
