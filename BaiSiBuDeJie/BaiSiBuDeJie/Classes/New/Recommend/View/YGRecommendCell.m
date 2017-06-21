//
//  YGRecommendCell.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGRecommendCell.h"

@interface YGRecommendCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation YGRecommendCell

- (void)setRecommendItem:(YGRecommendItem *)recommendItem {
    _recommendItem = recommendItem;
    //使用设置图片圆角分类
    [_iconIV setHeader:recommendItem.image_list];
    _nameLabel.text = recommendItem.theme_name;
    [self resloveNum];
    
}
//处理订阅数字
- (void)resloveNum {
    NSString *numStr = [NSString stringWithFormat:@"%@人订阅", _recommendItem.sub_number];
    NSInteger num = _recommendItem.sub_number.integerValue;
    if (num > 10000) {
        CGFloat numF = num / 10000.0;
        numStr = [NSString stringWithFormat:@"%.1f万人订阅", numF];
        //替换.0
        numStr = [numStr stringByReplacingOccurrencesOfString:@".0" withString:@""];
    }
    _detailLabel.text = numStr;

}

+ (instancetype)cellForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    YGRecommendCell *recommendCell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //设置cell没有点击状态
    [recommendCell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return recommendCell;
}

//从xib加载就会调用  只会调用一次
- (void)awakeFromNib {
    [super awakeFromNib];
    //处理cell的分割线 - 调整分割线距离
    self.separatorInset = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//订阅按钮点击
- (IBAction)subscriberButtonClick:(id)sender {
    
}

@end
