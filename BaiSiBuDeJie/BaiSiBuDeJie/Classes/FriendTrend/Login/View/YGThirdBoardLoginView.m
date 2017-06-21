//
//  YGThirdBoardLoginView.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGThirdBoardLoginView.h"

@implementation YGThirdBoardLoginView

+ (instancetype)thirdBoardLogin {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}

@end
