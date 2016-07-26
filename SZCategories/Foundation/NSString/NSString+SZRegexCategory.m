//
//  NSString+SZRegexCategory.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZRegexCategory.h"

@implementation NSString (SZRegexCategory)

- (BOOL)sz_isValidateByRegex:(NSString *)regex {
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

//邮箱
- (BOOL)sz_isEmailAddress {
    NSString *emailRegex = @"[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self sz_isValidateByRegex:emailRegex];
}

//身份证号
- (BOOL)sz_simpleVerifyIdentityCardNum {
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    return [self sz_isValidateByRegex:regex2];
}

@end
