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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.width = 100;
    redView.height = 100;
    redView.center = self.view.center;
    [self.view addSubview:redView];

    [redView sz_rotateByAngle:360 duration:1 autoreverse:NO repeatCount:CGFLOAT_MAX timingFunction:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
