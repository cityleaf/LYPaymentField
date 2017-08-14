//
//  HorizontalLineController.m
//  PaymentSecurityField
//
//  Created by liuyu on 2017/8/8.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "HorizontalLineController.h"

@interface HorizontalLineController ()

@end

@implementation HorizontalLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LRWeakSelf(self)
    
    self.securityField = [[LYSecurityField alloc] initWithNumberOfCharacters:6 securityCharacterType:SecurityCharacterTypeHorizontalLine borderType:BorderTypeHaveRoundedCorner];
    self.securityField.frame = CGRectMake(15, 100, ScreenWidth-30, 50);
//    self.securityField.colorOfCharacter = UIColor.brownColor;//文字颜色
    self.securityField.completion = ^(LYSecurityField * _Nonnull field, NSString * _Nonnull text) {
        // 输入满格时被触发
        NSString *string = [NSString stringWithFormat:@"当前输入为：%@\n第  %ld  次校验",text,field.countOfVerification];
        weakself.infoLabel.text = string;
        NSLog(@"当前输入为：%@",text);
        NSLog(@"第  %ld  次校验",field.countOfVerification);
    };
    [self.view addSubview:self.securityField];
}


@end
