//
//  UIViewController+Storyboard.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/29.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIViewController+Storyboard.h"

@implementation UIViewController (Storyboard)

+ (instancetype)loadFromSB {
    return [self loadFromSBWithName:NSStringFromClass(self.class)];
}

+ (instancetype)loadFromSBWithName:(NSString *)name {
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController];
}

+ (instancetype)loadFromSBWithIdentifier:(NSString *)identifier {
    return [self loadFromSBWithName:NSStringFromClass(self.class) identifier:identifier];
}

+ (instancetype)loadFromSBWithName:(NSString *)name identifier:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

@end
