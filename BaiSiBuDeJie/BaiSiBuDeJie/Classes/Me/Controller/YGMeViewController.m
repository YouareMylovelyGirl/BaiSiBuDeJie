//
//  YGMeViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGMeViewController.h"
#import "YGSettingViewController.h"

@interface YGMeViewController ()

@end

@implementation YGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
}
#pragma mark - 设置导航条
- (void)setupNavBar {
    self.navigationItem.title = @"我的";
    
    //快速创建导航条左右item
    UIBarButtonItem *moonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] selected:[UIImage imageNamed:@"mine-sun-icon-click"] target:self action:@selector(changeMoonBackground:)];
    UIBarButtonItem *settingItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"mine-setting-icon"] hightLightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(clickSetting)];
    
    self.navigationItem.rightBarButtonItems = @[ settingItem, moonItem];
}
//夜间模式
- (void)changeMoonBackground:(UIButton *)sender {
    //设置按钮的选中状态
    sender.selected = !sender.selected;
    
    NSLog(@"%s", __func__);
}
//设置
- (void)clickSetting {
    NSLog(@"%s", __func__);
    //跳转到设置界面
    YGSettingViewController *settingVC = [[YGSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}



@end
