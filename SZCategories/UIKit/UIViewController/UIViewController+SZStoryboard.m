//
//  UIViewController+SZStoryboard.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/29.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIViewController+SZStoryboard.h"

@implementation UIViewController (SZStoryboard)

+ (instancetype)sz_loadFromSB {
    return [self sz_loadFromSBWithName:NSStringFromClass(self.class)];
}

+ (instancetype)sz_loadFromSBWithName:(NSString *)name {
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateInitialViewController];
}

+ (instancetype)sz_loadFromSBWithIdentifier:(NSString *)identifier {
    return [self sz_loadFromSBWithName:NSStringFromClass(self.class) identifier:identifier];
}

+ (instancetype)sz_loadFromSBWithName:(NSString *)name identifier:(NSString *)identifier {
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:identifier];
}

@end
