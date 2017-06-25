//
//  TMBaseTabBar.m
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "TMBaseTabBar.h"
#import "TMBaseTabBarItems.h"

#define IndexTag    12580

//屏幕宽
#define TMScreenW   [[UIScreen mainScreen] bounds].size.width
//屏幕高
#define TMScreenH   [[UIScreen mainScreen] bounds].size.height



@implementation TMBaseTabBar

#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configTMBaseTabBar];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configTMBaseTabBar];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

        [self configTMBaseTabBar];
    }
    return self;
}

#pragma mark - 配置TMBaseTabBar
- (void)configTMBaseTabBar
{
//    self.backgroundColor = [UIColor colorWithRed:247.0 / 255 green:247.0 / 255 blue:247.0 / 255 alpha:1];
    
    //添加阴影
//    self.layer.shadowRadius = 1.0f;
//    self.layer.shadowColor = [UIColor blackColor].CGColor;
//    self.layer.shadowOpacity = 0.1;
    
    self.itemsCount = 5;
}

#pragma mark - 重写setter方法
- (void)setTabBarItems:(NSArray *)tabBarItems
{
    _tabBarItems = tabBarItems;
    NSInteger itemTag = IndexTag;
    for (id item in tabBarItems)
    {
        if ([item isKindOfClass:[TMBaseTabBarItems class]])
        {

            [((TMBaseTabBarItems *)item) addTarget:self
                                            action:@selector(itemSelected:)
                                  forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:item];
            //如果不是自定义就标记加1
            if (((TMBaseTabBarItems *)item).tabBarItemType != kTMBaseTabBarItemCustom) {
                //第IndexTag默认选中
                if (itemTag == (IndexTag))
                {
                    ((TMBaseTabBarItems *)item).selected = YES;
                }
                
                ((TMBaseTabBarItems *)item).tag = itemTag;
                itemTag ++;
            }
        }
    }
}

#pragma mark - 点击按钮执行方法
- (void)itemSelected:(TMBaseTabBarItems *)sender
{
    //如果不是自定义就将选中按钮的tag赋值
    if (sender.tabBarItemType != kTMBaseTabBarItemCustom)
    {
        [self setSelectedIndex:sender.tag - IndexTag];
    }
}

#pragma mark - 设定选中第几个按钮
- (void)setSelectedIndex:(NSInteger)index
{
    //根据Tag值判断按钮是否选中
    for (TMBaseTabBarItems *item in self.tabBarItems) {
        if (item.tag - IndexTag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
    //根据index的值切换tabBarController的SelectedIndex
    UITabBarController *tabBarController = (UITabBarController *)self.delegate;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
    }
    
}
- (void)setTabbarSelectedIndex:(NSInteger)index
{
    //根据Tag值判断按钮是否选中
    for (TMBaseTabBarItems *item in self.tabBarItems) {
        if (item.tag - IndexTag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
