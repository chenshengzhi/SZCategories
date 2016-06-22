//
//  NSNumber+Round.h
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (Round)

- (NSNumber *)doRoundWithDigit:(NSUInteger)digit;
- (NSNumber *)doCeilWithDigit:(NSUInteger)digit;
- (NSNumber *)doFloorWithDigit:(NSUInteger)digit;

@end
