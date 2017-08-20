//
//  ViewController.m
//  PaymentSecurityField
//
//  Created by liuyu on 2017/8/2.
//  Copyright © 2017年 刘宇. All rights reserved.
//

#import "ViewController.h"
#import "LYSecurityField.h"
#import "SampleController.h"
#import "PlaintextController.h"
#import "HorizontalLineController.h"
#import "CustomImageController.h"
#import "AlertViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray <NSArray *>*controllers;
@property (nonatomic, strong) NSArray <NSArray *>*controllerTitles;
@property (nonatomic, strong) NSArray *categoryTitles;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@""
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:nil];
    
    self.categoryTitles = @[@"LYSecurityField(纯密码框控件)",
                           @"IntegratedWell(已经定制了UI的)"];
    
    self.controllerTitles = @[
                              @[@"简单使用Sample",
                                @"明文Plaintext",
                                @"短线加密符HorizontalLine",
                                @"自定义加密图片CustomImage"],
                              @[@"弹窗"]];
    
    self.controllers = @[
                         @[[[SampleController alloc] init],
                           [[PlaintextController alloc] init],
                           [[HorizontalLineController alloc] init],
                           [[CustomImageController alloc] init]],
                         @[[[AlertViewController alloc] init]]];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.categoryTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.controllers[section].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.categoryTitles[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.controllerTitles[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *selectedVC = (UIViewController *)self.controllers[indexPath.section][indexPath.row];
    selectedVC.title = self.controllerTitles[indexPath.section][indexPath.row];
    [self.navigationController pushViewController:selectedVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
