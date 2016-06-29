//
//  UIView+Nib.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Nib)

+ (UINib *)loadNib;
+ (UINib *)loadNibNamed:(NSString *)nibName;
+ (UINib *)loadNibNamed:(NSString *)nibName bundle:(NSBundle *)bundle;
+ (instancetype)loadFromNib;
+ (instancetype)loadFromNibWithName:(NSString *)nibName;
+ (instancetype)loadFromNibWithName:(NSString *)nibName owner:(id)owner;
+ (instancetype)loadFromNibWithName:(NSString *)nibName owner:(id)owner bundle:(NSBundle *)bundle;

@end
