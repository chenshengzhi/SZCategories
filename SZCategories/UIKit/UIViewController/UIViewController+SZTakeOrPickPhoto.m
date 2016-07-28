//
//  UIViewController+SZTakeOrPickPhoto.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIViewController+SZTakeOrPickPhoto.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <objc/runtime.h>

#pragma mark - PAImagePickerDelegate -
@interface PAImagePickerDelegate : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic) BOOL allowsEditing;

@property (nonatomic, copy) PAImagePickerSuccessBlock successBlock;

@end

@implementation PAImagePickerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];

    if (_successBlock) {
        _successBlock(nil, nil);
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];

    UIImage *image = nil;
    if (_allowsEditing) {
        image = info[UIImagePickerControllerEditedImage];
    } else {
        image = info[UIImagePickerControllerOriginalImage];
    }
    if (_successBlock) {
        _successBlock(info, image);
    }
}

@end


@implementation UIViewController (SZTakeOrPickPhoto)

static char PAImagePickerDelegateKey;

/**
 *  相册选取照片
 *
 *  @param allowsEditing 是否可以编辑
 *  @param sourceView    弹出的视图
 *  @param successBlock  回调
 */
- (void)sz_pickAnPhotoWithAllowEditing:(BOOL)allowsEditing
                            sourceView:(UIView *)sourceView
                               success:(PAImagePickerSuccessBlock)successBlock {
    PAImagePickerDelegate *delegate = [[PAImagePickerDelegate alloc] init];
    delegate.allowsEditing = allowsEditing;
    delegate.successBlock = successBlock;

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    objc_setAssociatedObject(picker, &PAImagePickerDelegateKey, delegate, OBJC_ASSOCIATION_RETAIN);
    picker.delegate = delegate;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.mediaTypes = @[(id)kUTTypeImage];
    picker.allowsEditing = allowsEditing;
    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:picker animated:YES completion:nil];
}

/**
 *  拍照
 *
 *  @param allowsEditing 是否可以编辑
 *  @param sourceView    弹出的视图
 *  @param successBlock  回调
 */
- (void)sz_takeAnPhotoWithAllowEditing:(BOOL)allowsEditing
                            sourceView:(UIView *)sourceView
                               success:(PAImagePickerSuccessBlock)successBlock {
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (authStatus == AVAuthorizationStatusDenied || authStatus == AVAuthorizationStatusRestricted) {
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"无法使用相机", nil)
                                                                            message:NSLocalizedString(@"请在\"设置-隐私-相机\"中允许访问相机。", nil)
                                                                     preferredStyle:UIAlertControllerStyleAlert];
        [controller addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"确定", nil) style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:controller animated:YES completion:nil];
        return;
    }

    PAImagePickerDelegate *delegate = [[PAImagePickerDelegate alloc] init];
    delegate.allowsEditing = allowsEditing;
    delegate.successBlock = successBlock;

    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    objc_setAssociatedObject(picker, &PAImagePickerDelegateKey, delegate, OBJC_ASSOCIATION_RETAIN);
    picker.delegate = delegate;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    picker.mediaTypes = @[(id)kUTTypeImage];
    picker.allowsEditing = allowsEditing;
    if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
        picker.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else {
        picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    picker.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:picker animated:YES completion:nil];
}

@end
