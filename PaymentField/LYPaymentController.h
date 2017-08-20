//
//  LYPaymentController.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYSecurityField.h"
#import "LYBaseViewController.h"

typedef NS_ENUM(NSUInteger, LYPaymentAlertStyle) {
    LYPaymentAlertStyleAlert = 0,
    LYPaymentAlertStyleActionSheet = 1,
};

typedef NS_ENUM(NSUInteger, ActionSheetAppearanceStyle) {
    ActionSheetAppearanceStyleHaveOrder = 0,
    ActionSheetAppearanceStyleNoOrder = 1,
};

NS_ASSUME_NONNULL_BEGIN

@protocol LYPaymentDelegate <NSObject>

@required

- (void)lYPayment:(UIViewController *)payment didEndEditing:(NSString *)text;

@optional

- (void)lYPaymentShouldAppearence:(UIViewController *)payment;
- (void)lYPayment:(UIViewController *)payment shouldAppearencePaymentField:(LYSecurityField *)paymentField;
- (void)lYPaymentDidDismissAlert:(UIViewController *)payment;

@end

@protocol LYPaymentDataSource <NSObject>

@optional

- (nullable NSString *)lYPayment:(UIViewController *)payment titleForLYPaymentField:(LYSecurityField *)paymentField;
- (nullable NSString *)lYpayment:(UIViewController *)payment titleOfOrderForLYPaymentField:(LYSecurityField *)paymentField;
- (nullable UIView *)lYPayment:(UIViewController *)payment contentViewForLYPaymentField:(LYSecurityField *)paymentField;
- (CGFloat)lYPayment:(UIViewController *)payment heightOfContentViewForLYPaymentField:(LYSecurityField *)paymentField;
- (ActionSheetAppearanceStyle)appearanceStyleOfActionSheet;
- (UIColor *)lineColorOfTitleBottom;

@end

@interface LYPaymentController : LYBaseViewController

@property (assign, nonatomic) id <LYPaymentDelegate>paymentDelegate;
@property (assign, nonatomic) id <LYPaymentDataSource>paymentDataSource;

@property (assign, nonatomic) LYPaymentAlertStyle style;
@property (strong, nonatomic) UIColor *lineColor;
@property (assign, nonatomic) NSInteger numberOfCharacters;
@property (copy, nonatomic) NSString *titleOfPayment;
@property (copy, nonatomic) NSString *detailTitle;
@property (copy, nonatomic) NSString *amount;

@end

NS_ASSUME_NONNULL_END
