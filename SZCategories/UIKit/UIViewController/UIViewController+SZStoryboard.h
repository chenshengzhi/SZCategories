//
//  UIViewController+SZStoryboard.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/29.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SZStoryboard)

+ (instancetype)sz_loadFromSB;

+ (instancetype)sz_loadFromSBWithName:(NSString *)name;

+ (instancetype)sz_loadFromSBWithIdentifier:(NSString *)identifier;

+ (instancetype)sz_loadFromSBWithName:(NSString *)name identifier:(NSString *)identifier;

@end
