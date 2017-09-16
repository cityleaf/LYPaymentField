//
//  AlertViewController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "AlertViewController.h"
#import "ViewFrame.h"

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = UIColor.whiteColor;
    self.view = view;
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = UIColor.grayColor;
    [button setTitle:@"开始支付" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    
    // layout
    button.width = 200;
    button.height = 50;
    button.center = self.view.middle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Target Actions

- (void)buttonClicked:(UIButton *)button
{
    // TODO:弹窗正在写
}


@end
