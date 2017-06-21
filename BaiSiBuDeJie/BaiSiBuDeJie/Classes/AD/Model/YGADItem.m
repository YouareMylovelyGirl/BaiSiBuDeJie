//
//  YGADItem.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGADItem.h"

@implementation YGADItem
+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass {
    return @{
             @"ad": @"YGADAdItem"
             };
}
@end
@implementation YGADExp2Item

@end


@implementation YGADExp2E61Item

@end


@implementation YGADAdItem
+ (NSDictionary<NSString *,id> *)modelCustomPropertyMapper {
    return @{
             @"ID": @"id"
             };
}
@end


@implementation YGADAdExp2Item

@end


@implementation YGADAdExp2E62Item

@end


