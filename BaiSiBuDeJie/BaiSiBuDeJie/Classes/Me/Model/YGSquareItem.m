//
//  YGSquareItem.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGSquareItem.h"

@implementation YGSquareItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"tag_list": @"YGSquareTag_ListItem",
             @"square_list": @"YGSquareSquare_ListItem"
             };
}
@end
@implementation YGSquareTag_ListItem

@end


@implementation YGSquareSquare_ListItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID": @"id"
             };
}
@end


