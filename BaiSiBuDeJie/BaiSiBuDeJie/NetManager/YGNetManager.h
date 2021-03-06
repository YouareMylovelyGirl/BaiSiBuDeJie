//
//  YGNetManager.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "YGADItem.h"
#import "YGRecommendItem.h"
#import "YGSquareItem.h"
#import "YGEssenceItem.h"
@interface YGNetManager : BaseNetManager
//广告请求数据
+ (id)GetADItemCompletionHandler:(void(^)(YGADItem *adItem, NSError *error))completionHandler;
//新帖中的推荐
+ (id)GetRecommendConpletionHandler:(void(^)(NSArray<YGRecommendItem *> *obj, NSError *error))completionHandler;
//设置九宫格数据
+ (id)GetSquareItemCompletionHandler:(void(^)(YGSquareItem *squareItem, NSError *error))completionHandler;
//精华模块 -- 全部
+ (id)GetEssenceAllWithType:(NSInteger)type maxTime:(NSString *)maxTime completionHandler:(void(^)(YGEssenceItem *essenceAllItem, NSError *error))completionHandler;
@end
