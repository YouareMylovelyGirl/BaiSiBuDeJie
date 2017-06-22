//
//  YGSquareCell.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGSquareCell.h"

static NSString * const ID = @"cell";

@interface YGSquareCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconIV;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation YGSquareCell

- (void)setSquareList:(YGSquareSquare_ListItem *)squareList {
    _squareList = squareList;
    [self.iconIV sd_setImageWithURL:squareList.icon.yg_URL];
    _nameLabel.text = squareList.name;
}

+ (instancetype)itemForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath {
    YGSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    return cell;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

@end
