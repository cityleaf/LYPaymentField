//
//  LYPaymentBaseViewController.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/21.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LYPaymentBaseViewController : UIViewController<UIGestureRecognizerDelegate>

/**
 自定义的Bar
 */
@property (strong, nonatomic) UINavigationBar *navigationBar;

/**
 * 生命周期
 */
- (void)viewDidLoad NS_REQUIRES_SUPER;
- (void)viewWillAppear:(BOOL)animated NS_REQUIRES_SUPER;
- (void)viewWillDisappear:(BOOL)animated NS_REQUIRES_SUPER;
- (void)viewDidAppear:(BOOL)animated NS_REQUIRES_SUPER;
- (void)viewDidDisappear:(BOOL)animated NS_REQUIRES_SUPER;
- (void)viewWillLayoutSubviews NS_REQUIRES_SUPER;
- (void)viewDidLayoutSubviews NS_REQUIRES_SUPER;
- (void)willMoveToParentViewController:(nullable UIViewController *)parent NS_REQUIRES_SUPER;
- (void)didMoveToParentViewController:(nullable UIViewController *)parent NS_REQUIRES_SUPER;

@end

@interface LYPaymentBaseNavigationBar : UINavigationBar

@end

NS_ASSUME_NONNULL_END
