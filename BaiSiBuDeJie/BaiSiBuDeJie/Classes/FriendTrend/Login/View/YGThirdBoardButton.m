//
//  YGThirdBoardButton.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGThirdBoardButton.h"

@implementation YGThirdBoardButton


/**
 调整内部子控件布局
 这时候位置已经设置好了, 只需要设置位置就好了
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    //设置图片位置
    CGRect imageFrame = self.imageView.frame;
    imageFrame.origin.y = 0;
    imageFrame.origin.x = self.frame.size.width / 2 - self.imageView.frame.size.width / 2;
    self.imageView.frame = imageFrame;
    //设置标题位置
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.y = self.frame.size.height - self.titleLabel.frame.size.height;
    [self.titleLabel sizeToFit];
    titleFrame.origin.x = self.frame.size.width / 2 - self.titleLabel.frame.size.width / 2;
    self.titleLabel.frame = titleFrame;
    
    
    //YYKit 中 add分类
//    self.imageView.top = 0;
//    self.imageView.centerX = self.width * 0.5;
//    
//    self.titleLabel.top = self.height - self.titleLabel.height;
//    //文字需要自适应  - 这里sizeToFit底层可能会修改center, 可以先设置好以后, 再去修改center
//    [self.titleLabel sizeToFit];
//
//    self.titleLabel.centerX = self.width * 0.5;
    
    
}

@end
