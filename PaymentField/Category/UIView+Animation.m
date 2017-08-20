//
//  UIView+Animation.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/19.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "UIView+Animation.h"

@implementation UIView (Animation)

- (void)ly_showPopup
{
    self.alpha = 0.0;
    self.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.0;
        self.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)ly_dismissPopup:(void (^)(void))completion
{
    [UIView animateWithDuration:0.15 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0.0;
        self.transform = CGAffineTransformMakeScale(0.5, 0.5);
    } completion:^(BOOL finished) {
        !completion ?: completion();
    }];
}

@end
