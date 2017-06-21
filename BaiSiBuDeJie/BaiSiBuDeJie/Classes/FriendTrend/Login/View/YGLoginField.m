//
//  YGLoginField.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGLoginField.h"

@implementation YGLoginField

/*
 TODO:
 1. 文本框光标变成白色
 2. 文本框占位视图点击后变成白色
 */
- (void)awakeFromNib {
    [super awakeFromNib];
    //设置光标颜色
    self.tintColor = [UIColor whiteColor];
    
    //监听文本框编辑
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
    //设置一个初始颜色
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

//开始编辑
- (void)textBegin {
    // 设置占位文字变成白色
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
}
//结束编辑
- (void)textEnd {
    // 设置占位文字变成原色
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: [UIColor lightGrayColor]}];
}

@end
