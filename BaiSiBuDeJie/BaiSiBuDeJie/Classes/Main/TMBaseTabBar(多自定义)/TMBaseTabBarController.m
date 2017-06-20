//
//  TMBaseTabBarController.m
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "TMBaseTabBarController.h"

//屏幕宽度
#define TMScreenW                  [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define TMScreenH                  [[UIScreen mainScreen] bounds].size.height
//tabBar的高度
#define tabBarHeight               CGRectGetHeight(self.TMBaseTabBar.frame)



@interface TMBaseTabBarController ()<TMBaseTabBarDelegate>

@end

@implementation TMBaseTabBarController



#pragma mark - life
- (void)viewDidLoad
{
    [super viewDidLoad];
    //取消背景图片
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    //取消阴影横线
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
}

#pragma mark -   实现初始化TMTabBarController的TMBaseTabBarItems方法

- (void)tabBarItemWithControllerIndes:(NSInteger)controllerIndex controller:(UIViewController *)controller title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(TMBaseTabBarItemType)tabBarItemType withCustomItemBlock:(void (^)())itemsClick
{
    
    self.TMBaseTabBarItems = [[TMBaseTabBarItems alloc] initWithFrame:CGRectMake(controllerIndex * ([UIScreen mainScreen].bounds.size.width / self.TMBaseTabBar.itemsCount), 0, [UIScreen mainScreen].bounds.size.width / self.TMBaseTabBar.itemsCount, self.TMBaseTabBar.frame.size.height)];
    [self.TMBaseTabBarItems setTitle:title forState:UIControlStateNormal];
    [self.TMBaseTabBarItems setTitle:title forState:UIControlStateSelected];
    if (self.fontSize == 0) {
        self.fontSize = 10;
    }
    self.TMBaseTabBarItems.titleLabel.font = [UIFont systemFontOfSize:self.fontSize];
    
    //距离
    
    
    
    
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [self.TMBaseTabBarItems setImage:normalImage forState:UIControlStateNormal];
    [self.TMBaseTabBarItems setImage:selectedImage forState:UIControlStateSelected];
    
    
    self.TMBaseTabBarItems.tabBarItemType = tabBarItemType;
    
    if (self.TMBaseTabBarItems.tabBarItemType == kTMBaseTabBarItemCustom) {
        [self.TMBaseTabBarItems setTitleColor:self.TMBaseTabBarItems.customTitlwNormalColor forState:UIControlStateNormal];
        self.TMBaseTabBarItems.imageAndlabelMargin = self.customImageAndlabelMargin;
        self.TMBaseTabBarItems.itemTitleToBottom = self.itemTitleToBottom;
        
    } else {
        [self.TMBaseTabBarItems setTitleColor:self.TMBaseTabBarItems.normalTitleNormalColor forState:UIControlStateNormal];
        [self.TMBaseTabBarItems setTitleColor:self.TMBaseTabBarItems.normalTitleSelectesColor forState:UIControlStateSelected];
        self.TMBaseTabBarItems.itemTitleToBottom = self.itemTitleToBottom;
        
        self.TMBaseTabBarItems.titleToImageViewMargin = self.titleToImageViewMargin;
    }
    
    [self.tabBarItems addObject:self.TMBaseTabBarItems];
    
    //如果是正常, 则直接推出控制器
    if (tabBarItemType == kTMBaseTabBarItemNormal) {
            
        [self.tabBarControllers addObject:controller];
        
    }
    //添加控制器到ViewControllers
    self.viewControllers = [NSArray arrayWithArray:self.tabBarControllers];
    
    //调用一次方法添加一次item数组到tabBarItems
    self.TMBaseTabBar.tabBarItems = [NSArray arrayWithArray:self.tabBarItems];
    
    self.TMBaseTabBar.delegate = self;
    //调用一次方法添加一次tabBar
    [self.tabBar addSubview:self.TMBaseTabBar];
    
    self.TMBaseTabBarItems.clickItems = itemsClick;
    [self.TMBaseTabBarItems addTarget:self action:@selector(clickItems:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickItems:(TMBaseTabBarItems *)sender
{
    if (sender.clickItems != nil) {
        sender.clickItems();
    }
}

#pragma mark - lazy
- (NSMutableArray *)tabBarControllers
{
    if (!_tabBarControllers) {
        _tabBarControllers = [NSMutableArray array];
    }
    return _tabBarControllers;
}

- (NSMutableArray *)tabBarItems
{
    if (_tabBarItems == nil) {
        _tabBarItems = [NSMutableArray array];
    }
    return _tabBarItems;
}

- (TMBaseTabBar *)TMBaseTabBar
{
    if (_TMBaseTabBar == nil) {
        _TMBaseTabBar = [[TMBaseTabBar alloc] initWithFrame:self.tabBar.bounds];
    }
    return _TMBaseTabBar;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    // 删除系统自动生成的UITabBarButton
    
    /**
     在此处删除tabBar里面items有bug
     */
    
//    for (UIView *child in self.tabBar.subviews) {
//        if ([child isKindOfClass:[UIControl class]]) {
//            [child removeFromSuperview];
//        }
//    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex
{
    [super setSelectedIndex:selectedIndex];
    [self.TMBaseTabBar setTabbarSelectedIndex:selectedIndex];
}

#pragma mark - 代理方法
- (void)baseTabBarDidSelectedCustomButton{}

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
