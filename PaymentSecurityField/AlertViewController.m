//
//  AlertViewController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "AlertViewController.h"
#import "LYPaymentController.h"
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
    LYPaymentController *vc = [[LYPaymentController alloc] init];
    vc.lineColor = [UIColor colorWithRed:0.50 green:0.80 blue:0.51 alpha:1.00];
    vc.titleOfPayment = @"密码输入";
    vc.numberOfCharacters = 6;
    vc.amount = @"15";
    vc.detailTitle = @"微信支付";
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:nav animated:NO completion:nil];
}


@end
