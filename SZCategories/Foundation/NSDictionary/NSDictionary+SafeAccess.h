//
//  NSDictionary+SafeAccess.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (SafeAccess)

- (BOOL)hasKey:(NSString *)key;

- (NSString *)stringForKey:(id)key;

- (NSNumber *)numberForKey:(id)key;

- (NSArray *)arrayForKey:(id)key;

- (NSDictionary *)dictionaryForKey:(id)key;

- (NSInteger)integerForKey:(id)key;

- (NSUInteger)unsignedIntegerForKey:(id)key;

- (BOOL)boolForKey:(id)key;

- (short)shortForKey:(id)key;

- (float)floatForKey:(id)key;

- (double)doubleForKey:(id)key;

- (long long)longLongForKey:(id)key;

- (unsigned long long)unsignedLongLongForKey:(id)key;

@end
