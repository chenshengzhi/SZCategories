//
//  UIImage+SZColorCreate.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SZColorCreate)

+ (UIImage *)sz_imageWithColor:(UIColor *)color;

+ (UIImage *)sz_imageWithColor:(UIColor *)color
                          size:(CGSize)size;

+ (UIImage *)sz_imageWithColor:(UIColor *)color
                          size:(CGSize)size
                  cornerRadius:(CGFloat)cornerRadius;


+ (UIImage *)sz_imageWithColor:(UIColor *)color
                          size:(CGSize)size
                   borderColor:(UIColor *)borderColor
                   borderWidth:(CGFloat)borderWidth;

+ (UIImage *)sz_imageWithColor:(UIColor *)color
                          size:(CGSize)size
                   borderColor:(UIColor *)borderColor
                   borderWidth:(CGFloat)borderWidth
                  cornerRadius:(CGFloat)cornerRadius;


+ (UIImage *)sz_gradientImageWithBounds:(CGRect)bounds
                                 colors:(NSArray *)colors
                             startPoint:(CGPoint)startPoint
                               endPoint:(CGPoint)endPoint;

- (UIImage *)sz_croppedImageWithRect:(CGRect)rect;

@end
