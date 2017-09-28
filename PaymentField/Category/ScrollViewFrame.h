//
//  UIScrollViewScrollViewFrame.h
//  PaymentSecurityField
//
//  Created by 刘宇 on 2017/9/23.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ScrollViewFrame)

// Content Offset
@property (nonatomic) CGFloat contentOffsetX;
@property (nonatomic) CGFloat contentOffsetY;

// Content Size
@property (nonatomic) CGFloat contentSizeWidth;
@property (nonatomic) CGFloat contentSizeHeight;

// Content Inset
@property (nonatomic) CGFloat contentInsetTop;
@property (nonatomic) CGFloat contentInsetLeft;
@property (nonatomic) CGFloat contentInsetBottom;
@property (nonatomic) CGFloat contentInsetRight;

@end
