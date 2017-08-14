# **LYPaymentSecurityField**

![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/lypayment.png)

![](https://img.shields.io/badge/language-objc-brightgreen.svg) ![Travis](https://img.shields.io/travis/rust-lang/rust.svg) ![platform](https://img.shields.io/badge/platform-iOS8.3%2B-orange.svg)

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
![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/sample.gif)![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/plaintext.gif)![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/shortline.gif)![](https://raw.githubusercontent.com/cityleaf/LYPaymentField/master/src/customImage.gif)
## <a id="Installation"></a>安装方式 Installation
#### 1. 手动拖入
下载demo，将demo中的PaymentField文件夹拖入到自己的工程中，在需要使用的页面，导入LYPaymentSecurityField.h
`#import "LYPaymentSecurityField.h"`
#### 2. Cocopods导入
暂不支持cocopods导入，在正式发版时会加入
#### 1. Manually
Download demo, the demo in the PaymentField folder dragged into their own projects, the need to use the page,import LYPaymentSecurityField.h
`#import "LYPaymentSecurityField.h"`
#### 2. Cocopods
Temporarily does not support cocoapods import, will be added in the official issue
## <a id="Usage"></a>用法 Usage
## <a id="TODO"></a>后期计划 TODO


