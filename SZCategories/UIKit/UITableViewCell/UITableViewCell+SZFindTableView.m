//
//  UITableViewCell+SZFindTableView.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UITableViewCell+SZFindTableView.h"

#define UITableViewCellSeparatorViewClassNameString @"_UITableViewCellSeparatorView"

@implementation UITableViewCell (SZFindTableView)

- (UITableView *)sz_tableView {
    UIView *superView = self.superview;
    while (superView && ![superView isKindOfClass:[UITableView class]]) {
        superView = superView.superview;
    }
    return (UITableView *)superView;
}

- (UIView *)sz_topSeparatorView {
    for (UIView *separatorView in self.subviews) {
        if ([separatorView isKindOfClass:NSClassFromString(UITableViewCellSeparatorViewClassNameString)]) {
            if (separatorView.frame.origin.y == 0) {
                return separatorView;
            }
        }
    }
    return nil;
}

- (UIView *)sz_bottomSeparatorView {
    for (UIView *separatorView in self.subviews) {
        if ([separatorView isKindOfClass:NSClassFromString(UITableViewCellSeparatorViewClassNameString)]) {
            if (separatorView.frame.origin.y > 0) {
                return separatorView;
            }
        }
    }
    return nil;
}

@end
