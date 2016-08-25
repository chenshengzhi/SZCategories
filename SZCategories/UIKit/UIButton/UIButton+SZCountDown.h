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
                                         titleFormart:(NSString *)titleFormart;

- (void)sz_countdownAndDisableWhenProcessingWithSeconds:(int)seconds
                                           titleFormart:(NSString *)titleFormart;

- (void)sz_countdownWithSeconds:(int)seconds
                   titleFormart:(NSString *)titleFormart
          disableWhenProcessing:(BOOL)disableWhenProcessing
            disableWhenFinished:(BOOL)disableWhenFinished;

@end
