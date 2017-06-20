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
    contentView.backgroundColor = [UIColor clearColor];
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
    contentView.backgroundColor = [UIColor clearColor];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}

+ (instancetype)itemButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)hightLiightColor target:(id)target action:(SEL)action NormalReturnPic:(UIImage *)normalReturnImage highLightImage:(UIImage *)highLightReturnImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:normalColor forState:UIControlStateNormal];
    [btn setTitleColor:hightLiightColor forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn setImage:normalReturnImage forState:UIControlStateNormal];
    [btn setImage:highLightReturnImage forState:UIControlStateHighlighted];
    //这个属性正数是往里面挤
    btn.contentEdgeInsets = UIEdgeInsetsMake(0, -13, 0, 13);
    
    [btn sizeToFit];
    
    
    //如果不用view包一下, tabBarItem点击范围会变大
    UIView *contentView = [[UIView alloc] initWithFrame:btn.bounds];
    contentView.backgroundColor = [UIColor clearColor];
    [contentView addSubview:btn];
    
    return [[UIBarButtonItem alloc] initWithCustomView:contentView];
}
@end
