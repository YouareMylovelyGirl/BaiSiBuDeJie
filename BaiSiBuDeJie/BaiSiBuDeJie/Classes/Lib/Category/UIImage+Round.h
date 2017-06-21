//
//  UIImage+Round.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Round)
/**
 * 返回一张圆形图片 (推荐使用)
 */
- (instancetype)circleImage;

/**
 * 返回一张圆形图片
 */
+ (instancetype)circleImageNamed:(NSString *)name;
@end
