//
//  NSObject+SZKVO.h
//  SZCategories
//
//  Created by 陈圣治 on 16/8/2.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SZKVO)

- (void)sz_observeObject:(NSObject *)object
              forKeyPath:(NSString *)keyPath
                 options:(NSKeyValueObservingOptions)options
              usingBlock:(void (^)(NSDictionary<NSString *, id> *change))block;

- (void)sz_cancelObserveObject:(NSObject *)object forKeyPath:(NSString *)keyPath;

- (void)sz_cancelObserveAllObject;

@end
