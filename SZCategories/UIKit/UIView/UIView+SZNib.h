//
//  UIView+SZNib.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (SZNib)

+ (UINib *)sz_loadNib;
+ (UINib *)sz_loadNibNamed:(NSString *)nibName;
+ (UINib *)sz_loadNibNamed:(NSString *)nibName bundle:(NSBundle *)bundle;
+ (instancetype)sz_loadFromNib;
+ (instancetype)sz_loadFromNibWithName:(NSString *)nibName;
+ (instancetype)sz_loadFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)sz_loadFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
