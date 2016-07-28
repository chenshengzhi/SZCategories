//
//  UIViewController+SZTakeOrPickPhoto.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PAImagePickerSuccessBlock)(NSDictionary *info, UIImage *image);

@interface UIViewController (SZTakeOrPickPhoto)

/**
 *  相册选取照片
 *
 *  @param allowsEditing 是否可以编辑
 *  @param sourceView    弹出的视图
 *  @param successBlock  回调
 */
- (void)sz_pickAnPhotoWithAllowEditing:(BOOL)allowsEditing
                            sourceView:(UIView *)sourceView
                               success:(PAImagePickerSuccessBlock)successBlock;

/**
 *  拍照
 *
 *  @param allowsEditing 是否可以编辑
 *  @param sourceView    弹出的视图
 *  @param successBlock  回调
 */
- (void)sz_takeAnPhotoWithAllowEditing:(BOOL)allowsEditing
                            sourceView:(UIView *)sourceView
                               success:(PAImagePickerSuccessBlock)successBlock;

@end
