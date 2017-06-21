//
//  YGNewViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGNewViewController.h"
#import "YGRecommendViewController.h"

@interface YGNewViewController ()

@end

@implementation YGNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YGRandomColor;
    [self setupNavBar];
}

#pragma mark - 设置导航条
- (void)setupNavBar {
    //快速创建导航条左右item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] hightLightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(subIcon)];
    
}
//左边subIcon
- (void)subIcon {
    YGRecommendViewController *recommend = [[YGRecommendViewController alloc] init];
    [self.navigationController pushViewController:recommend animated:YES];
}



@end
