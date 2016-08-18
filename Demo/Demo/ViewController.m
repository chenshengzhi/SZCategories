//
//  ViewController.m
//  Demo
//
//  Created by 陈圣治 on 16/6/21.
//  Copyright © 2016年 陈圣治. All rights reserved.
//

#import "ViewController.h"
#import "SZCategories.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.button sz_addConstraintTo:self.textField min:11 max:11];
    [self.button sz_addConstraintTo:self.textView min:6 max:20];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
