//
//  UIImage+SZMerge.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SZMerge)

+ (UIImage *)sz_mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage;

@end


@interface UIImage (Resize)

- (UIImage *)sz_imageWithSize:(CGSize)size;

@end



@interface UIImage (TintColor)

- (UIImage *)sz_imageWithTintColor:(UIColor *)tintColor;

@end
