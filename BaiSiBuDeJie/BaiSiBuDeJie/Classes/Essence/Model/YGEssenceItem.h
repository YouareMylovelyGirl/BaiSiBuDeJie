//
//  YGEssenceItem.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/29.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGEssenceInfoItem,YGEssenceListItem;
@interface YGEssenceItem : NSObject

@property (nonatomic, strong) YGEssenceInfoItem *info;

@property (nonatomic, strong) NSArray<YGEssenceListItem *> *list;

@end
@interface YGEssenceInfoItem : NSObject

@property (nonatomic, copy) NSString *maxid;

@property (nonatomic, copy) NSString *vendor;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, copy) NSString *maxtime;

@property (nonatomic, assign) NSInteger page;

@end

@interface YGEssenceListItem : NSObject

@property (nonatomic, assign) NSInteger cache_version;

@property (nonatomic, copy) NSString *created_at;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *is_gif;

@property (nonatomic, copy) NSString *voicetime;

@property (nonatomic, copy) NSString *image2;

@property (nonatomic, copy) NSString *voicelength;

@property (nonatomic, strong) NSArray *top_cmt;

@property (nonatomic, copy) NSString *playfcount;

/**
 转发
 */
@property (nonatomic, copy) NSString *repost;

@property (nonatomic, copy) NSString *bimageuri;

@property (nonatomic, copy) NSString *image1;

/**
 评论文字
 */
@property (nonatomic, copy) NSString *text;

@property (nonatomic, copy) NSString *theme_type;

@property (nonatomic, copy) NSString *hate;

/**
 中间的图片
 */
@property (nonatomic, copy) NSString *image0;

/**
 评论
 */
@property (nonatomic, copy) NSString *comment;

/**
 审核通过时间
 */
@property (nonatomic, copy) NSString *passtime;

/**
 顶
 */
@property (nonatomic, copy) NSString *ding;

@property (nonatomic, copy) NSString *type;

/**
 播放数量
 */
@property (nonatomic, copy) NSString *playcount;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, copy) NSString *cdn_img;

@property (nonatomic, copy) NSString *theme_name;

@property (nonatomic, copy) NSString *create_time;

@property (nonatomic, copy) NSString *favourite;

@property (nonatomic, strong) NSArray *themes;

/**
 用户名字
 */
@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *height;

@property (nonatomic, copy) NSString *status;

@property (nonatomic, copy) NSString *videotime;

@property (nonatomic, copy) NSString *bookmark;

/**
 踩
 */
@property (nonatomic, copy) NSString *cai;

/**
 用户名字
 */
@property (nonatomic, copy) NSString *screen_name;

/**
 头像
 */
@property (nonatomic, copy) NSString *profile_image;

@property (nonatomic, copy) NSString *love;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *theme_id;

@property (nonatomic, copy) NSString *original_pid;

@property (nonatomic, assign) NSInteger t;

@property (nonatomic, copy) NSString *image_small;

@property (nonatomic, copy) NSString *weixin_url;

@property (nonatomic, copy) NSString *voiceuri;

@property (nonatomic, copy) NSString *videouri;

@property (nonatomic, copy) NSString *width;

@end

