//
//  YGMeViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGMeViewController.h"
#import "YGSettingViewController.h"
#import "YGSquareCell.h"
#import "YGWebViewController.h"

#define cols 4

//CollectionView重用标示
static NSString * const ID = @"cell";

@interface YGMeViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>
/** 方块数组 */
@property(nonatomic, strong) NSMutableArray *squareArray;
/** collectionView */
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation YGMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = VIEW_BG_COLOR;
    [self setupNavBar];
    [self setupFootView];
    [self setupNetmanager];
    [self setupTableViewMargin];
    
    //添加双击按钮的刷新操作
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refreshMeViewController:) name:TMTabBarItemsDidRepeatClickedNotifecation object:nil ];
}

#pragma mark - 监听tabBar按钮被点击了
- (void)refreshMeViewController:(NSNotification *)notification {
    
//    TMBaseTabBarItems *tabBarItems = notification.userInfo[@"BaseTabBarItems"];
    //判断如果不是我的控制器直接return
//    if (tabBarItems.tag != 12583) {
//        return;
//    }
    //如果控制器window为nil直接return
    if (self.view.window == nil) {
        return;
    }
    
    
    
    NSLog(@"%@ -- 刷新数据", self.class);
}

//处理tableView分组的间距 和 头部间距
- (void)setupTableViewMargin {
    self.tableView.contentInset = UIEdgeInsetsMake(-1, 0, 0, 0);
    //头部高度至少1
    self.tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0,0,0,10)];
    //处理cell间距, 默认tableView分组样式, 有额外头部和尾部间距
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
}
#pragma mark - 配置网络数据
- (void)setupNetmanager {
    [YGNetManager GetSquareItemCompletionHandler:^(YGSquareItem *squareItem, NSError *error) {
        self.squareArray = [NSMutableArray arrayWithArray:squareItem.square_list];
        //处理数据
        [self resloveData];
        //重新计算frame
        [self cauculateCollectionSize];
        [self.collectionView reloadData];
    }];
}
//处理数据
- (void)resloveData {
    //判断一下缺几个
    NSInteger count = self.squareArray.count;
    NSInteger exter = count % cols;
    if (exter) {
        exter = cols - exter;
        for (int i = 0; i < exter; i++) {
            YGSquareSquare_ListItem *item = [[YGSquareSquare_ListItem alloc] init];
            [self.squareArray addObject:item];
        }
    }
}

//重新计算collectionview的大小
- (void)cauculateCollectionSize {
    //重新设置CollectionView的高度
    // rows = (count - 1) / cols + 1

    CGFloat margin = 1;
    CGFloat itemWH = (YGScreenW - (cols - 1) * margin) / cols;
    NSInteger count = self.squareArray.count;
    NSInteger rows = (count - 1) / cols + 1;
    //设置collectionView高度
    self.collectionView.height = rows * itemWH;
    //设置tableView的滚动范围 --- tableView的滚动范围是根据自己内容算的
    //设置tableView的底部视图 --- 重新给tableFooterView进行赋值
    self.tableView.tableFooterView = self.collectionView;
}

#pragma mark - 设置导航条
- (void)setupNavBar {
    self.navigationItem.title = @"我的";
    
    //快速创建导航条左右item
    UIBarButtonItem *moonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"mine-moon-icon"] selected:[UIImage imageNamed:@"mine-sun-icon-click"] target:self action:@selector(changeMoonBackground:)];
    UIBarButtonItem *settingItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"mine-setting-icon"] hightLightImage:[UIImage imageNamed:@"mine-setting-icon-click"] target:self action:@selector(clickSetting)];
    
    self.navigationItem.rightBarButtonItems = @[ settingItem, moonItem];
}
//夜间模式
- (void)changeMoonBackground:(UIButton *)sender {
    //设置按钮的选中状态
    sender.selected = !sender.selected;
    
    NSLog(@"%s", __func__);
}
//设置
- (void)clickSetting {
    NSLog(@"%s", __func__);
    //跳转到设置界面
    YGSettingViewController *settingVC = [[YGSettingViewController alloc] init];
    [self.navigationController pushViewController:settingVC animated:YES];
}

#pragma mark - 设置tableView底部视图
- (void)setupFootView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat margin = 1;
    CGFloat itemWH = (YGScreenW - (cols - 1) * margin) / cols;
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = VIEW_BG_COLOR;
    self.tableView.tableFooterView = self.collectionView;
    [self.collectionView registerNib:[UINib nibWithNibName:@"YGSquareCell" bundle:nil] forCellWithReuseIdentifier:ID];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.squareArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    YGSquareCell *cell = [YGSquareCell itemForCollectionView:collectionView indexPath:indexPath];
    
    YGSquareSquare_ListItem *item = self.squareArray[indexPath.row];
    
    cell.squareList = item;
    
    return cell;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    YGSquareSquare_ListItem *item = self.squareArray[indexPath.row];
    if (![item.url containsString:@"http"]) return;
    
    YGWebViewController *webVC = [[[YGWebViewController alloc] init]initWithURLString:item.url];
    [self.navigationController pushViewController:webVC animated:YES];

}

#pragma mark - life
- (void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - lazy
- (NSMutableArray *)squareArray {
    if (!_squareArray) {
        _squareArray = [NSMutableArray array];
    }
    return _squareArray;
}


@end
