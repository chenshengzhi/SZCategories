//
//  NSData+SZHash.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (SZHash)

@property (readonly) NSData *sz_md5Data;
@property (readonly) NSData *sz_sha1Data;
@property (readonly) NSData *sz_sha256Data;
@property (readonly) NSData *sz_sha512Data;

- (NSData *)sz_hmacMD5DataWithKey:(NSData *)key;
- (NSData *)sz_hmacSHA1DataWithKey:(NSData *)key;
- (NSData *)sz_hmacSHA256DataWithKey:(NSData *)key;
- (NSData *)sz_hmacSHA512DataWithKey:(NSData *)key;

@end
