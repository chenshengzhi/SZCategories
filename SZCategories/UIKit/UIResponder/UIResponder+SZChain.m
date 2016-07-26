//
//  UIResponder+SZChain.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIResponder+SZChain.h"

@implementation UIResponder (SZChain)

- (NSString *)sz_responderChainDescription {
    NSMutableArray *responderChainStrings = [NSMutableArray array];
    [responderChainStrings addObject:[self class]];
    UIResponder *nextResponder = self;
    while ((nextResponder = [nextResponder nextResponder])) {
        [responderChainStrings addObject:[nextResponder class]];
    }
    __block NSString *returnString = @"Responder Chain:\n";
    __block int tabCount = 0;
    [responderChainStrings enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (tabCount) {
            returnString = [returnString stringByAppendingString:@"|"];
            for (int i = 0; i < tabCount; i++) {
                returnString = [returnString stringByAppendingString:@"----"];
            }
            returnString = [returnString stringByAppendingString:@" "];
        } else {
            returnString = [returnString stringByAppendingString:@"| "];
        }
        returnString = [returnString stringByAppendingFormat:@"%@ (%@)\n", obj, @(idx)];
        tabCount++;
    }];
    return returnString;
}

@end
