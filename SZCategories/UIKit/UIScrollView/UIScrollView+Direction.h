//
//  UIScrollView+Direction.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//  https://github.com/mergesort/UIScrollView-Direction

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ScrollDirection) {
    ScrollDirectionUp,
    ScrollDirectionDown,
    ScrollDirectionLeft,
    ScrollDirectionRight,
    ScrollDirectionWTF
};


////////////////////////////////////////////////////////////////////////////////
#pragma mark - Interface

@interface UIScrollView (Direction)

- (ScrollDirection)scrollDirection;

@end
