//
//  UIView+Visuals.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Visuals)

- (void)cornerRadius:(CGFloat)radius 
         strokeSize:(CGFloat)size 
              color:(UIColor *)color;

- (void)setRoundedCorners:(UIRectCorner)corners
                  radius:(CGFloat)radius;

- (void)shadowWithColor:(UIColor *)color 
                offset:(CGSize)offset 
               opacity:(CGFloat)opacity 
                radius:(CGFloat)radius;

- (void)removeFromSuperviewWithFadeDuration:(NSTimeInterval)duration;

- (void)addSubview:(UIView *)view withTransition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration;

- (void)removeFromSuperviewWithTransition:(UIViewAnimationTransition)transition duration:(NSTimeInterval)duration;

- (void)rotateByAngle:(CGFloat)angle 
            duration:(NSTimeInterval)duration 
         autoreverse:(BOOL)autoreverse
         repeatCount:(CGFloat)repeatCount
      timingFunction:(CAMediaTimingFunction *)timingFunction;

- (void)moveToPoint:(CGPoint)newPoint 
          duration:(NSTimeInterval)duration 
       autoreverse:(BOOL)autoreverse
       repeatCount:(CGFloat)repeatCount
    timingFunction:(CAMediaTimingFunction *)timingFunction;

@end
