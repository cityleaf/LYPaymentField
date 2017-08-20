//
//  UIView+Animation.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/19.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

/**
 展示弹出动画
 */
- (void)ly_showPopup;

/**
 消失弹出动画，与gp_showPopup配对使用
 */
- (void)ly_dismissPopup:(void(^)(void))completion;

@end
