//
//  UIView+SZRecursiveDescription.m
//  SZCategories
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIView+SZRecursiveDescription.h"

@implementation UIView (SZRecursiveDescription)

#ifdef DEBUG
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
- (NSString *)sz_recursiveView {
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                          __PRETTY_FUNCTION__, __LINE__,
                          [self performSelector:@selector(recursiveDescription)]];
    return description;
}
- (NSString *)sz_constraintsDescription {
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@ \r\r",
                             __PRETTY_FUNCTION__, __LINE__,
                             [[self constraints] description]];
    return description;
}
- (NSString *)sz_autolayoutTraceDescription {
    NSString *description = [NSString stringWithFormat:@"%s [Line %d] \r\r %@",
                             __PRETTY_FUNCTION__, __LINE__,
                             [self performSelector:@selector(_autolayoutTrace)]];
    return description;
}
#pragma clang diagnostic pop
#endif

@end
