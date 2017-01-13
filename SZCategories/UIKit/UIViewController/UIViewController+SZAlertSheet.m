//
//  UIViewController+SZAlertSheet.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIViewController+SZAlertSheet.h"

@implementation UIViewController (SZAlertSheet)

/**
 *  确认提示, 只有一个按钮
 *
 *  @param title              标题
 *  @param message            信息
 *  @param destructiveTitle   确认按钮标题
 *  @param destructiveHandler 确认按钮点击处理
 *
 *  @return UIAlertController
 */
- (UIAlertController *)sz_alertWithTitle:(NSString *)title
                                 message:(NSString *)message
                        destructiveTitle:(NSString *)destructiveTitle
                      destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:destructiveTitle ? destructiveTitle : NSLocalizedString(@"确定", nil)
                                                   style:UIAlertActionStyleDestructive
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     dispatch_async(dispatch_get_main_queue(), ^(void){
                                                         if (destructiveHandler) {
                                                             destructiveHandler(controller);
                                                         }
                                                     });
                                                 }]];
    [self presentViewController:controller animated:YES completion:nil];
    return controller;
}

/**
 *  确认提示, 有取消按钮 和 确认按钮
 *
 *  @param title              标题
 *  @param message            信息
 *  @param destructiveTitle   确认按钮标题
 *  @param destructiveHandler 确认按钮点击处理
 *
 *  @return UIAlertController
 */
- (UIAlertController *)sz_confirmTitle:(NSString *)title
                               message:(NSString *)message
                      destructiveTitle:(NSString *)destructiveTitle
                    destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler {
    return [self sz_confirmTitle:title
                         message:message
                     cancelTitle:nil
                destructiveTitle:destructiveTitle
                   cancelHandler:nil
              destructiveHandler:destructiveHandler];
}

/**
 *  确认提示, 有取消按钮 和 确认按钮
 *
 *  @param title              标题
 *  @param message            信息
 *  @param cancelTitle        取消按钮标题
 *  @param destructiveTitle   确认按钮标题
 *  @param cancelHandler      取消按钮点击处理
 *  @param destructiveHandler 确认按钮点击处理
 *
 *  @return UIAlertController
 */
- (UIAlertController *)sz_confirmTitle:(NSString *)title
                               message:(NSString *)message
                           cancelTitle:(NSString *)cancelTitle
                      destructiveTitle:(NSString *)destructiveTitle
                         cancelHandler:(void (^)(UIAlertController * controller))cancelHandler
                    destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:cancelTitle ? cancelTitle : NSLocalizedString(@"取消", nil)
                                                   style:UIAlertActionStyleCancel
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     dispatch_async(dispatch_get_main_queue(), ^(void){
                                                         if (cancelHandler) {
                                                             cancelHandler(controller);
                                                         }
                                                     });
                                                 }]];
    [controller addAction:[UIAlertAction actionWithTitle:destructiveTitle ? destructiveTitle : NSLocalizedString(@"确定", nil)
                                                   style:UIAlertActionStyleDestructive
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     dispatch_async(dispatch_get_main_queue(), ^(void){
                                                         if (destructiveHandler) {
                                                             destructiveHandler(controller);
                                                         }
                                                     });
                                                 }]];
    [self presentViewController:controller animated:YES completion:nil];
    return controller;
}

/**
 *  带输入框的确认提示, 有取消按钮 和 确认按钮
 *
 *  @param title                  标题
 *  @param destructiveTitle       信息
 *  @param textFieldConfiguration 确认按钮标题
 *  @param destructiveHandler     确认按钮点击处理
 *
 *  @return UIAlertController
 */
- (UIAlertController *)sz_promptWithTitle:(NSString *)title
                         destructiveTitle:(NSString *)destructiveTitle
                   textFieldConfiguration:(void (^)(UITextField *textField))textFieldConfiguration
                       destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler {
    return [self sz_promptWithTitle:title
                        cancelTitle:nil
                   destructiveTitle:destructiveTitle
             textFieldConfiguration:textFieldConfiguration
                      cancelHandler:nil
                 destructiveHandler:destructiveHandler];
}

/**
 *  带输入框的确认提示, 有取消按钮 和 确认按钮
 *
 *  @param title                  标题
 *  @param cancelTitle            取消按钮标题
 *  @param destructiveTitle       确认按钮标题
 *  @param textFieldConfiguration 输入框配置
 *  @param cancelHandler          取消按钮点击处理
 *  @param destructiveHandler     确认按钮点击处理
 *
 *  @return UIAlertController
 */
- (UIAlertController *)sz_promptWithTitle:(NSString *)title
                              cancelTitle:(NSString *)cancelTitle
                         destructiveTitle:(NSString *)destructiveTitle
                   textFieldConfiguration:(void (^)(UITextField *textField))textFieldConfiguration
                            cancelHandler:(void (^)(UIAlertController * controller))cancelHandler
                       destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:nil
                                                                 preferredStyle:UIAlertControllerStyleAlert];
    [controller addAction:[UIAlertAction actionWithTitle:cancelTitle ? cancelTitle : NSLocalizedString(@"取消", nil)
                                                   style:UIAlertActionStyleCancel
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     dispatch_async(dispatch_get_main_queue(), ^(void){
                                                         if (cancelHandler) {
                                                             cancelHandler(controller);
                                                         }
                                                     });
                                                 }]];
    [controller addAction:[UIAlertAction actionWithTitle:destructiveTitle ? destructiveTitle : NSLocalizedString(@"确定", nil)
                                                   style:UIAlertActionStyleDestructive
                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                     dispatch_async(dispatch_get_main_queue(), ^(void){
                                                         if (destructiveHandler) {
                                                             destructiveHandler(controller);
                                                         }
                                                     });
                                                 }]];

    [controller addTextFieldWithConfigurationHandler:textFieldConfiguration];
    [self presentViewController:controller animated:YES completion:nil];
    return controller;
}

/**
 *  操作表
 *
 *  @param title      标题
 *  @param message    信息
 *  @param actions    按钮数组
 *  @param sourceView 弹出操作表的视图
 *
 *  @return UIAlertController
 */
- (UIAlertController *)sz_sheetWithTitle:(NSString *)title
                                 message:(NSString *)message
                                 actions:(NSArray *)actions
                              sourceView:(UIView *)sourceView {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:title
                                                                        message:message
                                                                 preferredStyle:UIAlertControllerStyleActionSheet];
    for (UIAlertAction *action in actions) {
        [controller addAction:action];
    }
    controller.popoverPresentationController.sourceView = sourceView;
    controller.popoverPresentationController.sourceRect = sourceView.bounds;
    [self presentViewController:controller animated:YES completion:nil];
    return controller;
}

@end
