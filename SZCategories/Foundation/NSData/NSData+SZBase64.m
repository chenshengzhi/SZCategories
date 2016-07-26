//
//  NSData+SZBase64.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSData+SZBase64.h"
#import <Availability.h>

@implementation NSData (SZBase64)

+ (NSData *)sz_dataWithBase64EncodedString:(NSString *)string {
    if (![string length]) return nil;
    NSData *decoded = [[self alloc] initWithBase64EncodedString:string options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [decoded length]? decoded: nil;
}

- (NSString *)sz_base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth {
    if (![self length]) return nil;
    NSString *encoded = nil;
    switch (wrapWidth) {
        case 64:
            return [self base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
        case 76:
            return [self base64EncodedStringWithOptions:NSDataBase64Encoding76CharacterLineLength];
        default:
            encoded = [self base64EncodedStringWithOptions:(NSDataBase64EncodingOptions)0];
    }
    if (!wrapWidth || wrapWidth >= [encoded length]) {
        return encoded;
    }
    wrapWidth = (wrapWidth / 4) * 4;
    NSMutableString *result = [NSMutableString string];
    for (NSUInteger i = 0; i < [encoded length]; i+= wrapWidth) {
        if (i + wrapWidth >= [encoded length]) {
            [result appendString:[encoded substringFromIndex:i]];
            break;
        }
        [result appendString:[encoded substringWithRange:NSMakeRange(i, wrapWidth)]];
        [result appendString:@"\r\n"];
    }
    return result;
}

- (NSString *)sz_base64EncodedString {
    return [self sz_base64EncodedStringWithWrapWidth:0];
}

@end