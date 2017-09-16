//
//  UIView+Frame.m
//  LYTest
//
//  Created by liuyu on 2017/8/17.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "ViewFrame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return CGRectGetMinX(self.frame);
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return CGRectGetMinY(self.frame);
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return CGRectGetMidX(self.frame);
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return CGRectGetMidY(self.frame);
}

- (CGPoint)middle
{
    CGPoint middle = CGPointMake(self.width/2.f, self.height/2.f);
    return middle;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return CGRectGetWidth(self.frame);
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return CGRectGetHeight(self.frame);
}

- (void)setSize:(CGSize)size
{
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

- (CGSize)size
{
    return CGSizeMake(self.width, self.height);
}

- (void)setTop:(CGFloat)top
{
    CGFloat oldHeight = CGRectGetHeight(self.frame);
    CGFloat dY = self.y - top;
    CGFloat newHeight = oldHeight + dY > 0 ? oldHeight + dY : 0 ;
    self.y = top;
    self.height = newHeight;
}

- (CGFloat)top
{
    return CGRectGetMinY(self.frame);
}

- (void)setLeft:(CGFloat)left
{
    CGFloat oldWidth = CGRectGetWidth(self.frame);
    CGFloat dX = self.x - left;
    CGFloat newWidth = oldWidth + dX > 0 ? oldWidth + dX : 0;
    self.x = left;
    self.width = newWidth;
}

- (CGFloat)left
{
    return CGRectGetMinX(self.frame);
}

- (void)setBottom:(CGFloat)bottom
{
    CGFloat oldHeight = CGRectGetHeight(self.frame);
    CGFloat dY = bottom - self.bottom;
    CGFloat newHeight = oldHeight + dY > 0 ? oldHeight + dY : 0;
    self.height = newHeight;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setRight:(CGFloat)right
{
    CGFloat oldWidth = CGRectGetWidth(self.frame);
    CGFloat dX = right - self.right;
    CGFloat newWidth = oldWidth + dX > 0 ? oldWidth + dX : 0;
    self.width = newWidth;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setDBottom:(CGFloat)dBottom
{
    UIView *superView = self.superview;
    self.height = superView.height - self.top + dBottom;
    
}

- (CGFloat)dBottom
{
    UIView *superView = self.superview;
    return self.height - superView.height + self.top;
}

- (void)setDRight:(CGFloat)dRight
{
    UIView *superView = self.superview;
    self.width = superView.width - self.left + dRight;
}

- (CGFloat)dRight
{
    UIView *superView = self.superview;
    return self.width - superView.width + self.left;
}

- (void)setEdge:(UIEdgeInsets)edge
{
    self.top = edge.top;
    self.left = edge.left;
    self.dBottom = edge.bottom;
    self.dRight = edge.right;
}

- (UIEdgeInsets)edge
{
    return UIEdgeInsetsMake(self.top, self.left, self.dBottom, self.dRight);
}

@end
