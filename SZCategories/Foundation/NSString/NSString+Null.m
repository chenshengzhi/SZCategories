//
//  NSString+Null.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+Null.h"
#import "NSString+Trims.h"

@implementation NSString (Null)

+ (BOOL)isNull:(NSString *)text {
    if (!text) {
        return YES;
    }
    
    if ([text trimmingWhitespaceAndNewlines].length == 0) {
        return YES;
    }
    
    return NO;
}

@end
