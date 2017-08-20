//
//  LYPaymentAlertController.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYBaseViewController.h"
#import "LYSecurityField.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYPaymentAlertView : UIView
@property (strong, nonatomic) LYSecurityField *paymentField;
@end

@interface LYPaymentAlertController : LYBaseViewController

@property (strong, nonatomic) LYPaymentAlertView *alertView;

@property (copy, nonatomic) NSString *titleOfPayment;
@property (copy, nonatomic) NSString *detailTitle;
@property (copy, nonatomic) NSString *amount;
@property (assign, nonatomic) NSInteger numberOfCharacters;
@property (strong, nonatomic) UIColor *lineColor;
@property (assign, nonatomic) CGSize sizeOfPayment;

@end

NS_ASSUME_NONNULL_END
