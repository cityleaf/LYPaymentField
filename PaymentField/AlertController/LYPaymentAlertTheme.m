//
//  LYPaymentAlertTheme.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/24.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentAlertTheme.h"

@implementation LYPaymentAlertTheme

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Medium" size:17.0], NSForegroundColorAttributeName: UIColor.blackColor};
        self.amountTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:35.0], NSForegroundColorAttributeName: UIColor.blackColor};
        self.remarksTextAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:16.0], NSForegroundColorAttributeName: UIColor.blackColor};
        self.titleBackgroundColor = [UIColor colorWithRed:0.47 green:0.79 blue:0.48 alpha:1.00];
        self.contentBackgroundColor = UIColor.whiteColor;
    }
    return self;
}

@end
