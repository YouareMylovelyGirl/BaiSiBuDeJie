//
//  YGRecommendItem.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YGRecommendItem : NSObject

@property (nonatomic, copy) NSString *image_list;

@property (nonatomic, copy) NSString *theme_id;

@property (nonatomic, copy) NSString *theme_name;

@property (nonatomic, assign) NSInteger is_sub;

@property (nonatomic, assign) NSInteger is_default;

@property (nonatomic, copy) NSString *sub_number;

@end

