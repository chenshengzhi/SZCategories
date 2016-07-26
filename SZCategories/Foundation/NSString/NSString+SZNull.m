//
//  NSString+SZNull.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZNull.h"
#import "NSString+SZTrims.h"

@implementation NSString (SZNull)

+ (BOOL)sz_isNull:(NSString *)text {
    if (!text) {
        return YES;
    }
    
    if ([text sz_trimmingWhitespaceAndNewlines].length == 0) {
        return YES;
    }
    
    return NO;
}

@end
