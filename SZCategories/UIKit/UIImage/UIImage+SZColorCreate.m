//
//  UIImage+SZColorCreate.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIImage+SZColorCreate.h"

@implementation UIImage (SZColorCreate)

+ (UIImage *)sz_imageWithColor:(UIColor *)color {
    return [UIImage sz_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)sz_imageWithColor:(UIColor *)color size:(CGSize)size {
    return [UIImage sz_imageWithColor:color size:size cornerRadius:0];
}

+ (UIImage *)sz_imageWithColor:(UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:cornerRadius];
    CGContextAddPath(context, path.CGPath);
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillPath(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (UIImage *)sz_gradientImageWithBounds:(CGRect)bounds colors:(NSArray *)colors startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint {
    UIGraphicsBeginImageContextWithOptions(bounds.size, NO, [UIScreen mainScreen].scale);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    NSMutableArray *cgColorArray = [NSMutableArray array];
    for(UIColor *c in colors) [cgColorArray addObject:(id)c.CGColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)cgColorArray, NULL);
    
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)sz_croppedImageWithRect:(CGRect)rect {
    CGRect scaleRect = CGRectMake(self.scale*rect.origin.x, self.scale*rect.origin.y, self.scale*rect.size.width, self.scale*rect.size.height);
    CGImageRef croppedImageRef = CGImageCreateWithImageInRect(self.CGImage, scaleRect);
    UIImage *croppedImage = [[UIImage alloc] initWithCGImage:croppedImageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(croppedImageRef);
    return croppedImage;
}

@end
