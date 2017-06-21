//
//  YGLoginRegisterMiddleView.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGLoginRegisterMiddleView.h"

@interface YGLoginRegisterMiddleView ()
@property (weak, nonatomic) IBOutlet UIButton *loginRegisterButton;

@end

@implementation YGLoginRegisterMiddleView

+ (instancetype)loginMiddleView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] firstObject];
}


+ (instancetype)registerMiddleView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}


- (void)awakeFromNib {
    //让按钮背景图片不要被拉伸
    [super awakeFromNib];
    UIImage *image = _loginRegisterButton.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [_loginRegisterButton setBackgroundImage:image forState:UIControlStateNormal];
}
@end
