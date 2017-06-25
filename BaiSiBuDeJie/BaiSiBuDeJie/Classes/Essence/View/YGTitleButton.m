//
//  YGTitleButton.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGTitleButton.h"

@implementation YGTitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    // 只要重写了这个方法, 按钮就无法进入hightlight状态
}

@end
