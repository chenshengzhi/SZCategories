//
//  NSObject+TimeProfile.h
//  SZCategories
//
//  Created by 陈圣治 on 16/7/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (TimeProfile)

+ (void)timeProfileWithBlock:(void(^)())block;

@end
