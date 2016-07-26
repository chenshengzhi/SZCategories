//
//  NSString+SZDigital.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (SZDigital)

//判断是否时整形
- (BOOL)sz_isPureInt;

//判断是否为浮点形
- (BOOL)sz_isPureFloat;

@end
