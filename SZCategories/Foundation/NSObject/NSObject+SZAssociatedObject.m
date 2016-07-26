//
//  NSObject+SZAssociatedObject.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSObject+SZAssociatedObject.h"
#import  <objc/runtime.h>
@implementation NSObject (SZAssociatedObject)

- (void)sz_associateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN);
}

- (void)sz_weaklyAssociateValue:(id)value withKey:(void *)key {
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_ASSIGN);
}

- (id)sz_associatedValueForKey:(void *)key {
    return objc_getAssociatedObject(self, key);
}

@end

