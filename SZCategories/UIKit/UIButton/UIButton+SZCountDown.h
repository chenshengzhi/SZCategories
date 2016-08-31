//
//  UIButton+SZCountDown.h
//  SZCategories
//
//  Created by 陈圣治 on 16/7/26.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SZCountDown)

- (void)sz_countdownAndDisableWhenFinishedWithSeconds:(int)seconds
                                    titleFormartBlock:(NSString *(^)(int seconds))titleFormartBlock;

- (void)sz_countdownAndDisableWhenProcessingWithSeconds:(int)seconds
                                      titleFormartBlock:(NSString *(^)(int seconds))titleFormartBlock;

- (void)sz_countdownWithSeconds:(int)seconds
              titleFormartBlock:(NSString *(^)(int seconds))titleFormartBlock
          disableWhenProcessing:(BOOL)disableWhenProcessing
            disableWhenFinished:(BOOL)disableWhenFinished;

- (void)sz_cancelCountdown;

@end
