//
//  YGSquareItem.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGSquareTag_ListItem,YGSquareSquare_ListItem;
@interface YGSquareItem : NSObject

@property (nonatomic, strong) NSArray<YGSquareTag_ListItem *> *tag_list;

@property (nonatomic, strong) NSArray<YGSquareSquare_ListItem *> *square_list;

@end
@interface YGSquareTag_ListItem : NSObject

@property (nonatomic, copy) NSString *theme_id;

@property (nonatomic, copy) NSString *theme_name;

@end

@interface YGSquareSquare_ListItem : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *android;

@property (nonatomic, copy) NSString *iphone;
//id -> ID
@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *market;

@property (nonatomic, copy) NSString *ipad;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@end

