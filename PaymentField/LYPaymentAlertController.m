//
//  LYPaymentAlertController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/8/20.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentAlertController.h"
#import "UIView+Animation.h"
#import "ViewFrame.h"

NS_ASSUME_NONNULL_BEGIN

@interface LYPaymentAlertView()

@property (strong, nonatomic) UIButton *cancelButton;
@property (strong, nonatomic) UIButton *rightButton;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIView *lineView;
@property (strong, nonatomic) UILabel *amountLabel;
@property (strong, nonatomic) UIView *contentView;

@property (strong, nonatomic) UIColor *lineColor;

@property (assign, nonatomic) NSInteger numberOfCharacters;

- (instancetype)initWithSize:(CGSize)size
                       title:(nullable NSString *)title
                 detailTitle:(nullable NSString *)detailTitle
                      amount:(nullable NSString *)amount
          numberOfCharacters:(NSInteger)numbaeOfCharacters
           cancelButtonImage:(nullable UIImage *)cancelButtonImage
                 contentView:(nullable UIView *)contentView;

@end

@implementation LYPaymentAlertView

- (instancetype)initWithSize:(CGSize)size title:(nullable NSString *)title detailTitle:(nullable NSString *)detailTitle amount:(nullable NSString *)amount numberOfCharacters:(NSInteger)numbaeOfCharacters cancelButtonImage:(nullable UIImage *)cancelButtonImage contentView:(nullable UIView *)contentView
{
    self = [super init];
    if (self) {
        
        self.size = size;
        
        self.titleLabel = ({
            UILabel *label = [[UILabel alloc] init];
            label.text = title ?: @"请输入支付密码";
            label.font = [UIFont systemFontOfSize:20];
            label.textAlignment = NSTextAlignmentCenter;
            label;
        });
        [self addSubview:self.titleLabel];
        // 消失按钮
        self.cancelButton = ({
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setImage:cancelButtonImage forState:UIControlStateNormal];
            button.imageEdgeInsets = UIEdgeInsetsMake(5, 5, 5, 5);
            button;
        });
        [self addSubview:self.cancelButton];
        if (amount) {
            self.amountLabel = ({
                UILabel *label = [[UILabel alloc] init];
                label.numberOfLines = 0;
                label.attributedText = ({
                    amount = [NSString stringWithFormat:@"￥%@",amount];
                    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:detailTitle];
                    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
                    [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:amount]];
                    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} range:NSMakeRange(0, detailTitle.length)];
                    [attributedString addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:33]} range:NSMakeRange(attributedString.length-amount.length, amount.length)];
                    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
                    style.lineSpacing = 5;
                    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedString.length)];
                    attributedString;
                });
                label.textAlignment = NSTextAlignmentCenter;
                label;
            });
            [self addSubview:self.amountLabel];
        }
        // 分割线
        UIView *lineView = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor colorWithWhite:0 alpha:1];
            view;
        });
        [self addSubview:lineView];
        self.lineView = lineView;
        // 支付框
        self.paymentField = ({
            LYSecurityField *paymentField = [[LYSecurityField alloc] initWithNumberOfCharacters:numbaeOfCharacters securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeHaveRoundedCorner];
            paymentField;
        });
        [self addSubview:self.paymentField];
        
        if (contentView) {
            self.contentView = ({
                UIView *view = [[UIView alloc] init];
                view;
            });
            [self addSubview:self.contentView];
        }
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat heightOfTitle = 45;
    CGFloat padding = 15;
    // cancelButton
    self.cancelButton.top = 0;
    self.cancelButton.left = 0;
    self.cancelButton.width = self.cancelButton.height = heightOfTitle;
    // titleLabel
    self.titleLabel.top = 0;
    self.titleLabel.left = 0;
    self.titleLabel.dRight = 0;
    self.titleLabel.height = heightOfTitle;
    // amountLabel
    if (self.amountLabel) {
        self.amountLabel.top = self.titleLabel.bottom;
        self.amountLabel.left = padding;
        self.amountLabel.dRight = -padding;
        self.amountLabel.height = 100;
        self.height = self.height + 100;
    }
    // line
    self.lineView.top = self.titleLabel.bottom;
    self.lineView.left = 0;
    self.lineView.dRight = 0;
    self.lineView.height = 0.5;
    // paymentField
    if (self.amountLabel) {
        self.paymentField.left = padding;
        self.paymentField.dRight = -padding;
        self.paymentField.top = self.amountLabel.bottom;
        self.paymentField.height = heightOfTitle;
        
    } else {
        self.paymentField.left = padding;
        self.paymentField.dRight = -padding;
        self.paymentField.height = heightOfTitle;
        self.paymentField.top = self.height - self.paymentField.height - padding;
    }
    
    self.center = self.superview.middle;
    
}

#pragma mark - set

- (void)setLineColor:(UIColor *)lineColor
{
    self.lineView.backgroundColor = lineColor;
}

@end

@interface LYPaymentAlertController ()

- (void)dismissButtonClicked:(UIButton *)button;

@end

@implementation LYPaymentAlertController

- (void)loadView
{
    UIView *view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.8];
    self.view = view;
    // alert
    LYPaymentAlertView *alertView = [[LYPaymentAlertView alloc] initWithSize:CGSizeMake(300, 110)
                                                                       title:@"输入支付密码"
                                                                 detailTitle:self.detailTitle
                                                                      amount:self.amount
                                                          numberOfCharacters:self.numberOfCharacters
                                                           cancelButtonImage:[UIImage imageNamed:@"pay_close"]
                                                                 contentView:nil];
    alertView.layer.cornerRadius = 4;
    alertView.backgroundColor = UIColor.whiteColor;
    alertView.lineColor = self.lineColor;
    [alertView.cancelButton addTarget:self action:@selector(dismissButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:alertView];
    self.alertView = alertView;
    // layout
    self.alertView.center = self.view.middle;
    
    // anmation
    [self.alertView ly_showPopup];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - Target Actions

- (void)dismissButtonClicked:(UIButton *)button
{
    [self.alertView ly_dismissPopup:^{
//        [self dismissPaymentAlert];
    }];
}

@end

NS_ASSUME_NONNULL_END
