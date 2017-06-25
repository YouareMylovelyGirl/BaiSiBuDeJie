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



@interface YGEssenceViewController ()<UIScrollViewDelegate>
/** 标题栏视图 */
@property(nonatomic, strong) UIView *titleView;
/** 上一个点击的标题按钮 */
@property(nonatomic, strong) YGTitleButton *previousClickedTitleButton;
/** 下划线 */
@property(nonatomic, strong) UIView *titleUnderLine;
/** 用于存放所有自控制器的 */
@property(nonatomic, strong) UIScrollView *scrollView;



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
    scrollView.delegate = self;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = [UIColor greenColor];
    scrollView.frame = self.view.bounds;
    //点击状态栏不会滚动到最顶部
    scrollView.scrollsToTop = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    NSUInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = scrollView.width;
//    CGFloat scrollViewH = scrollView.height;
//
//    for (NSUInteger i = 0; i < count; i++) {
//        
//        UIView *chileView = self.childViewControllers[i].view;
//        chileView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
//        chileView.backgroundColor = YGRandomColor;
//        [scrollView addSubview:chileView];
//    }
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

    
//    NSLog(@"%s", __func__);
    
    NSString *currentTitle = [firstButton titleForState:UIControlStateNormal];
    //获取一段文字宽高, 使用sizeWithAttributes
    self.titleUnderLine.width = [currentTitle sizeWithAttributes:@{NSFontAttributeName: firstButton.titleLabel.font}].width + 10;
    self.titleUnderLine.centerX = firstButton.centerX;

    [firstButton.titleLabel sizeToFit];
    
    //默认选中第一个按钮
    firstButton.selected = YES;
    self.previousClickedTitleButton = firstButton;
    
    //添加第0个控制器
    [self addChildViewIntoScrollView:0];
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
    //相当于重复点击了
    if (self.previousClickedTitleButton == titleButton) {
        //发动重复点击通知
        [[NSNotificationCenter defaultCenter] postNotificationName:YGTitleButtonDidRepeatClickedNotifecation object:nil];
    }
    
    //滚动scrollView到标题按钮对应的控制器view ---- 也可以给tag赋值
    NSUInteger index = [self.titleView.subviews indexOfObject:titleButton];
    
    //让之前按钮变回原来颜色
    self.previousClickedTitleButton.selected = NO;
    //现在点的变成原来的按钮
    titleButton.selected = YES;
    //给新的按钮赋值
    self.previousClickedTitleButton = titleButton;
//    NSLog(@"%s", __func__);
    
    
    //控制标题底部线条移动
    [UIView animateWithDuration:0.25 animations:^{
        NSString *currentTitle = [titleButton titleForState:UIControlStateNormal];
        //获取一段文字宽高, 使用sizeWithAttributes
        self.titleUnderLine.width = [currentTitle sizeWithAttributes:@{NSFontAttributeName: titleButton.titleLabel.font}].width + 10;
        self.titleUnderLine.centerX = titleButton.centerX;

        CGFloat offsetX = self.scrollView.width * index;
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
    } completion:^(BOOL finished) {
        //显示第索引个控制器view
        [self addChildViewIntoScrollView:index];
    }];
    
    //设置index位置对应的tableView.ScrollToTop为yes, 其他设置为no
    for (NSUInteger i = 0; i < self.childViewControllers.count; i++) {
        UIViewController *chileVC = self.childViewControllers[i];
        //如果没有创建好的控制器, 直接跳过, 继续接下来
        if (!chileVC.isViewLoaded) {
            continue;
        }
        
        UIScrollView *scrollView = (UIScrollView *)chileVC.view;
        if (![scrollView isKindOfClass:[UIScrollView class]]) {
            continue;
        }
        //如果便利 i 的值和 索引值相同的时候 可以滚动到顶部
//        if (i == index) {
//            scrollView.scrollsToTop = YES;
//        } else {
//            scrollView.scrollsToTop = NO;
//        }
        scrollView.scrollsToTop = (i == index);
    }
    
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


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //点击对应的标题按钮
    NSInteger index = scrollView.contentOffset.x / scrollView.width;
    //点击对应按钮 ----- 如果是按照tag获取, tag不能够为0.  因为tag 0 是控件自己
    YGTitleButton *titleButton = self.titleView.subviews[index];
    [self titleButtonClick:titleButton];
    
}


#pragma mark - other
//默认情况下 显示第索引个控制器
-(void) addChildViewIntoScrollView:(NSInteger)index {
    
    UIView *chileView = self.childViewControllers[index].view;
    //如果父控件加过了, 就不用继续下去了   ---- 或者判断window  childView.window  return; ---- 或者 取出控制器, 如果 vc.isViewLoad return;
    if (chileView.superview) {
        return;
    }
    chileView.frame = self.scrollView.bounds;
    chileView.backgroundColor = YGRandomColor;
    [self.scrollView addSubview:chileView];
    
}
@end
