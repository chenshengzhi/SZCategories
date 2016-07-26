//
//  NSNumber+SZRound.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (SZRound)

- (NSNumber *)sz_doRoundWithDigit:(NSUInteger)digit;
- (NSNumber *)sz_doCeilWithDigit:(NSUInteger)digit;
- (NSNumber *)sz_doFloorWithDigit:(NSUInteger)digit;

@end
