//
//  UIButton+SZCountDown.h
//  SZCategories
//
//  Created by 陈圣治 on 16/7/26.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SZCountDown)

- (void)sz_countDownSeconds:(int)seconds disabledTitleFormart:(NSString *)disabledTitleFormart;

@end
