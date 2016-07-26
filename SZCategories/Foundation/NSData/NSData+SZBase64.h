//
//  NSData+SZBase64.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SZBase64)

+ (NSData *)sz_dataWithBase64EncodedString:(NSString *)string;

- (NSString *)sz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;

- (NSString *)sz_base64EncodedString;

@end
