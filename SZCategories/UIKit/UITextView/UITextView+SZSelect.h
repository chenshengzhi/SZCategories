//
//  UITextView+SZSelect.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (SZSelect)

- (NSRange)sz_selectedRange;
- (void)sz_selectAllText;
- (void)sz_setSelectedRange:(NSRange)range;

@end
