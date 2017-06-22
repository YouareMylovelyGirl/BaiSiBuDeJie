//
//  UITextField+placeholder.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UITextField+placeholder.h"
#import <objc/message.h>
@implementation UITextField (placeholder)
/*
 交换方法: 只需要交换一次
 load方法
 */
+ (void)load {
    //拿到系统的placeholder
    Method setPlaceholderMethod = class_getInstanceMethod(self, @selector(setPlaceholder:));
    //拿到自己写的
    Method setYG_placeholderMethod = class_getInstanceMethod(self, @selector(setYG_Placeholder:));
    //我日, 黑魔法!开始
    method_exchangeImplementations(setPlaceholderMethod, setYG_placeholderMethod);
}


- (void)setPlaceholderColor:(UIColor *)placeholderColor {
    
    //给成员属性赋值, runtime给系统的类添加成员变量
    /*
     1. 给哪个对象添加
     2. 哪个属性
     3. 添加什么值
     4. 什么策略
     用什么策略, 把什么值, 保存在哪个对象, 的什么属性里面

     希望做到: 每次设置站位文字后, 在拿到之前保存占位文字, 重新设置
     */
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UILabel *placeholderLable =  [self valueForKey:@"placeholderLabel"];
    placeholderLable.textColor = placeholderColor;
}

- (UIColor *)placeholderColor {
    return objc_getAssociatedObject(self, @"placeholderColor");
}


/*
 交换方法: 
 1 需要设置占位文字,  设置占位文字颜色
 */
- (void)setYG_Placeholder:(NSString *)placeholder {
    //交换方法后 需要调用这个
    [self setYG_Placeholder:placeholder];
    self.placeholderColor = self.placeholderColor;
}



/*
 0. 先导入头文件
 1. 使用关联方法, 将值保存在属性中
 2. 在需要的地点, 时机再取出保存的值
 3. 在分类中加载一次 使用load方法
 4. 可以使用交换方法交换系统方法实现
 */
@end
