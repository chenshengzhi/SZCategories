//
//  NSData+Hash.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Hash)

@property (readonly) NSData *md5Data;
@property (readonly) NSData *sha1Data;
@property (readonly) NSData *sha256Data;
@property (readonly) NSData *sha512Data;

- (NSData *)hmacMD5DataWithKey:(NSData *)key;
- (NSData *)hmacSHA1DataWithKey:(NSData *)key;
- (NSData *)hmacSHA256DataWithKey:(NSData *)key;
- (NSData *)hmacSHA512DataWithKey:(NSData *)key;

@end
