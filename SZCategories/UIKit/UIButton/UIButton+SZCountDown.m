//
//  UIButton+SZCountDown.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/26.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIButton+SZCountDown.h"

@interface UIButtonSZCountDownDelegate : NSObject

@property (nonatomic, weak) UIButton *button;
@property (nonatomic) int seconds;
@property (nonatomic, strong) NSString *disabledTitleFormart;

@end

@implementation UIButtonSZCountDownDelegate

- (void)timerFiredHandler:(NSTimer *)timer {
    if (_seconds > 0 && _button) {
        NSString *title = [NSString stringWithFormat:_disabledTitleFormart, _seconds];
        [_button setTitle:title forState:UIControlStateDisabled];
        _seconds--;
    } else {
        [timer invalidate];

        if (_button) {
            _button.enabled = YES;
        }
    }
}

@end


@implementation UIButton (SZCountDown)

- (void)sz_countDownSeconds:(int)seconds disabledTitleFormart:(NSString *)disabledTitleFormart {
    self.enabled = NO;

    UIButtonSZCountDownDelegate *delegate = [[UIButtonSZCountDownDelegate alloc] init];
    delegate.button = self;
    delegate.seconds = seconds;
    delegate.disabledTitleFormart = disabledTitleFormart;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:delegate selector:@selector(timerFiredHandler:) userInfo:nil repeats:YES];
    [timer fire];
}

@end
