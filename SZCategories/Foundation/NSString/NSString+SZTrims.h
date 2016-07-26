//
//  NSString+SZTrims.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZTrims)

- (NSString *)sz_stringByStrippingHTML;
- (NSString *)sz_stringByRemovingScriptsAndStrippingHTML;

- (NSString *)sz_trimmingWhitespace;
- (NSString *)sz_trimmingWhitespaceAndNewlines;

@end
