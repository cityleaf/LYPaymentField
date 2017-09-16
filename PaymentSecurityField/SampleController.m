//
//  SampleController.m
//  PaymentSecurityField
//
//  Created by liuyu on 2017/8/8.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "SampleController.h"

@interface SampleController ()<LYPaymentFieldDelegate>

@end

@implementation SampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LRWeakSelf(self)
    
    /**
     * 默认dot直径15px
     * 默认dot黑色
     */
    
    // 带圆角
    self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeHaveRoundedCorner];
    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
    self.securityField.delegate = self;
    self.securityField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
        // 输入满格时被触发
        NSString *string = [NSString stringWithFormat:@"当前输入为：%@\n第  %ld  次校验",text,field.countOfVerification];
        weakself.infoLabel.text = string;
        NSLog(@"当前输入为：%@",text);
        NSLog(@"第  %ld  次校验",field.countOfVerification);
    };
    [self.view addSubview:self.securityField];
    
    // 不带圆角
//    self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeNoRoundedCorner];
//    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
//    [self.view addSubview:self.securityField];
    
    // 不带边框
//    self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeNoBorder];
//    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
//    self.securityField.backgroundColor = UIColor.lightGrayColor;
//    self.securityField.diameterOfDot = 30;//设置dot点直径
//    [self.view addSubview:self.securityField];
    
}

#pragma mark - LYPaymentFieldDelegate

- (void)lYPaymentFieldDidBeginEditing:(LYSecurityField *)paymentField
{
    NSLog(@"正在输入 text = %@",paymentField.text);
}

- (void)lYPaymentFieldDidFinishedEditing:(LYSecurityField *)paymentField
{
    NSLog(@"输入完成 = %@",paymentField.text);
}

- (void)lYPaymentFieldDidDelete:(LYSecurityField *)paymentField
{
    NSLog(@"已经删除一个字符");
}

- (void)lYPaymentFieldDidClear:(LYSecurityField *)paymentField
{
    NSLog(@"清除完毕");
}

@end
