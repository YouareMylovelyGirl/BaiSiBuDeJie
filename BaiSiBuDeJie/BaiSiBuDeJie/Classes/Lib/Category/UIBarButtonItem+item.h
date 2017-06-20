//
//  UIBarButtonItem+item.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (item)
//快速创建UIBarButtonItem

/**
 快速创建导航条按钮 (高亮)

 @param normalImage 正常状态下按钮图片
 @param hightLightImage 高亮状态下按钮图片
 @param target 谁来执行代理
 @param action 方法
 @return UIBarButtonItem
 */
+ (instancetype)itemButtonWithNormalImage:(UIImage *)normalImage hightLightImage:(UIImage *)hightLightImage target:(id)target action:(SEL)action;

/**
 快速创建导航条按钮 (选中)
 
 @param normalImage 正常状态下按钮图片
 @param selectedImage 选中状态下按钮图片
 @param target 谁来执行代理
 @param action 方法
 @return UIBarButtonItem
 */
+ (instancetype)itemButtonWithNormalImage:(UIImage *)normalImage selected:(UIImage *)selectedImage target:(id)target action:(SEL)action;


/**
 返回为文字时

 @param title 返回标题
 @param fontSize 字体大小
 @param normalColor 正常点击颜色
 @param hightLiightColor 高亮时颜色
 @param target 代理
 @param action 方法
 @return UIBarButtonItem
 */
+ (instancetype)itemButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor highLightColor:(UIColor *)hightLiightColor target:(id)target action:(SEL)action NormalReturnPic:(UIImage *)normalReturnImage highLightImage:(UIImage *)highLightReturnImage;
@end
