//
//  NSObject+SZKVO.m
//  SZCategories
//
//  Created by 陈圣治 on 16/8/2.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSObject+SZKVO.h"
#import <objc/runtime.h>
@class _SZKVOObserverWrapper;
@class _SZKVOOBserveHostWrapper;

static char SZ_KVOObserverDictKey;
static char SZ_KVOObserveHostKey;

#pragma mark - @interface NSObject (SZKVOPrivate) -
@interface NSObject (SZKVOPrivate)

- (void)sz_removeObserverWrapper:(_SZKVOObserverWrapper *)observerWrapper forKeyPath:(NSString *)keyPath;

@end

#pragma mark - @interface _SZKVOObserverWrapper -
@interface _SZKVOObserverWrapper : NSObject {
    void *_observer;
}

@property (nonatomic, weak) NSObject *observer;
@property (nonatomic, weak) NSObject *object;
@property (nonatomic, strong) NSString *keyPath;
@property (nonatomic, copy) void (^block)(NSDictionary<NSString *, id> *);

@end

#pragma mark - @implementation _SZKVOObserverWrapper -
@implementation _SZKVOObserverWrapper

- (NSObject *)observer {
    return (__bridge NSObject *)(_observer);
}

- (void)setObserver:(NSObject *)observer {
     _observer = (__bridge void *)(observer);
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    if (self.block) {
        self.block(change);
    }
}

- (void)dealloc {
    if (self.object) {
        [self.object sz_removeObserverWrapper:self forKeyPath:self.keyPath];
        _observer = NULL;
    }
}

@end

#pragma mark - @interface _SZKVOOBserveHostWrapper -
@interface _SZKVOOBserveHostWrapper : NSObject {
    void *_host;
}

@property (nonatomic, strong) NSObject *host;
@property (nonatomic, weak) _SZKVOObserverWrapper *observerWrapper;

@end

#pragma mark - @implementation _SZKVOOBserveHostWrapper -
@implementation _SZKVOOBserveHostWrapper

- (void)setHost:(NSObject *)host {
    _host = (__bridge void *)(host);
}

- (NSObject *)host {
    return (__bridge NSObject *)(_host);
}

- (void)dealloc {
    if (self.observerWrapper) {
        NSObject *host = [self host];
        [host sz_removeObserverWrapper:self.observerWrapper forKeyPath:self.observerWrapper.keyPath];
        self.observerWrapper.object = nil;
        [self.observerWrapper.observer sz_cancelObserveObject:host forKeyPath:self.observerWrapper.keyPath];
        _host = NULL;
    }
}

@end

#pragma mark - @implementation NSObject (SZKVO) -
@implementation NSObject (SZKVO)

- (void)sz_kvoCacheWrapper:(NSObject *)wrapper forObject:(NSObject *)object keyPath:(NSString *)keyPath associateKey:(void *)associateKey {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, associateKey);
    if (!dict) {
        dict = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, associateKey, dict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    NSString *dictKey = [NSString stringWithFormat:@"%p-%@", object, keyPath];
    dict[dictKey] = wrapper;
}

- (void)sz_observeObject:(NSObject *)object
              forKeyPath:(NSString *)keyPath
                 options:(NSKeyValueObservingOptions)options
              usingBlock:(void (^)(NSDictionary<NSString *, id> *change))block {
    _SZKVOObserverWrapper *observerWrapper = [[_SZKVOObserverWrapper alloc] init];
    observerWrapper.observer = self;
    observerWrapper.object = object;
    observerWrapper.keyPath = keyPath;
    observerWrapper.block = block;
    [object addObserver:observerWrapper forKeyPath:keyPath options:options context:NULL];

    _SZKVOOBserveHostWrapper *hostWrapper = [[_SZKVOOBserveHostWrapper alloc] init];
    hostWrapper.observerWrapper = observerWrapper;
    hostWrapper.host = object;

    [self sz_kvoCacheWrapper:observerWrapper forObject:object keyPath:keyPath associateKey:&SZ_KVOObserverDictKey];
    [object sz_kvoCacheWrapper:hostWrapper forObject:self keyPath:keyPath associateKey:&SZ_KVOObserveHostKey];
}

- (void)sz_cancelObserveObject:(NSObject *)object forKeyPath:(NSString *)keyPath {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, &SZ_KVOObserverDictKey);
    if (dict) {
        NSString *key = [NSString stringWithFormat:@"%p-%@", object, keyPath];
        [dict removeObjectForKey:key];
        if (dict.count == 0) {
            [self sz_cancelObserveAllObject];
        }
    }
}

- (void)sz_cancelObserveAllObject {
    objc_setAssociatedObject(self, &SZ_KVOObserverDictKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

#pragma mark - @implementation NSObject (SZKVOPrivate) -
@implementation NSObject (SZKVOPrivate)

- (void)sz_removeObserverWrapper:(_SZKVOObserverWrapper *)observerWrapper forKeyPath:(NSString *)keyPath {
    [self removeObserver:observerWrapper forKeyPath:keyPath];
    NSMutableDictionary *dict = objc_getAssociatedObject(self, &SZ_KVOObserveHostKey);
    if (dict) {
        NSString *key = [NSString stringWithFormat:@"%p-%@", observerWrapper.observer, keyPath];
        [dict removeObjectForKey:key];
        if (dict.count == 0) {
            objc_setAssociatedObject(self, &SZ_KVOObserveHostKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
}

@end
