//
//  NSArray+SZSafeAccess.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSArray+SZSafeAccess.h"

@implementation NSArray (SZSafeAccess)

- (id)sz_objectWithIndex:(NSUInteger)index {
    if (index <self.count) {
        return self[index];
    } else {
        return nil;
    }
}

- (NSString *)sz_stringWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    if (value == nil || value == [NSNull null]) {
        return @"";
    }
    if ([value isKindOfClass:[NSString class]]) {
        return (NSString *)value;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value stringValue];
    }
    
    return nil;
}


- (NSNumber *)sz_numberWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    if ([value isKindOfClass:[NSNumber class]]) {
        return (NSNumber *)value;
    }
    if ([value isKindOfClass:[NSString class]]) {
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        return [f numberFromString:(NSString *)value];
    }
    return nil;
}

- (NSArray *)sz_arrayWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSArray class]]) {
        return value;
    }
    return nil;
}


- (NSDictionary *)sz_dictionaryWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    if (value == nil || value == [NSNull null]) {
        return nil;
    }
    if ([value isKindOfClass:[NSDictionary class]]) {
        return value;
    }
    return nil;
}

- (NSInteger)sz_integerWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    return 0;
}

- (NSUInteger)sz_unsignedIntegerWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSString class]] || [value isKindOfClass:[NSNumber class]]) {
        return [value unsignedIntegerValue];
    }
    return 0;
}

- (BOOL)sz_boolWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return NO;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value boolValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value boolValue];
    }
    return NO;
}

- (short)sz_shortWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value shortValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value intValue];
    }
    return 0;
}

- (float)sz_floatWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return 0;
}

- (double)sz_doubleWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    
    if (value == nil || value == [NSNull null]) {
        return 0;
    }
    if ([value isKindOfClass:[NSNumber class]] || [value isKindOfClass:[NSString class]]) {
        return [value doubleValue];
    }
    return 0;
}

- (CGFloat)sz_CGFloatWithIndex:(NSUInteger)index {
    id value = [self sz_objectWithIndex:index];
    
    CGFloat f = [value doubleValue];
    
    return f;
}

@end
