# **LYPaymentSecurityField**

![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/lypayment.png)

![](https://img.shields.io/badge/language-objc-brightgreen.svg) ![Travis](https://img.shields.io/travis/rust-lang/rust.svg) ![platform](https://img.shields.io/badge/platform-iOS8.3%2B-orange.svg) ![](https://img.shields.io/cocoapods/l/AFNetworking.svg) ![](https://img.shields.io/badge/pod-v1.2.0-brightgreen.svg)

# 目录Table of Contents
* [介绍 Introduction](#Introduction)
* [截屏 Screenshots](#Screenshots)
* [动态演示 Dynamic presentation](#Dynamic)
* [安装方式 Installation](#Installation)
* [用法 Usage](#Usage)
* [后期计划 TODO](#TODO)

## <a id="Introduction"></a>介绍 Introduction
LYPaymentSecurityField为安全支付输入框，继承于系统的UIControl。它的实现原理比较简单，主要就是利用系统的UIKeyInput。它可以用于<font color=#25A3E6>支付、安全登陆</font>以及<font color=#25A3E6>需要安全验证</font>等场景。LYPaymentSecurityField提供了一些基本的方法及属性，例如：

```
/**
 密码（字符）位数
 */
@property (nonatomic, assign) NSInteger numberOfCharacters;
```
```
/**
 已经验证过的(输入满位的)次数
 */
@property (nonatomic, assign, readonly) NSInteger countOfVerification;
```

```
/**
 输入满位时的回调
 */
@property (nonatomic, copy) void (^completion)(LYSecurityField *field, NSString *text);
```

```
/**
 清空输入
 */
- (void)clear;
```

同时，LYPaymentSecurityField也提供了一些已经集成了其他UI以及安全输入框的控件，开发者可以直接去使用。

LYPaymentSecurityField is a security payment entry box that inherits from the system's UIControl. It is relatively simple to achieve the principle is to use the system's UIKeyInput.It can be used for <font color=#25A3E6>payment, safe landing</font> and <font color=#25A3E6>the need for security verification</font> and other scenes. LYPaymentSecurityField provides some basic methods and properties, such as:
```
/**
 Password (character) number of bits
 */
@property (nonatomic, assign) NSInteger numberOfCharacters;
```
```
/**
 The number of times that have been verified (entered full)
 */
@property (nonatomic, assign, readonly) NSInteger countOfVerification;
```

```
/**
 Enter the callback when the number of digits is full
 */
@property (nonatomic, copy) void (^completion)(LYSecurityField *field, NSString *text);
```

```
/**
 Empty the characters that have been entered
 */
- (void)clear;
```
At the same time, LYPaymentSecurityField also provides some have been integrated with other UI and security input box controls, developers can directly use.
## <a id="Screenshots"></a>截屏 Screenshots
## <a id="Dynamic"></a>动态演示 Dynamic presentation 
##### 模拟器效果不是太好，请到真机上运行^-^
![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/alert_default.gif)
![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/alert_fuza.gif)
![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/sample.gif)![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/plaintext.gif)![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/shortline.gif)![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/customImage.gif)
## <a id="Installation"></a>安装方式 Installation
#### 1. 手动拖入
下载demo，将demo中的PaymentField文件夹拖入到自己的工程中，在需要使用的页面，导入LYPaymentSecurityField.h
`#import "LYPaymentSecurityField.h"`
#### 2. Cocopods导入
Podfile里增加
`pod 'LYPaymentField'`
在需要使用到的页面
`#import <LYPaymentSecurityField.h>`

#### 1. Manually
Download demo, the demo in the PaymentField folder dragged into their own projects, the need to use the page,import LYPaymentSecurityField.h
`#import "LYPaymentSecurityField.h"`
#### 2. Cocopods
Added in Podfile
`Pod 'LYPaymentField'`
In the need to use the page
`#import <LYPaymentSecurityField.h>`
## <a id="Usage"></a>用法 Usage

```
// 基本用法
self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeSecurityDot borderType:BorderTypeHaveRoundedCorner];
    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
    self.securityField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
        // 输入满格时被触发
        // TO DO 
    };
    [self.view addSubview:self.securityField];
```

```
// 明文Plaintext
self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypePlainText borderType:BorderTypeHaveRoundedCorner];
    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
    self.securityField.colorOfCharacter = UIColor.blueColor;//文字颜色
    self.securityField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
        // 输入满格时被触发
        // TO DO
    };
    [self.view addSubview:self.securityField];
```

```
// 短线加密符HorizontalLine
self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeHorizontalLine borderType:BorderTypeHaveRoundedCorner];
    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
//    self.securityField.colorOfCharacter = UIColor.brownColor;//文字颜色
    self.securityField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
        // 输入满格时被触发
        // TO DO
    };
    [self.view addSubview:self.securityField];
```

```
// 自定义加密图片CustomImage
self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeCustomImage borderType:BorderTypeHaveRoundedCorner];
    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
    self.securityField.securityImage = [UIImage imageNamed:@"mi"];
    self.securityField.securityImageSize = CGSizeMake(32, 32);//图片默认尺寸25*25，可选
    self.securityField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
        // 输入满格时被触发
        // TO DO
    };
    [self.view addSubview:self.securityField];
```
### 为核心输入框组件LYSecurityField增加协议方法

```
/**
 输入完成 end editing
 
 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidFinishedEditing:(LYSecurityField *)paymentField;

/**
 开始输入 begin editing

 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidBeginEditing:(LYSecurityField *)paymentField;

/**
 删除字符 delete a character

 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidDelete:(LYSecurityField *)paymentField;

/**
 清除完成 clear all characters

 @param paymentField 支付框
 */
- (void)lYPaymentFieldDidClear:(LYSecurityField *)paymentField;
```
#### 为集成的支付弹框组件新增协议方法

```
@required

/**
 支付密码输入完成

 @param paymentController 弹窗
 @param securityText 输入完成时的输入内容
 */
- (void)lYPaymentController:(LYPaymentAlertController *)paymentController securityTextOfCompeletion:(NSString *)securityText;

@optional

/**
 正在输入密码

 @param paymentController 支付弹框
 @param securityText 输入的密码
 */
- (void)lYPaymentController:(LYPaymentAlertController *)paymentController didEditingSecurityText:(NSString *)securityText;

/**
 清除完成

 @param paymentController 支付弹框
 */
- (void)lYPaymentControllerDidClear:(LYPaymentAlertController *)paymentController;
```
| property | note |
| --- | --- |
| diameterOfDot | 加密黑点的直径 |
| tintColor | 前景色 |
| colorOfCharacter | 加密图形的颜色 |
| securityImage | 自定义加密图片 |
| securityImageSize | 自定义加密图片的尺寸 |
| countOfVerification | readonly（输入满格）被校验的次数  |
| --- | --- |


## <a id="TODO"></a>后期计划 TODO


