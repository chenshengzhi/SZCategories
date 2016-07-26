//
//  NSArray+SZSafeAccess.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (SZSafeAccess)

- (id)sz_objectWithIndex:(NSUInteger)index;

- (NSString *)sz_stringWithIndex:(NSUInteger)index;

- (NSNumber *)sz_numberWithIndex:(NSUInteger)index;

- (NSArray *)sz_arrayWithIndex:(NSUInteger)index;

- (NSDictionary *)sz_dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)sz_integerWithIndex:(NSUInteger)index;

- (NSUInteger)sz_unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)sz_boolWithIndex:(NSUInteger)index;

- (short)sz_shortWithIndex:(NSUInteger)index;

- (float)sz_floatWithIndex:(NSUInteger)index;

- (double)sz_doubleWithIndex:(NSUInteger)index;

- (CGFloat)sz_CGFloatWithIndex:(NSUInteger)index;

@end
