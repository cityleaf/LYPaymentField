//
//  LYBaseViewController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYBaseViewController.h"

@interface LYBaseViewController ()

@end

@implementation LYBaseViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setHidden:YES];
}

#pragma mark - public

- (void)dismissPaymentAlert
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
