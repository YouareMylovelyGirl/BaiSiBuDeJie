//
//  YGNetManager.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "BaseNetManager.h"
#import "YGADItem.h"
@interface YGNetManager : BaseNetManager
//广告请求数据
+ (id)GetADItemCompletionHandler:(void(^)(YGADItem *adItem, NSError *error))completionHandler;
@end
