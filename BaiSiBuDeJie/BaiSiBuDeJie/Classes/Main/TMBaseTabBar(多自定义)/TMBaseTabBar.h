//
//  TMBaseTabBar.h
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>



@class TMBaseTabBar;

@protocol TMBaseTabBarDelegate <NSObject>


@end



@interface TMBaseTabBar : UIView



/** 有多少个items */
@property(nonatomic, assign) NSInteger itemsCount;
/** tabBar的背景颜色 */
@property(nonatomic, strong) UIColor *tabBarBackGroundColor;


/** tabBar上面的按钮 */
@property(nonatomic, strong) NSArray *tabBarItems;

/** 代理 */
@property(nonatomic, strong) id<TMBaseTabBarDelegate> delegate;


- (void)setTabbarSelectedIndex:(NSInteger)index;

@end
