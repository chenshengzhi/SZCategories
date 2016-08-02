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

@property (nonatomic, strong) NSObject *obj;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __block UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.width = 100;
    redView.height = 100;
    redView.center = self.view.center;
    [self.view addSubview:redView];

    [redView sz_rotateByAngle:360 duration:1 autoreverse:NO repeatCount:CGFLOAT_MAX timingFunction:nil];


    _obj = [NSMutableArray array];

    [_obj sz_observeObject:redView forKeyPath:@"frame" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld usingBlock:^(NSDictionary<NSString *,id> *change) {
        NSLog(@"%@", change);
    }];
    [_obj sz_observeNotificationWithName:UIApplicationWillChangeStatusBarOrientationNotification usingBlock:^(NSNotification *note) {
        NSLog(@"%@", note);
    }];

    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        redView.frame = CGRectMake(0, 0, 100, 100);

        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            redView.frame = CGRectMake(200, 200, 100, 100);

            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                weakSelf.obj = nil;

                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    redView.frame = CGRectMake(40, 40, 100, 100);

                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        redView.frame = CGRectMake(100, 100, 100, 100);

                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            [redView removeFromSuperview];
                            redView = nil;
                        });
                    });
                });
            });
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
