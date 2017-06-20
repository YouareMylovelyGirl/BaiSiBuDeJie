//
//  YGEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceViewController.h"

@interface YGEssenceViewController ()

@end

@implementation YGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YGRandomColor;
    //设置导航条
    [self setupNavBar];
}


#pragma mark - 设置导航条
- (void)setupNavBar {
    //快速创建导航条左右item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"nav_item_game_icon"] hightLightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    //titleView 用来设置 中间图片
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置右边导航条按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"navigationButtonRandom"] hightLightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(random)];
    
}
//左边游戏
- (void)game {
    NSLog(@"%s", __func__);
}
//右边随机
- (void)random {
    NSLog(@"%s", __func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
