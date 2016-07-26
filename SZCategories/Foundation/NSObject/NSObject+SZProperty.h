//
//  NSObject+SZProperty.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SZProperty)

- (NSDictionary *)sz_propertyDictionary;

+ (NSArray *)sz_classPropertyList;

@end
