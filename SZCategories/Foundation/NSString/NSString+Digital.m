//
//  NSString+Digital.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSString+Digital.h"

@implementation NSString (Digital)

//判断是否时整形
- (BOOL)isPureInt {
    NSString *regex = [NSString stringWithFormat:@"^[0-9]{0,}$"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

//判断是否为浮点形
- (BOOL)isPureFloat {
    NSString *regex = [NSString stringWithFormat:@"^[0-9]\\.{0,1}[0-9]{0,}$"];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

@end
