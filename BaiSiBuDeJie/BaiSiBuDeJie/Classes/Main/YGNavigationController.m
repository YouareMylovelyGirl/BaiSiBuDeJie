//
//  YGNavigationController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGNavigationController.h"

@interface YGNavigationController ()


@end

@implementation YGNavigationController

+ (void)load {
    //设置全局
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [navBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]}];
    
    //设置导航条的背景图片 --- 这里要选择Default
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航不透明
    self.navigationBar.translucent = NO;
}


//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.childViewControllers.count > 0) {

        NSString *title = @"返回";
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemButtonWithTitle:title fontSize:16 normalColor:[UIColor blackColor] highLightColor:[UIColor redColor] target:self action:@selector(popLastViewController) NormalReturnPic:[UIImage imageNamed:@"navigationButtonReturn"] highLightImage:[UIImage imageNamed:@"navigationButtonReturnClick"]];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//返回上一控制器
- (void)popLastViewController {
    [self popViewControllerAnimated:YES];
}




@end
