//
//  YGSquareCell.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YGSquareItem.h"
@interface YGSquareCell : UICollectionViewCell
/** 方块模型 */
@property(nonatomic, strong) YGSquareSquare_ListItem *squareList;

+ (instancetype)itemForCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;

@end
