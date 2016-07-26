//
//  NSDictionary+SZSafeAccess.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDictionary (SZSafeAccess)

- (BOOL)sz_hasKey:(NSString *)key;

- (NSString *)sz_stringForKey:(id)key;

- (NSNumber *)sz_numberForKey:(id)key;

- (NSArray *)sz_arrayForKey:(id)key;

- (NSDictionary *)sz_dictionaryForKey:(id)key;

- (NSInteger)sz_integerForKey:(id)key;

- (NSUInteger)sz_unsignedIntegerForKey:(id)key;

- (BOOL)sz_boolForKey:(id)key;

- (short)sz_shortForKey:(id)key;

- (float)sz_floatForKey:(id)key;

- (double)sz_doubleForKey:(id)key;

- (long long)sz_longLongForKey:(id)key;

- (unsigned long long)sz_unsignedLongLongForKey:(id)key;

@end
