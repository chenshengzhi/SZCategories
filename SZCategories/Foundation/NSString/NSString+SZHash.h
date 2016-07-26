//
//  NSString+SZHash.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (SZHash)

@property (readonly) NSString *sz_md5String;
@property (readonly) NSString *sz_sha1String;
@property (readonly) NSString *sz_sha256String;
@property (readonly) NSString *sz_sha512String;

- (NSString *)sz_hmacMD5StringWithKey:(NSString *)key;
- (NSString *)sz_hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)sz_hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)sz_hmacSHA512StringWithKey:(NSString *)key;

@end