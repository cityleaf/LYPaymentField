//
//  LYPaymentAlertController.m
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/24.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "LYPaymentAlertController.h"
#import "ViewFrame.h"

static LYPaymentAlertTheme *__theme = nil;

@interface LYPaymentAlertController ()<UIViewControllerTransitioningDelegate,LYPaymentFieldDelegate>

@property (weak, nonatomic) UIView *containerView;
@property (weak, nonatomic) UILabel *titleLabel;
@property (weak, nonatomic) UILabel *amountInfoLabel;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *remarks;
@property (copy, nonatomic) NSString *amount;
@property (assign, nonatomic) NSInteger numberofCharacters;

@property (strong, nonatomic) LYPaymentAlertTransitioning *transitioning;

- (instancetype)initWithTitle:(nullable NSString *)title numberOfCharacters:(NSInteger)numberOfCharacters;
- (instancetype)initWithTitle:(nullable NSString *)title numberOfCharacters:(NSInteger)numberOfCharacters amount:(NSString *)amount remarks:(NSString *)remarks;
- (void)updateTheme;
- (void)dismiss:(UIButton *)sender;

@end

@implementation LYPaymentAlertController

@synthesize title = _title;

+ (instancetype)alertControllerWithTitle:(NSString *)title numberOfCharacters:(NSInteger)numberOfCharacters
{
    return [self.alloc initWithTitle:title numberOfCharacters:numberOfCharacters];
}

+ (instancetype)alertControllerWithTitle:(NSString *)title numberOfCharacters:(NSInteger)numberOfCharacters amount:(NSString *)amount remarks:(NSString *)remarks
{
    return [self.alloc initWithTitle:title numberOfCharacters:numberOfCharacters amount:amount remarks:remarks];
}

- (instancetype)initWithTitle:(NSString *)title numberOfCharacters:(NSInteger)numberOfCharacters
{
    self = [super init];
    if (self) {
        self.title = title;
        self.numberofCharacters = numberOfCharacters;
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title numberOfCharacters:(NSInteger)numberOfCharacters amount:(NSString *)amount remarks:(NSString *)remarks
{
    self = [super init];
    if (self) {
        self.title = title;
        self.numberofCharacters = numberOfCharacters;
        self.amount = amount;
        self.remarks = remarks;
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    self.transitioning = [[LYPaymentAlertTransitioning alloc] init];
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationOverFullScreen;
}

#pragma mark - 生命周期
- (void)loadView
{
    CGSize contentSize = self.preferredContentSize;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, contentSize.width, contentSize.height)];
    view.backgroundColor = UIColor.whiteColor;
    UIBezierPath *bezier = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:6];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = view.bounds;
    maskLayer.path = bezier.CGPath;
    view.layer.mask = maskLayer;
    self.view = view;
    UIView *containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    containerView.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:containerView];
    self.containerView = containerView;
    
    // 标题Label
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -0.5, self.containerView.width, 45)];
    titleLabel.text = self.title;
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.containerView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    // dismiss按钮
    UIButton *leftButtonItem = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, titleLabel.height, titleLabel.height)];
    [leftButtonItem setTitle:@"关闭" forState:UIControlStateNormal];
    [leftButtonItem setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
    leftButtonItem.titleLabel.font = [UIFont systemFontOfSize:14];
    [leftButtonItem addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    [self.containerView addSubview:leftButtonItem];
    _leftButtonItem = leftButtonItem;
    
    //rightButtonItem
    if (self.rightButtonItem) {
        CGFloat width = self.rightButtonItem.titleLabel.text.length * self.rightButtonItem.titleLabel.font.lineHeight;
        self.rightButtonItem.frame = CGRectMake(self.containerView.width - width - 15, 0, width, titleLabel.height);
        self.rightButtonItem.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [self.containerView addSubview:self.rightButtonItem];
    }
    
    // headerView
    if (!self.headerView) {
        self.headerView = [[UIView alloc] initWithFrame:CGRectZero];
        self.headerView.backgroundColor = view.backgroundColor;
    }
    self.headerView.frame = CGRectMake(0, titleLabel.bottom, self.containerView.width, self.headerView.height);
    [self.containerView addSubview:self.headerView];
    
    // amount
    if (self.amount.length) {
        UILabel *amountInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.headerView.bottom, self.containerView.width, 100)];
        amountInfoLabel.textAlignment = NSTextAlignmentCenter;
        amountInfoLabel.numberOfLines = 2;
        amountInfoLabel.textColor = UIColor.redColor;
        [self.containerView addSubview:amountInfoLabel];
        self.amountInfoLabel = amountInfoLabel;
    }
    
    // paymentField
    LYSecurityField *paymentField = [[LYSecurityField alloc] initWithNumberOfCharacters:self.numberofCharacters securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeHaveRoundedCorner];
    paymentField.frame = CGRectMake(10, self.amountInfoLabel ? self.amountInfoLabel.bottom : self.headerView.bottom, self.containerView.width - 10 * 2, (CGFloat)(self.containerView.width - 20) / self.numberofCharacters);
    paymentField.delegate = self;
    [self.containerView addSubview:paymentField];
    _paymentField = paymentField;
    
    // footerView
    if (!self.footerView) {
        self.footerView = [[UIView alloc] initWithFrame:CGRectMake(0, paymentField.bottom, self.containerView.width, 20)];
    }
    self.footerView.frame = CGRectMake(0, paymentField.bottom, self.containerView.width, self.footerView.height);
    self.footerView.backgroundColor = UIColor.clearColor;
    [self.containerView addSubview:self.footerView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self updateTheme];
    [self.paymentField sendActionsForControlEvents:UIControlEventTouchUpInside];
}

