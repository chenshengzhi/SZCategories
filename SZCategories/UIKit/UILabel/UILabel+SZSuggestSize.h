//
//  UILabel+SZSuggestSize.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SZSuggestSize)

- (CGSize)sz_suggestedSizeForWidth:(CGFloat)width;
- (CGSize)sz_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;
- (CGSize)sz_suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
