//
//  UIView+Frame.h
//  LYTest
//
//  Created by liuyu on 2017/8/17.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

/**
 * 原点坐标(x,y)
 * 中心点坐标(centerX,centerY)
 * middle : 自己的中点坐标，可以让子视图位于自己中心位置
 */
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign, readonly) CGPoint middle;

/**
 * with : 宽
 * heigth : 高
 * size : (宽,高)
 */
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;

/**
 * top : 到父视图上边的距离(等效于Y)
 * left : 到父视图左边的距离(等效于X)
 * bottom : 底边的Y值(底边到父视图上边的距离)
 * right : 右边的X值(右边到父视图左边的距离)
 */
@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat right;

/**
 * dBottom : 底边到父视图底边的距离，有+-之分
 * dRight : 右边到父视图右边的距离，有+-之分
 * edge : 四个边分别到父视图四边的距离
 */
@property (nonatomic, assign) CGFloat dBottom;
@property (nonatomic, assign) CGFloat dRight;
@property (nonatomic, assign) UIEdgeInsets edge;

@end
