//
//  NSNumber+SZRound.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "NSNumber+SZRound.h"

@implementation NSNumber (SZRound)

- (NSNumber *)sz_doRoundWithDigit:(NSUInteger)digit {
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber *)sz_doCeilWithDigit:(NSUInteger)digit {
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber *)sz_doFloorWithDigit:(NSUInteger)digit {
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundFloor];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

@end
