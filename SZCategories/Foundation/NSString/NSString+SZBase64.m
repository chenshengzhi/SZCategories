//
//  NSString+SZBase64.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZBase64.h"
#import "NSData+SZBase64.h"

@implementation NSString (SZBase64)

+ (NSString *)sz_stringWithBase64EncodedString:(NSString *)string {
    NSData *data = [NSData sz_dataWithBase64EncodedString:string];
    if (data) {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)sz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data sz_base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)sz_base64EncodedString {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data sz_base64EncodedString];
}

- (NSString *)sz_base64DecodedString {
    return [NSString sz_stringWithBase64EncodedString:self];
}

- (NSData *)sz_base64DecodedData {
    return [NSData sz_dataWithBase64EncodedString:self];
}

@end
