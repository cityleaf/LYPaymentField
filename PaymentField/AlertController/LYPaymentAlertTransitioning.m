//
//  LYPaymentAlertTransitioning.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/24.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentAlertTransitioning.h"
#import "ViewFrame.h"

@implementation LYPaymentAlertTransitioning

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext { 
    return 0.3;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect toFinalFrame = [transitionContext finalFrameForViewController:toViewController];
    if (fromViewController.isBeingDismissed) {
        // dismiss
        switch (self.dismissStyle) {
            case AlertPresentStyleCenterSpring:
            {
                [UIView animateWithDuration:0.2 animations:^{
                    transitionContext.containerView.backgroundColor = UIColor.clearColor;
                    fromViewController.view.alpha = 0;
                    fromViewController.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
                } completion:^(BOOL finished) {
                    BOOL wasCancelled = [transitionContext transitionWasCancelled];
                    [transitionContext completeTransition:!wasCancelled];
                }];
                break;
            }
            case AlertPresentStyleBottomToCenterSpring:
            {
                [UIView animateWithDuration:0.2 animations:^{
                    fromViewController.view.alpha = 0;
                    fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0, CGRectGetHeight(fromViewController.view.frame));
                    transitionContext.containerView.backgroundColor = UIColor.clearColor;
                } completion:^(BOOL finished) {
                    BOOL wasCancelled = [transitionContext transitionWasCancelled];
                    [transitionContext completeTransition:!wasCancelled];
                }];
                break;
            }
            case AlertPresentStyleTopToCenterSpring:
            {
                [UIView animateWithDuration:0.2 animations:^{
                    fromViewController.view.alpha = 0;
                    fromViewController.view.frame = CGRectOffset(fromViewController.view.frame, 0, -CGRectGetHeight(fromViewController.view.frame));
                    transitionContext.containerView.backgroundColor = UIColor.clearColor;
                } completion:^(BOOL finished) {
                    BOOL wasCancelled = [transitionContext transitionWasCancelled];
                    [transitionContext completeTransition:!wasCancelled];
                }];
                break;
            }
            default:
                break;
        }
    } else {
        // present
        [transitionContext.containerView addSubview:toViewController.view];
        toFinalFrame = CGRectMake((CGRectGetWidth(transitionContext.containerView.frame) - toViewController.preferredContentSize.width)*0.5 - self.contentOffset.width,
                                  (CGRectGetHeight(transitionContext.containerView.frame) - toViewController.preferredContentSize.height) * 0.5 - self.contentOffset.height,
                                  toViewController.preferredContentSize.width,
                                  toViewController.preferredContentSize.height);
        
        switch (self.presentingStyle) {
            case AlertPresentStyleCenterSpring:
            {
                toViewController.view.frame = toFinalFrame;
                toViewController.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
                [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    toViewController.view.transform = CGAffineTransformIdentity;
                    transitionContext.containerView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
                } completion:^(BOOL finished) {
                    BOOL wasCancelled = [transitionContext transitionWasCancelled];
                    [transitionContext completeTransition:!wasCancelled];
                }];
                break;
            }
            case AlertPresentStyleBottomToCenterSpring:
            {
                toViewController.view.frame = CGRectOffset(toFinalFrame, 0, CGRectGetHeight(toFinalFrame));
                [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    toViewController.view.frame = toFinalFrame;
                    transitionContext.containerView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
                } completion:^(BOOL finished) {
                    BOOL wasCancelled = [transitionContext transitionWasCancelled];
                    [transitionContext completeTransition:!wasCancelled];
                }];
                break;
            }
            case AlertPresentStyleTopToCenterSpring:
            {
                toViewController.view.frame = CGRectOffset(toFinalFrame, 0, -CGRectGetHeight(toFinalFrame));
                [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                    toViewController.view.frame = toFinalFrame;
                    transitionContext.containerView.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
                } completion:^(BOOL finished) {
                    BOOL wasCancelled = [transitionContext transitionWasCancelled];
                    [transitionContext completeTransition:!wasCancelled];
                }];
                break;
            }
            default:
                break;
        }
    }
}

@end
