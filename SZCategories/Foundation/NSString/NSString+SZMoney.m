//
//  NSString+SZMoney.m
//  SZCategories
//
//  Created by 陈圣治 on 16/8/31.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+SZMoney.h"

@implementation NSString (SZMoney)

- (NSString *)sz_readableMoney {
    NSRange range = [self rangeOfString:@"."];
    NSInteger index = 0;
    NSMutableString *readableMoney = [[NSMutableString alloc] initWithString:self];
    if (range.location != NSNotFound) {
        index = range.location;
    } else {
        index = self.length;
    }
    while (index > 3) {
        index -= 3;
        [readableMoney insertString:@"," atIndex:index];
    }
    return [readableMoney copy];
}

@end
