//
//  NSObject+SZNotification.h
//  SZCategories
//
//  Created by 陈圣治 on 16/8/2.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SZNotification)

- (void)sz_observeNotificationWithName:(NSString *)name
                            usingBlock:(void (^)(NSNotification *note))block;

- (void)sz_observeNotificationWithName:(NSString *)name
                                object:(id)obj
                                 queue:(NSOperationQueue *)queue
                            usingBlock:(void (^)(NSNotification *note))block;

- (void)sz_cancelObserveNotificationName:(NSString *)name;

- (void)sz_cancelObserveAllNotification;

@end
