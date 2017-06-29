//
//  YGNetManager.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGNetManager.h"

@implementation YGNetManager
+ (id)GetADItemCompletionHandler:(void (^)(YGADItem *, NSError *))completionHandler {
    NSString *adStr = @"http://mobads.baidu.com/cpro/ui/mads.php?code2=phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam";
    return [self GET:adStr param:nil completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGADItem Parse:obj], error);
    }];
}

+ (id)GetRecommendConpletionHandler:(void (^)(NSArray<YGRecommendItem *> *, NSError *))completionHandler {
    NSString *recommendStr = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *param = @{
                            @"a": @"tag_recommend",
                            @"action": @"sub",
                            @"c": @"topic"
                            };
    
    return [self GET:recommendStr param:param completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGRecommendItem Parse:obj], error);
    }];
}


+ (id)GetSquareItemCompletionHandler:(void (^)(YGSquareItem *, NSError *))completionHandler {
    NSString *squareStr = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *param = @{
                            @"a": @"square",
                            @"c": @"topic"
                            };
    return [self GET:squareStr param:param completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGSquareItem Parse:obj], error);
    }];
}

+ (id)GetEssenceAllWithType:(NSInteger)type maxTime:(NSString *)maxTime completionHandler:(void (^)(YGEssenceItem *, NSError *))completionHandler{
    NSString *essenceAll = @"http://api.budejie.com/api/api_open.php";
    NSDictionary *param = @{
                            @"a": @"list",
                            @"c": @"data",
                            @"maxtime": maxTime,
                            @"type": @(type)
                            };
    
    return [self GET:essenceAll param:param completionHandler:^(id obj, NSError *error) {
        !completionHandler ?: completionHandler([YGEssenceItem Parse:obj], error);
    }];
}
@end
