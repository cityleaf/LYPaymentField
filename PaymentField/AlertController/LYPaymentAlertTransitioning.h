//
//  LYPaymentAlertTransitioning.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/24.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AlertPresentStyle) {
    AlertPresentStyleCenterSpring = 0,
    AlertPresentStyleBottomToCenterSpring,
    AlertPresentStyleTopToCenterSpring,
};

NS_ASSUME_NONNULL_BEGIN

@interface LYPaymentAlertTransitioning : NSObject<UIViewControllerAnimatedTransitioning>

@property (assign, nonatomic) AlertPresentStyle presentingStyle;
@property (assign, nonatomic) AlertPresentStyle dismissStyle;

@property (assign, nonatomic) CGSize contentOffset; 

@end

NS_ASSUME_NONNULL_END
