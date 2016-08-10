//
//  UILabel+SZSuggestSize.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UILabel+SZSuggestSize.h"

@implementation UILabel (SZSuggestSize)

- (CGSize)sz_suggestedSizeForWidth:(CGFloat)width {
    if (self.attributedText) {
        return [self sz_suggestSizeForAttributedString:self.attributedText width:width];
    } else {
        return [self sz_suggestSizeForString:self.text width:width];
    }
}

- (CGSize)sz_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    CGSize size = [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                       context:nil].size;
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

- (CGSize)sz_suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}];
    return [self sz_suggestSizeForAttributedString:attributedString width:width];
}

@end
