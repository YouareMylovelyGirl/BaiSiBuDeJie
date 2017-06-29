//
//  YGEssenceItem.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/29.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceItem.h"

@implementation YGEssenceItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"list": @"YGEssenceListItem"
             };
}
@end

@implementation YGEssenceInfoItem

@end


@implementation YGEssenceListItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"id": @"ID"
             };
}
@end


