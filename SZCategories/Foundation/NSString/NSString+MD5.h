//
// NSString+MD5.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)

+ (NSString *) stringWithMD5OfFile: (NSString *) path;

- (NSString *) MD5Hash;

@end

