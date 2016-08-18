//
//  UIControl+SZConstraintByTextInput.m
//  SZCategories
//
//  Created by 陈圣治 on 16/8/18.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIControl+SZConstraintByTextInput.h"
#import <objc/runtime.h>

static char SZEnableConstraintKey;


@interface _SZEnableConstraintItem : NSObject

@property (nonatomic, strong) id<UITextInput>inputView;
@property (nonatomic) NSInteger min;
@property (nonatomic) NSInteger max;

- (BOOL)isSatisfied;

@end

@implementation _SZEnableConstraintItem

- (BOOL)isSatisfied {
    NSString *text = nil;
    if ([self.inputView isKindOfClass:[UITextField class]]) {
        text = [(UITextField *)self.inputView text];
    } else if ([self.inputView isKindOfClass:[UITextView class]]) {
        text = [(UITextView *)self.inputView text];
    }
    return text.length >= self.min && text.length <= self.max;
}

@end


@interface _SZEnableConstraintDelegete : NSObject

@property (nonatomic, weak) UIControl *control;
@property (nonatomic, strong) NSMutableArray<_SZEnableConstraintItem *> *items;

- (instancetype)initWithControl:(UIControl *)control;

- (void)addItemWithInputView:(id<UITextInput>)view min:(NSInteger)min max:(NSInteger)max;

@end

@implementation _SZEnableConstraintDelegete

- (instancetype)initWithControl:(UIControl *)control {
    self = [super init];
    if (self) {
        self.control = control;
        self.items = [NSMutableArray array];
    }
    return self;
}

- (void)addItemWithInputView:(id<UITextInput>)inputView min:(NSInteger)min max:(NSInteger)max {
    _SZEnableConstraintItem *item = [[_SZEnableConstraintItem alloc] init];
    item.inputView = inputView;
    item.min = min;
    item.max = max;
    [self.items addObject:item];

    if ([inputView isKindOfClass:[UITextField class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textDidChangeHandler:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:nil];
    } else if ([inputView isKindOfClass:[UITextView class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textDidChangeHandler:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:nil];
    }

    [self textDidChangeHandler:nil];
}

- (void)textDidChangeHandler:(NSNotification *)note {
    BOOL allSatified = YES;
    for (_SZEnableConstraintItem *item in self.items) {
        if (![item isSatisfied]) {
            allSatified = NO;
            break;
        }
    }

    if (allSatified) {
        self.control.enabled = YES;
    } else {
        self.control.enabled = NO;
    }
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end


@implementation UIControl (SZConstraintByTextInput)

- (void)sz_addConstraintTo:(id<UITextInput>)inputeView min:(NSInteger)min max:(NSInteger)max {
    _SZEnableConstraintDelegete *delegate = objc_getAssociatedObject(self, &SZEnableConstraintKey);
    if (!delegate) {
        delegate = [[_SZEnableConstraintDelegete alloc] initWithControl:self];
        objc_setAssociatedObject(self, &SZEnableConstraintKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    [delegate addItemWithInputView:inputeView min:min max:max];
}

@end
