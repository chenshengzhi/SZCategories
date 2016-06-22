//
//  NSString+Trims.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Trims)

- (NSString *)stringByStrippingHTML;
- (NSString *)stringByRemovingScriptsAndStrippingHTML;

- (NSString *)trimmingWhitespace;
- (NSString *)trimmingWhitespaceAndNewlines;

@end
