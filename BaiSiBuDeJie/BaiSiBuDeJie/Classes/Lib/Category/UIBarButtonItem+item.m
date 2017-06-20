//
//  UIBarButtonItem+item.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UIBarButtonItem+item.h"

@implementation UIBarButtonItem (item)
+ (instancetype)itemButtonWithNormalImage:(UIImage *)normalImage hightLightImage:(UIImage *)hightLightImage target:(id)target action:(SEL)action {
     UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:hightLightImage forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //如果不用view包一下, tabBarItem点击范围会变大
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];

    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}

+ (instancetype)itemButtonWithNormalImage:(UIImage *)normalImage selected:(UIImage *)selectedImage target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:normalImage forState:UIControlStateNormal];
    [btn setImage:selectedImage forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //如果不用view包一下, tabBarItem点击范围会变大
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}
@end
