//
//  YGRecommendCell.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGRecommendItem.h"
@interface YGRecommendCell : UITableViewCell
/** 推荐模型 */
@property(nonatomic, strong) YGRecommendItem *recommendItem;

+ (instancetype)cellForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end
