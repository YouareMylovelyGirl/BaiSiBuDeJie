//
//  YGFriendTrendViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGFriendTrendViewController.h"
#import "YGLoginViewController.h"

@interface YGFriendTrendViewController ()

@end

@implementation YGFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar {
    self.navigationItem.title = @"我的关注";
    
    //快速创建导航条左右item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"friendsRecommentIcon"] hightLightImage:[UIImage imageNamed:@"friendsRecommentIcon-click"] target:self action:@selector(friendsRecommend)];
    
}

#pragma mark - action
//左边推荐关注
- (void)friendsRecommend {
    NSLog(@"%s", __func__);
}
//点击登录注册按钮
- (IBAction)clickLogInRegister:(id)sender {
    YGLoginViewController *loginVC = [[YGLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
