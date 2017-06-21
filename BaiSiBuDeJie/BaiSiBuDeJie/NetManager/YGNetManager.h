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
@interface YGNetManager : BaseNetManager
//广告请求数据
+ (id)GetADItemCompletionHandler:(void(^)(YGADItem *adItem, NSError *error))completionHandler;
//新帖中的推荐
+ (id)GetRecommendConpletionHandler:(void(^)(NSArray<YGRecommendItem *> *obj, NSError *error))completionHandler;
@end
