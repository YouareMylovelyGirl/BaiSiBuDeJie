//
//  YGEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceViewController.h"
#import "YGTitleButton.h"

@interface YGEssenceViewController ()
/** 标题栏视图 */
@property(nonatomic, strong) UIView *titleView;
/** 上一个点击的标题按钮 */
@property(nonatomic, strong) YGTitleButton *previousClickedTitleButton;


@end

@implementation YGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YGRandomColor;
    //设置导航条
    [self setupNavBar];
    
    [self setupScrollView];
    
    [self setupTitleView];
    
}

#pragma mark - 设置
- (void)setupNavBar {
    //快速创建导航条左右item
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"nav_item_game_icon"] hightLightImage:[UIImage imageNamed:@"nav_item_game_click_icon"] target:self action:@selector(game)];
    //titleView 用来设置 中间图片
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    //设置右边导航条按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"navigationButtonRandom"] hightLightImage:[UIImage imageNamed:@"navigationButtonRandomClick"] target:self action:@selector(random)];
    
}

//设置滚动视图
- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
}
//设置标题
- (void)setupTitleView {
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 35)];
    self.titleView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    [self.view addSubview:self.titleView];
    
    //标题栏按钮
    [self setupTitleButton];
    //标题栏下划线
}

- (void)setupTitleButton {
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    
    CGFloat titleButtonW = self.titleView.width / count;
    CGFloat titleButtonH = self.titleView.height;
    
    for (NSInteger i = 0; i < count; i++) {
        YGTitleButton *titleBtn = [[YGTitleButton alloc] init];
        
//        [titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [self.titleView addSubview:titleBtn];
        titleBtn.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        [titleBtn setTitle:titles[i] forState:UIControlStateNormal];
        [titleBtn addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}
//监听按钮点击
- (void)titleButtonClick:(YGTitleButton *)titleButton {
    //让之前按钮变回原来颜色
    self.previousClickedTitleButton.selected = NO;
    //现在点的变成原来的按钮
    titleButton.selected = YES;
    //给新的按钮赋值
    self.previousClickedTitleButton = titleButton;
    NSLog(@"%s", __func__);
}



#pragma mark - 导航条设置

//左边游戏
- (void)game {
    NSLog(@"%s", __func__);
}
//右边随机
- (void)random {
    NSLog(@"%s", __func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
