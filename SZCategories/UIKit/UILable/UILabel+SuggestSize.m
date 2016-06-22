//
//  UILabel+SuggestSize.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UILabel+SuggestSize.h"

@implementation UILabel (SuggestSize)

- (CGSize)suggestedSizeForWidth:(CGFloat)width {
    if (self.attributedText) {
        return [self suggestSizeForAttributedString:self.attributedText width:width];
    } else {
        return [self suggestSizeForString:self.text width:width];
    }
}

- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                context:nil].size;
}

- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: self.font}]
                                          width:width];
}

@end