- (void)dealloc
{
    NSLog(@"__dealloc");
}

- (CGSize)preferredContentSize
{
    CGFloat preferredWidth = CGRectGetWidth(UIScreen.mainScreen.bounds) * 0.8;
    CGFloat preferredHeigth = ({
        CGFloat height = 0;
        if (self.title.length) {
            height += 45;
        }
        if (self.amount.length) {
            height += 100;// 金额信息的高度
        }
        height += (CGFloat)(preferredWidth - 20) / self.numberofCharacters;// 密码输入框的高度
        height += self.headerView ? CGRectGetHeight(self.headerView.frame) : 0;
        height += self.footerView ? CGRectGetHeight(self.footerView.frame) : 20;
        height;
    });
    return CGSizeMake(preferredWidth, preferredHeigth);
}
#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.transitioning;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.transitioning;
}

#pragma mark - Private Method

- (void)updateTheme
{
    LYPaymentAlertTheme *theme = self.theme ?: __theme ?: [[LYPaymentAlertTheme alloc] init];
    self.titleLabel.backgroundColor = theme.titleBackgroundColor;
    self.titleLabel.font = theme.titleTextAttributes[NSFontAttributeName];
    self.titleLabel.textColor = theme.titleTextAttributes[NSForegroundColorAttributeName];
    if (self.amount.length) {
        self.amountInfoLabel.attributedText = ({
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:self.amount];
            [attributedString addAttributes:theme.amountTextAttributes range:NSMakeRange(0, self.amount.length)];
            if (self.remarks.length) {
                [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
                [attributedString appendAttributedString:[[NSAttributedString alloc] initWithString:self.remarks]];
                [attributedString addAttributes:theme.remarksTextAttributes range:NSMakeRange(attributedString.length - self.remarks.length, self.remarks.length)];
            }
            attributedString;
        });
    }
    self.containerView.backgroundColor = theme.contentBackgroundColor;
}

- (void)dismiss:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Public Method

- (void)setContentOffset:(CGSize)contentOffset
{
    self.transitioning.contentOffset = contentOffset;
}

- (void)setPresentingStyle:(AlertPresentStyle)presentingStyle
{
    self.transitioning.presentingStyle = presentingStyle;
}

- (void)setDismissStyle:(AlertPresentStyle)dismissStyle
{
    self.transitioning.dismissStyle = dismissStyle;
}

+ (void)registerDefaultTheme:(LYPaymentAlertTheme *)theme
{
    __theme = theme;
}

#pragma mark - LYPaymentFieldDelegate

- (void)lYPaymentFieldDidFinishedEditing:(LYSecurityField *)paymentField
{
    if (@protocol(LYPaymentAlertControllerDelegate) && [self.delegate respondsToSelector:@selector(lYPaymentController:securityTextOfCompeletion:)]) {
        [self.delegate lYPaymentController:self securityTextOfCompeletion:paymentField.text];
    }
}

- (void)lYPaymentFieldDidBeginEditing:(LYSecurityField *)paymentField
{
    if (@protocol(LYPaymentAlertControllerDelegate) && [self.delegate respondsToSelector:@selector(lYPaymentController:didEditingSecurityText:)]) {
        [self.delegate lYPaymentController:self didEditingSecurityText:paymentField.text];
    }
}

- (void)lYPaymentFieldDidClear:(LYSecurityField *)paymentField
{
    if (@protocol(LYPaymentAlertControllerDelegate) && [self.delegate respondsToSelector:@selector(lYPaymentControllerDidClear:)]) {
        [self.delegate lYPaymentControllerDidClear:self];
    }
}

@end
