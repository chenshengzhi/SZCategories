//
//  NSString+HTMLText.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+HTMLText.h"

@implementation NSString (HTMLText)

- (NSAttributedString *)attributedStringFromHTML {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO];
    NSDictionary *options = @{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                              NSCharacterEncodingDocumentAttribute: @(NSUTF8StringEncoding)};
    return [[NSAttributedString alloc] initWithData:data
                                            options:options
                                 documentAttributes:nil
                                              error:nil];
}

@end
