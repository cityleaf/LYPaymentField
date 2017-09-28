//
//  AlertViewController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "AlertViewController.h"
#import "ViewFrame.h"
#import "LYPaymentAlertController.h"

@interface AlertViewController ()<LYPaymentAlertControllerDelegate>
@property (assign, nonatomic) NSInteger verifiyCount;
@end

@implementation AlertViewController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = UIColor.whiteColor;
    self.view = view;
    
    NSArray *alertKinds = @[@"default",@"custom1",@"custom2",@"自定义 footerView",@"custom4",@"自定义headerView，footerView",@"自定义rightButtonItem"];
    CGFloat width = 130;
    CGFloat height = 30;
    CGFloat betweenW = (self.view.width - 2 * width) / 3.f;
    [alertKinds enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(betweenW + (betweenW + width) * (idx % 2), 88 + (50 + height) * (idx / 2) , width, height);
        button.backgroundColor = UIColor.grayColor;
        button.tag = idx;
        button.titleLabel.adjustsFontSizeToFitWidth = YES;
        [button setTitle:obj forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:button];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.verifiyCount = 3;
}

#pragma mark - Target Actions

- (void)buttonClicked:(UIButton *)button
{
    switch (button.tag) {
        case 0:
        {
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6 amount:@"￥120.00" remarks:@"看那有个傻子"];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        case 1:
        {
            // 注意：如果使用registerDefaultTheme方法，全局将会统一样式
            // 如果不需要全局统一样式，请设置主题属性 paymentAlert.theme = theme;
            LYPaymentAlertTheme *theme = [[LYPaymentAlertTheme alloc] init];
            theme.amountTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:0.97 green:0.79 blue:0.18 alpha:1.00],NSFontAttributeName:[UIFont systemFontOfSize:40]};
            // [LYPaymentAlertController registerDefaultTheme:theme];
            
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6 amount:@"￥120.00" remarks:@"一只猴网络工作室"];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            paymentAlert.presentingStyle = AlertPresentStyleBottomToCenterSpring;
            paymentAlert.dismissStyle = AlertPresentStyleCenterSpring;
            paymentAlert.theme = theme;
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        case 2:
        {
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6 amount:@"￥120.00" remarks:@"转账至 叶*城"];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            paymentAlert.presentingStyle = AlertPresentStyleTopToCenterSpring;
            paymentAlert.dismissStyle = AlertPresentStyleCenterSpring;
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        case 3:
        {
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6 amount:@"￥120.00" remarks:@"付款给 小叶*"];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            paymentAlert.presentingStyle = AlertPresentStyleBottomToCenterSpring;
            paymentAlert.dismissStyle = AlertPresentStyleBottomToCenterSpring;
            paymentAlert.footerView = ({
                // headerView footerView 的 origin，width设置为paymentAlert的width
                UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds) * 0.8, 70)];
                UIButton *verificationButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, footerView.width - 10 * 2, footerView.height - 10 * 2)];
                verificationButton.backgroundColor = [UIColor colorWithRed:0.47 green:0.79 blue:0.48 alpha:1.00];
                [verificationButton setTitle:@"验证密码" forState:UIControlStateNormal];
                [footerView addSubview:verificationButton];
                footerView;
            });
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        case 4:
        {
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6 amount:@"￥120.00" remarks:@"浙江XXXXXXX有限公司"];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            paymentAlert.presentingStyle = AlertPresentStyleTopToCenterSpring;
            paymentAlert.dismissStyle = AlertPresentStyleTopToCenterSpring;
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        case 5:
        {
            NSString *amount = @"￥15.00";
            NSString *remarks = @"浙江XXXXXXX有限公司";
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            paymentAlert.headerView = ({
                UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds) * 0.8, 150)];
                // 金额
                UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerView.width, 100)];
                amountLabel.numberOfLines = 2;
                amountLabel.attributedText = ({
                    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:amount];
                    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:35.0], NSForegroundColorAttributeName: UIColor.blackColor} range:NSMakeRange(0, amount.length)];
                    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
                    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:remarks]];
                    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:16.0], NSForegroundColorAttributeName: UIColor.blackColor} range:NSMakeRange(attributedString.length - remarks.length, remarks.length)];
                    attributedString;
                });
                amountLabel.textAlignment = NSTextAlignmentCenter;
                [headerView addSubview:amountLabel];
                // 选择银行卡
                UIButton *selectBankCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
                selectBankCardButton.frame = CGRectMake(0, amountLabel.bottom, headerView.width, 40);
                [selectBankCardButton setTitle:@"招商银行(3774)" forState:UIControlStateNormal];
                [selectBankCardButton setBackgroundColor:UIColor.grayColor];
                [selectBankCardButton setImage:[UIImage imageNamed:@"mi"] forState:UIControlStateNormal];
                [selectBankCardButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
                selectBankCardButton.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
                selectBankCardButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
                selectBankCardButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                [headerView addSubview:selectBankCardButton];
                headerView;
            });
            paymentAlert.footerView = ({
                // headerView footerView 的 origin，width设置为paymentAlert的width
                UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds) * 0.8, 20)];
                resultLabel.textAlignment = NSTextAlignmentCenter;
                resultLabel.textColor = UIColor.redColor;
                resultLabel.font = [UIFont systemFontOfSize:11];
                resultLabel;
            });
            paymentAlert.delegate = self;
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        case 6:
        {
            NSString *amount = @"￥1314.00";
            NSString *remarks = @"一梦千年 一剑情缘";
            LYPaymentAlertController *paymentAlert = [LYPaymentAlertController alertControllerWithTitle:@"请输入支付密码" numberOfCharacters:6];
            paymentAlert.contentOffset = CGSizeMake(0, 50);
            paymentAlert.headerView = ({
                UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds) * 0.8, 150)];
                // 金额
                UILabel *amountLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, headerView.width, 100)];
                amountLabel.numberOfLines = 2;
                amountLabel.attributedText = ({
                    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:amount];
                    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:35.0], NSForegroundColorAttributeName: UIColor.blackColor} range:NSMakeRange(0, amount.length)];
                    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
                    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:remarks]];
                    [attributedString addAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFangSC-Regular" size:16.0], NSForegroundColorAttributeName: UIColor.blackColor} range:NSMakeRange(attributedString.length - remarks.length, remarks.length)];
                    attributedString;
                });
                amountLabel.textAlignment = NSTextAlignmentCenter;
                [headerView addSubview:amountLabel];
                // 选择银行卡
                UIButton *selectBankCardButton = [UIButton buttonWithType:UIButtonTypeCustom];
                selectBankCardButton.frame = CGRectMake(0, amountLabel.bottom, headerView.width, 40);
                [selectBankCardButton setTitle:@"招商银行(3774)" forState:UIControlStateNormal];
                [selectBankCardButton setBackgroundColor:UIColor.grayColor];
                [selectBankCardButton setImage:[UIImage imageNamed:@"mi"] forState:UIControlStateNormal];
                [selectBankCardButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
                selectBankCardButton.contentEdgeInsets = UIEdgeInsetsMake(0, 15, 0, 15);
                selectBankCardButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
                selectBankCardButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
                [headerView addSubview:selectBankCardButton];
                headerView;
            });
            paymentAlert.footerView = ({
                // headerView footerView 的 origin，width设置为paymentAlert的width
                UILabel *resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen.bounds) * 0.8, 20)];
                resultLabel.textAlignment = NSTextAlignmentCenter;
                resultLabel.textColor = UIColor.redColor;
                resultLabel.font = [UIFont systemFontOfSize:11];
                resultLabel;
            });
            paymentAlert.rightButtonItem = ({
                UIButton *fingerprintButton = [UIButton buttonWithType:UIButtonTypeCustom];
                [fingerprintButton setTitle:@"指纹支付" forState:UIControlStateNormal];
                [fingerprintButton setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
                fingerprintButton.titleLabel.font = [UIFont systemFontOfSize:14];
                fingerprintButton;
            });
            paymentAlert.delegate = self;
            [self presentViewController:paymentAlert animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
    
}

#pragma mark - LYPaymentAlertControllerDelegate

- (void)lYPaymentController:(LYPaymentAlertController *)paymentController securityTextOfCompeletion:(NSString *)securityText
{
    UILabel *resultLabel = (UILabel *)paymentController.footerView;
    resultLabel.text = @"正在校验密码";
    resultLabel.textColor = UIColor.blackColor;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (![securityText isEqualToString:@"123456"]) {
            resultLabel.textColor = UIColor.redColor;
            if (!self.verifiyCount) {
                resultLabel.text = @"请等待3小时候再次输入";
                return;
            }
            resultLabel.text = [NSString stringWithFormat:@"密码错误，还剩%ld次机会",(long)self.verifiyCount--];
        } else {
            resultLabel.text = @"恭喜你，支付密码验证通过";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:YES completion:nil];
            });
        }
    });
}

- (void)lYPaymentController:(LYPaymentAlertController *)paymentController didEditingSecurityText:(NSString *)securityText
{
    UILabel *resultLabel = (UILabel *)paymentController.footerView;
    resultLabel.textColor = UIColor.blackColor;
    resultLabel.text = @"正在输入...";
}

- (void)lYPaymentControllerDidClear:(LYPaymentAlertController *)paymentController
{
    UILabel *resultLabel = (UILabel *)paymentController.footerView;
    resultLabel.textColor = UIColor.redColor;
    resultLabel.text = @"密码已清空，请重新输入";
}

@end
