//
//  UIView+SZAlignment.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (SZAlignment)

- (void)sz_verticalAlignCenterByView:(UIView *)anotherView;

- (void)sz_horizantalCenterInSuperViewWithAnotherView:(UIView *)anotherView;

- (void)sz_horizantalCenterInSuperViewWithAnotherView:(UIView *)anotherView padding:(CGFloat)padding;

@end
