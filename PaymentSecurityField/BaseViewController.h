//
//  BaseViewController.h
//  PaymentSecurityField
//
//  Created by liuyu on 2017/8/8.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Header.h"
#import "LYPaymentSecurityField.h"

@interface BaseViewController : UIViewController

/**
 安全输入框 LYSecurityField
 */
@property (nonatomic, strong) LYSecurityField *securityField;
/**
 清空按钮 clear button
 */
@property (nonatomic, strong) UIButton *clearButton;

/**
 操作信息展示 
 */
@property (nonatomic, strong) UILabel *infoLabel;

@end
