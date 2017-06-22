//
//  TMCommonTabBarController.m
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "TMCommonTabBarController.h"
#import "YGEssenceViewController.h"
#import "YGMeViewController.h"
#import "YGNewViewController.h"
#import "YGFriendTrendViewController.h"
#import "YGNavigationController.h"

@interface TMCommonTabBarController ()

@end

@implementation TMCommonTabBarController

#pragma mark - viewDidLoad中添加控制器
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllControllers];
    
}



- (void)setupAllControllers {
    /*
     如果需要颜色, 需要在每个方法下面都修改
     */
    
    
    //label距离底端为3像素  默认 为0
    self.itemTitleToBottom = 4;
    //标题和图片的间距 在显示位置的基础上 加 减
    self.titleToImageViewMargin = -7;
    //自定义情况下的图片与label之间的距离  在显示位置的基础上 加 减
    self.customImageAndlabelMargin = -5;
    
    //不设置 默认10
    self.fontSize = 10;
    
    /*
     传入 item的索引 从第0个开始
     */
    
    //第一个控制器
    YGNavigationController *essenveNav = [[YGNavigationController alloc] initWithRootViewController:[[YGEssenceViewController alloc] init]];
    
    [self tabBarItemWithControllerIndes:0 controller:essenveNav title:@"精华" normalImageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon" tabBarItemType:kTMBaseTabBarItemNormal withCustomItemBlock:nil];
    
    
    [self configColorAndFont];
    
    //第二个控制器
    YGNavigationController *newNav = [[YGNavigationController alloc] initWithRootViewController:[[YGNewViewController alloc] init]];
    [self tabBarItemWithControllerIndes:1 controller:newNav title:@"新帖" normalImageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon" tabBarItemType:kTMBaseTabBarItemNormal withCustomItemBlock:nil];
    [self configColorAndFont];
    
    //中间
    [self tabBarItemWithControllerIndes:2 controller:nil title:@"" normalImageName:@"tabBar_publish_icon" selectedImageName:@"tabBar_publish_click_icon" tabBarItemType:kTMBaseTabBarItemCustom withCustomItemBlock:^{
        NSLog(@"点击了中间");
    }];
    [self configColorAndFont];
    
    //第三个控制器
    YGNavigationController *friendNav = [[YGNavigationController alloc] initWithRootViewController:[[YGFriendTrendViewController alloc] init]];
    [self tabBarItemWithControllerIndes:3 controller:friendNav title:@"关注" normalImageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon" tabBarItemType:kTMBaseTabBarItemNormal withCustomItemBlock:nil];
    [self configColorAndFont];
    
    //第四个控制器

    //加载storyBoard
    UIStoryboard *meStoryBoard = [UIStoryboard storyboardWithName:NSStringFromClass([YGMeViewController class]) bundle:nil];
    //加载箭头所指向的控制器
    YGMeViewController *meVC = [meStoryBoard instantiateInitialViewController];
    YGNavigationController *meNav = [[YGNavigationController alloc] initWithRootViewController:meVC];
    [self tabBarItemWithControllerIndes:4 controller:meNav title:@"我" normalImageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon" tabBarItemType:kTMBaseTabBarItemNormal withCustomItemBlock:nil];
    [self configColorAndFont];
    
    //    self.selectedIndex = 1;
}

- (void)configColorAndFont {
    //选择字体的颜色
    self.TMBaseTabBarItems.normalTitleSelectesColor = [UIColor orangeColor];
    //未选择时候的字体颜色
    self.TMBaseTabBarItems.normalTitleNormalColor = [UIColor blackColor];
    //自定义字体的颜色
    self.TMBaseTabBarItems.customTitlwNormalColor = [UIColor redColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
