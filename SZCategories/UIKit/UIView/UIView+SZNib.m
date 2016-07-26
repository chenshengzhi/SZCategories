//
//  UIView+SZNib.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIView+SZNib.h"

@implementation UIView (SZNib)

+ (UINib *)sz_loadNib {
    return [self sz_loadNibNamed:NSStringFromClass([self class])];
}

+ (UINib *)sz_loadNibNamed:(NSString *)nibName {
    return [self sz_loadNibNamed:nibName bundle:[NSBundle mainBundle]];
}

+ (UINib *)sz_loadNibNamed:(NSString *)nibName bundle:(NSBundle *)bundle {
    return [UINib nibWithNibName:nibName bundle:bundle];
}

+ (instancetype)sz_loadFromNib {
    return [self sz_loadFromNibWithName:NSStringFromClass([self class])];
}

+ (instancetype)sz_loadFromNibWithName:(NSString *)nibName {
    return [self sz_loadFromNibWithName:nibName owner:nil];
}

+ (instancetype)sz_loadFromNibWithName:(NSString *)nibName owner:(id)owner {
    return [self sz_loadFromNibWithName:nibName owner:owner bundle:[NSBundle mainBundle]];
}

+ (instancetype)sz_loadFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle {
    UIView *result = nil;
    NSArray* elements = [bundle loadNibNamed:nibName owner:owner options:nil];
    for (id object in elements) {
        if ([object isKindOfClass:[self class]]) {
            result = object;
            break;
        }
    }
    return result;
}

@end
