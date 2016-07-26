//
//  UIButton+SZBackgroundColor.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIButton+SZBackgroundColor.h"
#import "UIImage+SZColorCreate.h"

@implementation UIButton (SZBackgroundColor)

- (void)sz_setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage sz_imageWithColor:backgroundColor] forState:state];
}

@end
