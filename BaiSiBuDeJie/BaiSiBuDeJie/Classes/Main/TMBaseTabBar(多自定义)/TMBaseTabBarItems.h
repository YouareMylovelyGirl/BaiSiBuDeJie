//
//  TMBaseTabBarItems.h
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSInteger, TMBaseTabBarItemType) {
    kTMBaseTabBarItemNormal = 0, // 正常状态按钮
    kTMBaseTabBarItemCustom      //自定义事件按钮
};

@interface TMBaseTabBarItems : UIButton

/** 标题距离底部高度  */
@property(nonatomic, assign) CGFloat itemTitleToBottom;

/** 标题距离图片之间的距离  */
@property(nonatomic, assign) CGFloat titleToImageViewMargin;

/** 按钮类型 */
@property(nonatomic, assign) TMBaseTabBarItemType tabBarItemType;

/** 自定义时候 图片与label之间的空隙  */
@property(nonatomic, assign) CGFloat imageAndlabelMargin;

/** 正常状态下字体大小 默认10 */
@property(nonatomic, assign) CGFloat fontSize;

/** 正常状态下字体正常颜色 */
@property(nonatomic, strong) UIColor *normalTitleNormalColor;

/** 正常状态下字体选中颜色 */
@property(nonatomic, strong) UIColor *normalTitleSelectesColor;

/** 自定义状态下字体正常颜色 */
@property(nonatomic, strong) UIColor *customTitlwNormalColor;

/** 点击按钮后的回调 */
@property(nonatomic, strong) void(^clickItems)();


@end
