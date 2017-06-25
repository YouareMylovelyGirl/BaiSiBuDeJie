//
//  YGEssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGEssenceViewController.h"
#import "YGTitleButton.h"
#import "YGAllViewController.h"
#import "YGVoiceViewController.h"
#import "YGVideoViewController.h"
#import "YGPictureViewController.h"
#import "YGWordViewController.h"



@interface YGEssenceViewController ()
/** 标题栏视图 */
@property(nonatomic, strong) UIView *titleView;
/** 上一个点击的标题按钮 */
@property(nonatomic, strong) YGTitleButton *previousClickedTitleButton;
/** 下划线 */
@property(nonatomic, strong) UIView *titleUnderLine;



@end

@implementation YGEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = YGRandomColor;
    
    //初始化自控制器
    [self setupAllChildController];
    
    //设置导航条
    [self setupNavBar];
    
    [self setupScrollView];
    
    [self setupTitleView];
    
}

#pragma mark - 设置
- (void)setupAllChildController {
    [self addChildViewController:[[YGAllViewController alloc] init]];
    [self addChildViewController:[[YGVideoViewController alloc] init]];
    [self addChildViewController:[[YGVoiceViewController alloc] init]];
    [self addChildViewController:[[YGPictureViewController alloc] init]];
    [self addChildViewController:[[YGWordViewController alloc] init]];
}

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
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = scrollView.width;
    CGFloat scrollViewH = scrollView.height;
    
    for (NSUInteger i = 0; i < count; i++) {
        
        UIView *chileView = self.childViewControllers[i].view;
        chileView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        chileView.backgroundColor = YGRandomColor;
        [scrollView addSubview:chileView];
    }
    scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
    
}
//设置标题
- (void)setupTitleView {
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 35)];
    self.titleView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.7];
    [self.view addSubview:self.titleView];
    
    //标题栏按钮
    [self setupTitleButton];
    //标题栏下划线
    [self setupTitleUnderLine];
}

//标题栏下划线
- (void)setupTitleUnderLine {
    //标题按钮
    YGTitleButton *firstButton = self.titleView.subviews.firstObject;
    
    UIView *underLine = [[UIView alloc] init];
    underLine.height = 1;
    underLine.bottom = self.titleView.height;
    underLine.backgroundColor = [firstButton titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:underLine];
    self.titleUnderLine = underLine;

    firstButton.selected = YES;
    self.previousClickedTitleButton = firstButton;
    NSLog(@"%s", __func__);
    
    NSString *currentTitle = [firstButton titleForState:UIControlStateNormal];
    //获取一段文字宽高, 使用sizeWithAttributes
    self.titleUnderLine.width = [currentTitle sizeWithAttributes:@{NSFontAttributeName: firstButton.titleLabel.font}].width + 10;
    self.titleUnderLine.centerX = firstButton.centerX;

    [firstButton.titleLabel sizeToFit];
    
}

//标题栏按钮
- (void)setupTitleButton {
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    NSUInteger count = titles.count;
    
    CGFloat titleButtonW = self.titleView.width / count;
    CGFloat titleButtonH = self.titleView.height;
    
    for (NSInteger i = 0; i < count; i++) {
        YGTitleButton *titleBtn = [[YGTitleButton alloc] init];
        titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        
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
    //控制标题底部线条移动
    [UIView animateWithDuration:0.25 animations:^{
        NSString *currentTitle = [titleButton titleForState:UIControlStateNormal];
        //获取一段文字宽高, 使用sizeWithAttributes
        self.titleUnderLine.width = [currentTitle sizeWithAttributes:@{NSFontAttributeName: titleButton.titleLabel.font}].width + 10;
        self.titleUnderLine.centerX = titleButton.centerX;
    }];
    
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
