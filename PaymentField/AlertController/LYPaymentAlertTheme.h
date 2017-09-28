//
//  LYPaymentAlertTheme.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/24.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AlertPresentStyle);

@interface LYPaymentAlertTheme : NSObject

/**
 默认文字样式
 */
@property (strong, nonatomic) NSDictionary<NSString *,id> *titleTextAttributes;

/**
 默认金额文字样式
 */
@property (strong, nonatomic) NSDictionary<NSString *,id> *amountTextAttributes;

/**
 默认备注文字样式
 */
@property (strong, nonatomic) NSDictionary<NSString *,id> *remarksTextAttributes;

/**
 默认标题背景色
 */
@property (strong, nonatomic) UIColor *titleBackgroundColor;

/**
 默认内容背景色
 */
@property (strong, nonatomic) UIColor *contentBackgroundColor;

@end
