//
//  LYPaymentBaseViewController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/21.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentBaseViewController.h"
#import "ScrollViewFrame.h"
#import "ViewFrame.h"

void *KVOContext;

@interface LYPaymentBaseViewController ()

- (void)adjustScrollViewInsets;

@end

@implementation LYPaymentBaseViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.navigationBar];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //    [MobClick endLogPageView:NSStringFromClass(self.class)];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    if ([self.parentViewController isKindOfClass:UINavigationController.class]) {
        self.navigationBar.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 64);
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.navigationBar setNeedsDisplay];
    [self.navigationBar setNeedsLayout];
}

- (void)willMoveToParentViewController:(UIViewController *)parent
{
    [super willMoveToParentViewController:parent];
    if (![parent isKindOfClass:[UINavigationController class]]) {
        return;
    }
    self.navigationController.navigationBarHidden = YES;
    self.navigationBar.items = @[self.navigationItem];
    if (self.navigationController.viewControllers.firstObject != self) {
        self.hidesBottomBarWhenPushed = YES;
        if (self.navigationItem.leftBarButtonItems.count == 0) {
            self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_back"]
                                                                                     style:UIBarButtonItemStylePlain
                                                                                    target:self.navigationController
                                                                                    action:@selector(popViewControllerAnimated:)];
        }
    }
}

- (void)didMoveToParentViewController:(UIViewController *)parent
{
    [super didMoveToParentViewController:parent];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == KVOContext) {
        if (!CGRectEqualToRect([change[NSKeyValueChangeOldKey] CGRectValue], [change[NSKeyValueChangeNewKey] CGRectValue])) {
            [self adjustScrollViewInsets];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    [self.navigationBar removeObserver:self forKeyPath:@"frame"];
}

#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.navigationController.interactivePopGestureRecognizer) {
        return self.navigationController.viewControllers.firstObject != self;
    }
    return YES;
}

#pragma mark - 私有方法

- (void)adjustScrollViewInsets
{
    __block UIScrollView *scrollView = nil;
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:UIScrollView.class]) {
            scrollView = (UIScrollView *)obj;
            if (@available(iOS 11.0, *)) {
                scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
            if (CGRectIntersectsRect(obj.frame, self.navigationBar.frame)) {
                scrollView.contentInsetTop = (!self.automaticallyAdjustsScrollViewInsets || self.navigationBar.hidden) ? 0 : CGRectIntersection(scrollView.frame, self.navigationBar.frame).size.height;
                scrollView.contentOffsetY = -scrollView.contentInsetTop;
            } else {
                scrollView.contentInsetTop = 0;
                scrollView.contentOffsetY = 0;
            }
        }
    }];
}

@end

@implementation LYPaymentBaseNavigationBar

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (@available(iOS 11.0, *)) {
        [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
                obj.height = self.height;
            } else if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
                if (CGRectIntersectsRect([self convertRect:obj.frame toView:self.window], UIApplication.sharedApplication.statusBarFrame)) {
                    obj.top = CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame);
                    obj.height = self.height - CGRectGetMaxY(UIApplication.sharedApplication.statusBarFrame);
                } else {
                    obj.centerY = self.middle.y;
                    [self setTitleVerticalPositionAdjustment:2 forBarMetrics:UIBarMetricsDefault];
                }
            }
        }];
    }
}

@end
