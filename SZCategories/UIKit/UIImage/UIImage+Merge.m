//
//  UIImage+Merge.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIImage+Merge.h"

@implementation UIImage (Merge)

+ (UIImage *)mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage {
    CGImageRef firstImageRef = firstImage.CGImage;
    CGFloat firstWidth = CGImageGetWidth(firstImageRef);
    CGFloat firstHeight = CGImageGetHeight(firstImageRef);
    CGImageRef secondImageRef = secondImage.CGImage;
    CGFloat secondWidth = CGImageGetWidth(secondImageRef);
    CGFloat secondHeight = CGImageGetHeight(secondImageRef);
    CGSize mergedSize = CGSizeMake(MAX(firstWidth, secondWidth), MAX(firstHeight, secondHeight));
    UIGraphicsBeginImageContext(mergedSize);
    [firstImage drawInRect:CGRectMake(0, 0, firstWidth, firstHeight)];
    [secondImage drawInRect:CGRectMake(0, 0, secondWidth, secondHeight)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end


@implementation UIImage (Resize)

- (UIImage *)imageWithSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end



@implementation UIImage (TintColor)

- (UIImage *)imageWithTintColor:(UIColor *)tintColor {
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    [self drawInRect:rect];
    [tintColor set];
    UIRectFillUsingBlendMode(rect, kCGBlendModeColor);
    [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1];
    UIImage *tintImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintImage;
}

@end
