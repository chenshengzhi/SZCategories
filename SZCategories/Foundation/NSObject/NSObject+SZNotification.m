//
//  NSObject+SZNotification.m
//  SZCategories
//
//  Created by 陈圣治 on 16/8/2.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSObject+SZNotification.h"
#import <objc/runtime.h>

@interface _SZNSObserverWrapper : NSObject

@property (nonatomic, strong) id<NSObject>observer;

@end

@implementation _SZNSObserverWrapper

- (void)dealloc {
    if (_observer) {
        [[NSNotificationCenter defaultCenter] removeObserver:_observer];
    }
}

@end


@implementation NSObject (SZNotification)

static char SZ_NSObserverDictKey;

- (void)sz_observeNotificationWithName:(NSString *)name
                            usingBlock:(void (^)(NSNotification *note))block {
    [self sz_observeNotificationWithName:name object:nil queue:[NSOperationQueue mainQueue] usingBlock:block];
}

- (void)sz_observeNotificationWithName:(NSString *)name
                                object:(id)obj
                                 queue:(NSOperationQueue *)queue
                            usingBlock:(void (^)(NSNotification *note))block {
    _SZNSObserverWrapper *observerWrapper = [[_SZNSObserverWrapper alloc] init];
    observerWrapper.observer = [[NSNotificationCenter defaultCenter] addObserverForName:name object:obj queue:queue usingBlock:block];

    NSMutableDictionary *dict = objc_getAssociatedObject(self, &SZ_NSObserverDictKey);
    if (!dict) {
        dict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &SZ_NSObserverDictKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    dict[name] = observerWrapper;
}

- (void)sz_cancelObserveNotificationName:(NSString *)name {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, &SZ_NSObserverDictKey);
    if (dict) {
        [dict removeObjectForKey:name];
        if (dict.count == 0) {
            [self sz_cancelObserveAllNotification];
        }
    }
}

- (void)sz_cancelObserveAllNotification {
    objc_setAssociatedObject(self, &SZ_NSObserverDictKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
