//
//  LYPaymentAlertController.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/24.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentBaseViewController.h"
#import "LYPaymentSecurityField.h"
#import "LYPaymentAlertTheme.h"
#import "LYPaymentAlertTransitioning.h"

NS_ASSUME_NONNULL_BEGIN

@class LYPaymentAlertController;

@protocol LYPaymentAlertControllerDelegate <NSObject>

@required

/**
 支付密码输入完成

 @param paymentController 弹窗
 @param securityText 输入完成时的输入内容
 */
- (void)lYPaymentController:(LYPaymentAlertController *)paymentController securityTextOfCompeletion:(NSString *)securityText;

@optional

/**
 正在输入密码

 @param paymentController 支付弹框
 @param securityText 输入的密码
 */
- (void)lYPaymentController:(LYPaymentAlertController *)paymentController didEditingSecurityText:(NSString *)securityText;

/**
 清除完成

 @param paymentController 支付弹框
 */
- (void)lYPaymentControllerDidClear:(LYPaymentAlertController *)paymentController;

@end

@interface LYPaymentAlertController : LYPaymentBaseViewController

@property (assign, nonatomic) id<LYPaymentAlertControllerDelegate> delegate;

/**
 rightButtonItem默认为nil，需要时自定义
 */
@property (strong, nonatomic) UIButton *rightButtonItem;
@property (readonly, nonatomic, nullable) UIButton *leftButtonItem;
@property (readonly, nonatomic, nullable) LYSecurityField *paymentField;

/**
 以支付框为界，支付框与标题之间为headerView，支付框与底部之间为footerView
 */
@property (strong, nonatomic) UIView *headerView;
@property (strong, nonatomic) UIView *footerView;

@property (assign, nonatomic) AlertPresentStyle presentingStyle;
@property (assign, nonatomic) AlertPresentStyle dismissStyle;
@property (assign, nonatomic) CGSize contentOffset;

@property (strong, nonatomic) LYPaymentAlertTheme *theme;

/**
 实例化方法

 @param title 标题
 @param numberOfCharacters 输入框位数
 @param amount 金额
 @return 实例对象
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title
                      numberOfCharacters:(NSInteger)numberOfCharacters
                                  amount:(nullable NSString *)amount
                                 remarks:(nullable NSString *)remarks;

/**
 实例化方法

 @param title 标题
 @param numberOfCharacters 输入框位数
 @return 实例对象
 */
+ (instancetype)alertControllerWithTitle:(NSString *)title
                      numberOfCharacters:(NSInteger)numberOfCharacters;

/**
 全局设置默认样式
 */
+ (void)registerDefaultTheme:(LYPaymentAlertTheme *)theme;


@end

NS_ASSUME_NONNULL_END
