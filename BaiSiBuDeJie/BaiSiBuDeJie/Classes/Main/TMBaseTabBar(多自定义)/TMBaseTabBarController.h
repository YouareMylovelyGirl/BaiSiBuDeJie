//
//  TMBaseTabBarController.h
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMBaseTabBar.h"

#import "TMBaseTabBarItems.h"




@interface TMBaseTabBarController : UITabBarController

/** tabBarControllers */
@property(nonatomic, strong) NSMutableArray *tabBarControllers;
/** tabBarItems */
@property(nonatomic, strong) NSMutableArray *tabBarItems;
/** TMBaseTabBar */
@property(nonatomic, strong) TMBaseTabBar *TMBaseTabBar;
/** 按钮控件 */
@property(nonatomic, strong) TMBaseTabBarItems *TMBaseTabBarItems;



/** item标题距离图片之间的距离  */
@property(nonatomic, assign) CGFloat titleToImageViewMargin;

/** 自定义时候 图片与label之间的空隙  */
@property(nonatomic, assign) CGFloat customImageAndlabelMargin;

/** item标题距离底部高度 默认0  */
@property(nonatomic, assign) CGFloat itemTitleToBottom;


/** 字体大小 默认10 */
@property(nonatomic, assign) CGFloat fontSize;


/**
  初始化TMTabBarController的TMBaseTabBarItems

 @param controllerIndex       对应的第几个控制器, 默认从第0个开始
 @param controller            tabBarItem对应的Controller  自定义类型下可以为 nil
 @param title                 tabBarItem的title描述
 @param normalImageName       普通状态下tabBarItem的图片
 @param selectedImageName     选中状态下tabBarItem的图片
 @param tabBarItemType        tabBarItem类型 是自定义还是弹出控制器
 */
- (void)tabBarItemWithControllerIndes:(NSInteger)controllerIndex
                 controller:(UIViewController *)controller
                      title:(NSString *)title
            normalImageName:(NSString *)normalImageName
          selectedImageName:(NSString *)selectedImageName
                       tabBarItemType:(TMBaseTabBarItemType)tabBarItemType
                  withCustomItemBlock:(void(^)())itemsClick;


/**
 TMBaseTabBarItemType 点击自定义中间按钮方法
 */
- (void)baseTabBarDidSelectedCustomButton;

@end
