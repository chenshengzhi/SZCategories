//
//  NSObject+SZAssociatedObject.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SZAssociatedObject)

- (void)sz_associateValue:(id)value withKey:(void *)key;
- (void)sz_weaklyAssociateValue:(id)value withKey:(void *)key;
- (id)sz_associatedValueForKey:(void *)key;

@end
