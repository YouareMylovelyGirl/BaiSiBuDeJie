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
    self.view.backgroundColor = [UIColor whiteColor];
    //设置导航条
    [self setupNavBar];
}


#pragma mark - 设置导航条
- (void)setupNavBar {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"nav_item_game_icon"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"nav_item_game_click_icon"] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:self action:@selector(game) forControlEvents:UIControlEventTouchUpInside];
    
    //如果不用view包一下, tabBarItem点击范围会变大
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    
    
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:contentView];
    self.navigationItem.leftBarButtonItem = leftBarButton;
}

- (void)game {
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
