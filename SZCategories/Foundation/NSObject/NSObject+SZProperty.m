//
//  NSObject+SZProperty.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSObject+SZProperty.h"
#import <objc/runtime.h>

@implementation NSObject (SZProperty)

- (NSDictionary *)sz_propertyDictionary {
    //创建可变字典
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *props = class_copyPropertyList([self class], &outCount);
    for (int i=0;i<outCount;i++) {
        objc_property_t prop = props[i];
        NSString *propName = [[NSString alloc]initWithCString:property_getName(prop) encoding:NSUTF8StringEncoding];
        id propValue = [self valueForKey:propName];
        if(propValue) {
            [dict setObject:propValue forKey:propName];
        }
    }
    free(props);
    return dict;
}

+ (NSArray *)sz_classPropertyList {
    NSMutableArray *allProperties = [[NSMutableArray alloc] init];
    
    unsigned int outCount;
    objc_property_t *props = class_copyPropertyList(self, &outCount);
    for (int i = 0; i < outCount; i++) {
        objc_property_t prop = props[i];
        
        NSString *propName = [[NSString alloc]initWithCString:property_getName(prop) encoding:NSUTF8StringEncoding];

        if (propName) {
            [allProperties addObject:propName];
        }
    }
    free(props);
    return [NSArray arrayWithArray:allProperties];
}

@end
