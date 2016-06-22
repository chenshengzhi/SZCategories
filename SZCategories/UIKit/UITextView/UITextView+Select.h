//
//  UITextView+Select.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Select)

- (NSRange)selectedRange;
- (void)selectAllText;
- (void)setSelectedRange:(NSRange)range;

@end
