//
//  UIButton+SZCountDown.m
//  SZCategories
//
//  Created by 陈圣治 on 16/7/26.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIButton+SZCountDown.h"

@interface _UIButtonSZCountDownDelegate : NSObject

@property (nonatomic, weak) UIButton *button;
@property (nonatomic) int seconds;
@property (nonatomic, strong) NSString *titleFormart;
@property (nonatomic) BOOL disableWhenProcessing;
@property (nonatomic) BOOL disableWhenFinished;

@end

@implementation _UIButtonSZCountDownDelegate

- (void)timerFiredHandler:(NSTimer *)timer {
    if (self.seconds > 0 && self.button) {
        self.button.enabled = !self.disableWhenProcessing;
        if ((self.button.state & UIControlStateDisabled) > 0) {
            NSString *title = [NSString stringWithFormat:self.titleFormart, self.seconds];
            [self.button setTitle:title forState:UIControlStateDisabled];
            self.seconds--;
        } else {
            [timer invalidate];
        }
    } else {
        [timer invalidate];

        if (self.button) {
            self.button.enabled = !self.disableWhenFinished;
        }
    }
}

@end


@implementation UIButton (SZCountDown)

- (void)sz_countdownAndDisableWhenFinishedWithSeconds:(int)seconds
                                         titleFormart:(NSString *)titleFormart {
    [self sz_countdownWithSeconds:seconds
                     titleFormart:titleFormart
            disableWhenProcessing:NO
              disableWhenFinished:YES];
}

- (void)sz_countdownAndDisableWhenProcessingWithSeconds:(int)seconds
                                           titleFormart:(NSString *)titleFormart {
    [self sz_countdownWithSeconds:seconds
                     titleFormart:titleFormart
            disableWhenProcessing:YES
              disableWhenFinished:NO];
}

- (void)sz_countdownWithSeconds:(int)seconds
                   titleFormart:(NSString *)titleFormart
          disableWhenProcessing:(BOOL)disableWhenProcessing
            disableWhenFinished:(BOOL)disableWhenFinished {
    _UIButtonSZCountDownDelegate *delegate = [[_UIButtonSZCountDownDelegate alloc] init];
    delegate.button = self;
    delegate.seconds = seconds;
    delegate.titleFormart = titleFormart;
    delegate.disableWhenProcessing = disableWhenProcessing;
    delegate.disableWhenFinished = disableWhenFinished;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:delegate
                                                    selector:@selector(timerFiredHandler:)
                                                    userInfo:nil
                                                     repeats:YES];
    [timer fire];
}

@end
