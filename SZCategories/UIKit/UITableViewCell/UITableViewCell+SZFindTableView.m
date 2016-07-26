//
//  UITableViewCell+SZFindTableView.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UITableViewCell+SZFindTableView.h"

@implementation UITableViewCell (SZFindTableView)

- (UITableView *)sz_tableView {
    UIView *superView = self.superview;
    while (superView && ![superView isKindOfClass:[UITableView class]]) {
        superView = superView.superview;
    }
    return (UITableView *)superView;
}

@end
