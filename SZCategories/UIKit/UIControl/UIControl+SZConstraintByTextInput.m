//
//  UIControl+SZConstraintByTextInput.m
//  SZCategories
//
//  Created by 陈圣治 on 16/8/18.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "UIControl+SZConstraintByTextInput.h"
#import <objc/runtime.h>

static char SZConstraintByTextInputKey;


@interface _SZConstraintByTextInputItem : NSObject

@property (nonatomic, strong) id<UITextInput>textInput;
@property (nonatomic, readonly, strong) NSString *text;

@property (nonatomic) NSInteger min;
@property (nonatomic) NSInteger max;

@property (nonatomic, strong) NSString *regex;


+ (instancetype)itemWithTextInput:(id<UITextInput>)textInput regex:(NSString *)regex;

+ (instancetype)itemWithTextInput:(id<UITextInput>)textInput min:(NSInteger)min max:(NSInteger)max;

- (BOOL)isSatisfied;

@end

@interface _SZConstraintByTextInputNormalItem : _SZConstraintByTextInputItem

@end

@interface _SZConstraintByTextInputRegexItem : _SZConstraintByTextInputItem

@end


@implementation _SZConstraintByTextInputItem

+ (instancetype)itemWithTextInput:(id<UITextInput>)textInput min:(NSInteger)min max:(NSInteger)max {
    _SZConstraintByTextInputNormalItem *item = [[_SZConstraintByTextInputNormalItem alloc] init];
    item.textInput = textInput;
    item.min = min;
    item.max = max;
    return item;
}

+ (instancetype)itemWithTextInput:(id<UITextInput>)textInput regex:(NSString *)regex {
    _SZConstraintByTextInputRegexItem *item = [[_SZConstraintByTextInputRegexItem alloc] init];
    item.textInput = textInput;
    item.regex = regex;
    return item;
}

- (NSString *)text {
    NSString *text = nil;
    if ([self.textInput isKindOfClass:[UITextField class]]) {
        text = [(UITextField *)self.textInput text];
    } else if ([self.textInput isKindOfClass:[UITextView class]]) {
        text = [(UITextView *)self.textInput text];
    }
    return text;
}

- (BOOL)isSatisfied {
    return NO;
}

@end

@implementation _SZConstraintByTextInputNormalItem

- (BOOL)isSatisfied {
    NSString *text = [self text];
    return text.length >= self.min && text.length <= self.max;
}

@end

@implementation _SZConstraintByTextInputRegexItem

- (BOOL)isSatisfied {
    NSString *text = [self text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", self.regex];
    return [predicate evaluateWithObject:text];
}

@end


@interface _SZConstraintByTextInputDelegete : NSObject

@property (nonatomic, weak) UIControl *control;
@property (nonatomic, strong) NSMutableArray<_SZConstraintByTextInputItem *> *items;

- (instancetype)initWithControl:(UIControl *)control;

- (void)addConstraintItem:(_SZConstraintByTextInputItem *)item;

@end

@implementation _SZConstraintByTextInputDelegete

- (instancetype)initWithControl:(UIControl *)control {
    self = [super init];
    if (self) {
        self.control = control;
        self.items = [NSMutableArray array];
    }
    return self;
}

- (void)addConstraintItem:(_SZConstraintByTextInputItem *)item {
    [self.items addObject:item];

    if ([item.textInput isKindOfClass:[UITextField class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textDidChangeHandler:)
                                                     name:UITextFieldTextDidChangeNotification
                                                   object:nil];
    } else if ([item.textInput isKindOfClass:[UITextView class]]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(textDidChangeHandler:)
                                                     name:UITextViewTextDidChangeNotification
                                                   object:nil];
    }

    [self textDidChangeHandler:nil];
}


- (void)textDidChangeHandler:(NSNotification *)note {
    BOOL containSender = NO;
    for (_SZConstraintByTextInputItem *item in self.items) {
        if (item.textInput == note.object) {
            containSender = YES;
            break;
        }
    }
    if (!containSender) {
        return;
    }

    BOOL allSatified = YES;
    for (_SZConstraintByTextInputItem *item in self.items) {
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

- (_SZConstraintByTextInputDelegete *)sz_constraintDelegate {
    _SZConstraintByTextInputDelegete *delegate = objc_getAssociatedObject(self, &SZConstraintByTextInputKey);
    if (!delegate) {
        delegate = [[_SZConstraintByTextInputDelegete alloc] initWithControl:self];
        objc_setAssociatedObject(self, &SZConstraintByTextInputKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return delegate;
}

- (void)sz_addConstraintWithTextInput:(id<UITextInput>)textInput min:(NSInteger)min max:(NSInteger)max {
    _SZConstraintByTextInputItem *item = [_SZConstraintByTextInputItem itemWithTextInput:textInput min:min max:max];
    [[self sz_constraintDelegate] addConstraintItem:item];
}

- (void)sz_addConstraintWithTextInput:(id<UITextInput>)textInput length:(NSInteger)length {
    [self sz_addConstraintWithTextInput:textInput min:length max:length];
}

- (void)sz_addConstraintWithTextInput:(id<UITextInput>)textInput regex:(NSString *)regex {
    _SZConstraintByTextInputItem *item = [_SZConstraintByTextInputItem itemWithTextInput:textInput regex:regex];
    [[self sz_constraintDelegate] addConstraintItem:item];
}

@end
