//
//  TMBaseTabBarItems.m
//  TMCustomTabBar
//
//  Created by 阳光 on 2017/4/7.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "TMBaseTabBarItems.h"

@implementation TMBaseTabBarItems

#pragma mark - 构造方法
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self configImageContentMode];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configImageContentMode];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self configImageContentMode];
    }
    return self;
}

#pragma mark - 配置图片模式
- (void)configImageContentMode
{
    self.itemTitleToBottom = 0;
    //系统按钮
    self.titleToImageViewMargin = 5;
    //自定义
    self.imageAndlabelMargin = 7;
    self.normalTitleNormalColor = [UIColor grayColor];
    self.normalTitleSelectesColor = [UIColor blueColor];
    self.customTitlwNormalColor = [UIColor cyanColor];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}

#pragma mark - 位置布局
- (void)layoutSubviews
{
    [super layoutSubviews];
    //获取文字尺寸
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    if (imageSize.width != 0 && imageSize.height != 0)
    {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - self.titleToImageViewMargin - titleSize.height - imageSize.height / 2 - self.imageAndlabelMargin;
        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        
        //当为自定义时候
        if (self.tabBarItemType == kTMBaseTabBarItemCustom) {
            [self setTitleColor:self.customTitlwNormalColor forState:UIControlStateNormal];
        } else {
            [self setTitleColor:self.normalTitleNormalColor forState:UIControlStateNormal];
            [self setTitleColor:self.normalTitleSelectesColor forState:UIControlStateSelected];
        }
    }
    else
    {
        CGPoint imageViewCenter = self.imageView.center;
        imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        self.imageView.center = imageViewCenter;
    }
    

    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - self.itemTitleToBottom - titleSize.height / 2);

    self.titleLabel.center = labelCenter;

}



#pragma mark - 图片去除高亮
- (void)setHighlighted:(BOOL)highlighted
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
