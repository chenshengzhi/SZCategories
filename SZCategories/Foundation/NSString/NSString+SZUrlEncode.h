//
//  NSString+SZUrlEncode.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZUrlEncode)

- (NSString *)sz_urlEncode;
- (NSString *)sz_urlEncodeUsingEncoding:(NSStringEncoding)encoding;

- (NSString *)sz_urlDecode;
- (NSString *)sz_urlDecodeUsingEncoding:(NSStringEncoding)encoding;

- (NSDictionary *)sz_dictionaryFromURLParameters;

@end
