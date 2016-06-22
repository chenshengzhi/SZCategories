//
//  NSArray+SafeAccess.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSArray (SafeAccess)

- (id)objectWithIndex:(NSUInteger)index;

- (NSString *)stringWithIndex:(NSUInteger)index;

- (NSNumber *)numberWithIndex:(NSUInteger)index;

- (NSArray *)arrayWithIndex:(NSUInteger)index;

- (NSDictionary *)dictionaryWithIndex:(NSUInteger)index;

- (NSInteger)integerWithIndex:(NSUInteger)index;

- (NSUInteger)unsignedIntegerWithIndex:(NSUInteger)index;

- (BOOL)boolWithIndex:(NSUInteger)index;

- (short)shortWithIndex:(NSUInteger)index;

- (float)floatWithIndex:(NSUInteger)index;

- (double)doubleWithIndex:(NSUInteger)index;

- (CGFloat)CGFloatWithIndex:(NSUInteger)index;

@end
