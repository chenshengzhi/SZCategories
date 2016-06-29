//
//  UIViewController+Storyboard.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/29.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Storyboard)

+ (instancetype)loadFromSB;

+ (instancetype)loadFromSBWithName:(NSString *)name;

+ (instancetype)loadFromSBWithIdentifier:(NSString *)identifier;

+ (instancetype)loadFromSBWithName:(NSString *)name identifier:(NSString *)identifier;

@end
