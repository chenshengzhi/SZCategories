//
//  NSString+SZRegexCategory.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZRegexCategory)

- (BOOL)sz_isValidateByRegex:(NSString *)regex;

/**
 *  邮箱的有效性
 */
- (BOOL)sz_isEmailAddress;

/**
 *  简单的身份证有效性
 *
 */
- (BOOL)sz_simpleVerifyIdentityCardNum;

@end
