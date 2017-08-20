//
//  LYPaymentController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentController.h"
#import "LYPaymentAlertController.h"

@interface LYPaymentController ()
- (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer;
@end

@implementation LYPaymentController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.8];
    self.view = view;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureRecognizer:)];
    [self.view addGestureRecognizer:tapGesture];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.style == LYPaymentAlertStyleAlert) {
        LYPaymentAlertController *alertController = [[LYPaymentAlertController alloc] init];
        alertController.lineColor = self.lineColor;
        alertController.titleOfPayment = self.titleOfPayment;
        alertController.numberOfCharacters = self.numberOfCharacters;
        alertController.detailTitle = self.detailTitle;
        alertController.amount = self.amount;      
        [self.navigationController pushViewController:alertController animated:NO];
    } else {
        
    }

}

#pragma mark - Target Actions

- (void)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
