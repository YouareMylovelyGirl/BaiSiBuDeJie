//
//  YGLoginViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGLoginViewController.h"
#import "YGLoginRegisterMiddleView.h"
#import "YGThirdBoardLoginView.h"

@interface YGLoginViewController ()
@property (weak, nonatomic) IBOutlet UIView *middleView;
//中间视图距离左边约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *middleLeftConstraint;
/** 登录视图 */
@property(nonatomic, strong) YGLoginRegisterMiddleView *middleLoginView;
/** 注册视图 */
@property(nonatomic, strong) YGLoginRegisterMiddleView *middleRegisterView;
/** 底部登录视图 */
@property (weak, nonatomic) IBOutlet UIView *bottomLoginView;
/** 底部三方登录视图 */
@property(nonatomic, strong) YGThirdBoardLoginView *thirdView;



@end

@implementation YGLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMiddleViewUI];
    [self setupBottomViewUI];
}

- (void)setupBottomViewUI {
    self.thirdView = [YGThirdBoardLoginView thirdBoardLogin];
    [self.bottomLoginView addSubview:self.thirdView];
}

//添加中间输入视图
- (void)setupMiddleViewUI {
    //如果子视图超出父视图范围, 自视图将不能响应
    //登录界面
    self.middleLoginView = [YGLoginRegisterMiddleView loginMiddleView];

    [self.middleView addSubview:self.middleLoginView];
    
    //注册界面
    self.middleRegisterView = [YGLoginRegisterMiddleView registerMiddleView];

    [self.middleView addSubview:self.middleRegisterView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//点击退出按钮
- (IBAction)dismissLoginView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
//点击注册按钮
- (IBAction)registerButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.isSelected) {
        self.middleLeftConstraint.constant = -YGScreenW;
        [UIView animateWithDuration:0.2 animations:^{
            //如果做布局, 需要layoutifneed
            [self.view layoutIfNeeded];
        }];
    } else {
        self.middleLeftConstraint.constant = YGScreenW;
        [UIView animateWithDuration:0.2 animations:^{
            //如果做布局, 需要layoutifneed
            [self.view layoutIfNeeded];
        }];
    }
    
}


/**
 这个方法里面, 才会根据局部调整控件的尺寸
 */
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    //在控制器中设置frame的时候  一定要在viewDidlayoutSubViews中设置
    //登录位置
    CGRect middleLoginFrame = self.middleLoginView.frame;
    middleLoginFrame.size.width = YGScreenW;
    self.middleLoginView.frame = middleLoginFrame;
    
    // 注册位置
    CGRect middleRegisterFrame = self.middleRegisterView.frame;
    middleRegisterFrame.size.width = YGScreenW;
    middleRegisterFrame.origin.x = YGScreenW;
    self.middleRegisterView.frame = middleRegisterFrame;
    
    //底部三方登录view
    CGRect bottomLoginFrame = self.thirdView.frame;
    bottomLoginFrame.size.width = YGScreenW;
    self.thirdView.frame = bottomLoginFrame;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
