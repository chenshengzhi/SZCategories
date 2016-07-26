//
// NSString+SZMD5.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZMD5)

+ (NSString *)sz_stringWithMD5OfFile:(NSString *) path;

- (NSString *)sz_MD5Hash;

@end

