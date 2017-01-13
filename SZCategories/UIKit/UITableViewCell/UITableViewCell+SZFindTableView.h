//
//  UITableViewCell+SZFindTableView.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (SZFindTableView)

- (UITableView *)sz_tableView;

- (UIView *)sz_topSeparatorView;

- (UIView *)sz_bottomSeparatorView;

@end
