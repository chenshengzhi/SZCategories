//
//  UIViewController+SZAlertSheet.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (SZAlertSheet)

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
                      destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler;

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
                    destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler;

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
                       destructiveHandler:(void (^)(UIAlertController * controller))destructiveHandler;

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
                              sourceView:(UIView *)sourceView;

@end
