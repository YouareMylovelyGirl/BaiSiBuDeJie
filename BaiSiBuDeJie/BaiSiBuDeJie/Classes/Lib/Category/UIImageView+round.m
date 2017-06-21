//
//  UIImageView+round.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "UIImageView+round.h"

@implementation UIImageView (round)
#pragma mark - 选择－设置圆形图像

- (void)setHeader:(NSString *)url
{
    [self setCircleHeader:url];
}


#pragma mark - 矩形图像

- (void)setRectHeader:(NSString *)url
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

#pragma mark - 圆形图像

- (void)setCircleHeader:(NSString *)url
{
    __weak typeof(self) weakSelf = self;
    UIImage *placeholder = [[UIImage imageNamed:@"defaultUserIcon"] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:
     ^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
         // 如果图片下载失败，就不做任何处理，按照默认的做法：会显示占位图片
         if (image == nil) return;
         
         weakSelf.image = [image circleImage];
     }];
}
@end
