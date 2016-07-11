//
//  UIImage+Merge.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Merge)

+ (UIImage *)mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage;

@end


@interface UIImage (Resize)

- (UIImage *)imageWithSize:(CGSize)size;

@end



@interface UIImage (TintColor)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

@end
