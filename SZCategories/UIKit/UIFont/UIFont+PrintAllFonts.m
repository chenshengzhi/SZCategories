//
//  UIFont+PrintAllFonts.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/23.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIFont+PrintAllFonts.h"

@implementation UIFont (PrintAllFonts)

+ (void)printAllFonts {
    NSArray *familyNames = [UIFont familyNames];
    for (NSString *family in familyNames) {
        NSArray *fontNames = [UIFont fontNamesForFamilyName:family];
        NSLog(@"%@ ===> %@", family, fontNames);
    }
}

@end
