//
//  YGAllViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/25.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGAllViewController.h"


@interface YGAllViewController ()
/** 上拉刷新控件 */
@property(nonatomic, strong) UIView *footer;
/** 上拉刷新控件文字 */
@property(nonatomic, strong) UILabel *footerLabel;
/** 上啦刷新正在刷新 */
@property(nonatomic, assign, getter=isFooterRefreshing) BOOL footerRefreshing;

/** 下拉刷新控件 */
@property(nonatomic, strong) UIView *header;
/** 下拉刷新控件文字 */
@property(nonatomic, strong) UILabel *headerLabel;
/** 下啦刷新正在刷新 */
@property(nonatomic, assign, getter=isHeaderRefreshing) BOOL headerRefreshing;

/** 精华全部数据 */
@property(nonatomic, strong) NSMutableArray *AllMArray;
/** 分页加载时最大时间 */
@property(nonatomic, strong) NSString *maxTime;



@end

@implementation YGAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(99, 0, 49, 0);
    
    NSLog(@"%s", __func__);
    
    
    //添加双击按钮的刷新操作
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarButtonDidRepeatClick) name:TMTabBarItemsDidRepeatClickedNotifecation object:nil ];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleButtonRepeatClick) name:YGTitleButtonDidRepeatClickedNotifecation object:nil ];
    
    [self setupRefresh];
    
}
#pragma mark - 监听tabBar按钮被点击了
- (void)tabBarButtonDidRepeatClick {
    
    if (self.view.window == nil) {
        return;
    }
    //如果判断不能点击状态栏滚动到最上面, 直接return
    if (self.tableView.scrollsToTop == NO) {
        return;
    }
    
    [self headerBeginRefreshing];
    NSLog(@"%@ -- 刷新数据", self.class);
}

//标题按钮被人点击
- (void)titleButtonRepeatClick {
    [self tabBarButtonDidRepeatClick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    //移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:TMTabBarItemsDidRepeatClickedNotifecation object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:YGTitleButtonDidRepeatClickedNotifecation object:nil];
}


- (void)setupRefresh {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 40)];
    label.text = @"广告";
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    self.tableView.tableHeaderView = label;
    
    //header
    self.header = [[UIView alloc] init];
    self.header.frame = CGRectMake(0, -35, self.tableView.width, 35);
    
    self.headerLabel = [[UILabel alloc] init];
    self.headerLabel.frame = self.header.bounds;
    self.headerLabel.text = @"下拉加载更多..";
    self.headerLabel.backgroundColor = [UIColor redColor];
    self.headerLabel.textAlignment = NSTextAlignmentCenter;
    [self.header addSubview:self.headerLabel];
    
    [self.tableView addSubview:self.header];
    
    
    
    //footer
    self.footer = [[UIView alloc] init];
    self.footer.frame = CGRectMake(0, 0, self.tableView.width, 35);
    
    self.footerLabel = [[UILabel alloc] init];
    self.footerLabel.frame = self.footer.bounds;
    self.footerLabel.text = @"上拉加载更多..";
    self.footerLabel.backgroundColor = [UIColor redColor];
    self.footerLabel.textAlignment = NSTextAlignmentCenter;
    [self.footer addSubview:self.footerLabel];
    
    self.tableView.tableFooterView = self.footer;
    
    //第一次进来刷新
    [self firstStartBeginRefreshing];
    
}

#pragma mark - scrollViewDelegate
//正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //处理header
    [self dealHeader];
    //处理footer
    [self dealFooter];
}

//松开scrollView
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    //当scrollView的偏移量y值 <= offsetY值 代表header已经完全出现
    CGFloat offsetY = - (self.tableView.contentInset.top + self.header.height);
    
    if (self.tableView.contentOffset.y <= offsetY) {
        //开始刷新
        [self firstStartBeginRefreshing];
    }
}

//处理header
- (void)dealHeader {
    
    // 如果正在下拉刷新，直接返回
    if (self.isHeaderRefreshing) return;
    
    //当scrollView的偏移量y值 <= offsetY值 代表header已经完全出现
    CGFloat offsetY = - (self.tableView.contentInset.top + self.header.height);
    
    if (self.tableView.contentOffset.y <= offsetY) {
        self.headerLabel.text = @"松开立即刷新";
        self.headerLabel.backgroundColor = [UIColor grayColor];
    } else {
        self.headerLabel.text = @"下拉加载更多..";
        self.headerLabel.backgroundColor = [UIColor redColor];
    }
}

//处理footer
- (void)dealFooter {
    //当scrollView的偏移量y值 >= offsetY时, 代表footer已经完全出现
    //还没有内容的时候, 不需要判断
    if (self.tableView.contentSize.height == 0) {
        return;
    }
    
    CGFloat offsetY = self.tableView.contentSize.height + self.tableView.contentInset.bottom - self.tableView.height;
    if (self.tableView.contentOffset.y >= offsetY && self.tableView.contentOffset.y > - (self.tableView.contentInset.top)) {
        //开始footer刷新
        [self footerBeginRefreshing];
        
    }
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //根据数据量显示或者隐藏
    self.footer.hidden = (self.AllMArray.count == 0);
    return self.AllMArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@-%zd", self.class, indexPath.row];
    return cell;
}

#pragma mark - 网络请求
//加载最新数据
- (void)loadNewData {
    
    [YGNetManager GetEssenceAllWithType:1 maxTime:@"" completionHandler:^(YGEssenceItem *essenceAllItem, NSError *error) {
        NSLog(@"%@", error);
        
        self.maxTime = essenceAllItem.info.maxtime;
        if (error) {
            [self.view showMessage:@"网络错误"];
        } else {
            [self.AllMArray removeAllObjects];
            [self.AllMArray addObjectsFromArray:essenceAllItem.list];
            [self.tableView reloadData];
        }
    }];
    
    //结束刷新状态
    [self headerEndRefreshing];
}
//加载更多数据
- (void)loadMoreData {
    
    [YGNetManager GetEssenceAllWithType:1 maxTime:self.maxTime completionHandler:^(YGEssenceItem *essenceAllItem, NSError *error) {
        [self footerEndRefreshing];
        if (error) {
            [self.view showMessage:@"网络错误"];
        } else {
            [self.AllMArray addObjectsFromArray:essenceAllItem.list];
            [self.tableView reloadData];
        }
    }];
    
    
}



#pragma mark - header

- (void)firstStartBeginRefreshing {
    if (self.isHeaderRefreshing) {
        return;
    }
    //进入下拉刷新状态
    self.headerRefreshing = YES;
    self.headerLabel.text = @"正在刷新了..";
    self.headerLabel.backgroundColor = [UIColor orangeColor];
    //增加内边距
    
    [UIView animateWithDuration:0.25 animations:^{
        UIEdgeInsets inset = self.tableView.contentInset;
        inset.top += self.header.height;
        self.tableView.contentInset = inset;
        //大BUG, 不知道为什么滚动偏移量 一松开手就立刻加上inset.top高度, 只好在这里减去
        self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y - inset.top);
    } completion:^(BOOL finished) {
        //加载最新数据
        [self loadNewData];
    }];
    
    
}

- (void)headerBeginRefreshing {
    if (self.isHeaderRefreshing) {
        return;
    }
    //进入下拉刷新状态
    self.headerRefreshing = YES;
    self.headerLabel.text = @"正在刷新了..";
    self.headerLabel.backgroundColor = [UIColor orangeColor];
    //增加内边距
    
    [self.tableView setContentOffset:CGPointMake(self.tableView.contentOffset.x,  - (self.header.height + self.tableView.contentInset.top)) animated:YES];
    
    //等到完全移到上面以后再改变内边距    ----  这里是刷新要分两种状态   ----  一种 正在划时点击刷新, 另一种正常刷新
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.25 animations:^{
            UIEdgeInsets inset = self.tableView.contentInset;
            inset.top += self.header.height;
            self.tableView.contentInset = inset;
        } completion:^(BOOL finished) {
            //加载最新数据
            [self loadNewData];
        }];
    });
}
- (void)headerEndRefreshing {
    self.headerRefreshing = NO;
    //减小内边距
    [UIView animateWithDuration:0.25 animations:^{
        UIEdgeInsets inset = self.tableView.contentInset;
        inset.top -= self.header.height;
        self.tableView.contentInset = inset;
    }];
    
}

#pragma mark - footer
- (void)footerBeginRefreshing {
    //如果正在上拉刷新, 直接返回
    if (self.isFooterRefreshing) {
        return;
    }
    
    self.footerRefreshing = YES;
    self.footerLabel.text = @"正在加载更多..";
    self.footerLabel.backgroundColor = [UIColor blueColor];
    
    //加载更多数据
    [self loadMoreData];
    
}
- (void)footerEndRefreshing {
    self.footerRefreshing = NO;
    self.footerLabel.text = @"上拉加载更多..";
    self.footerLabel.backgroundColor = [UIColor redColor];
}


#pragma mark - lazy
//精华所有数据
- (NSMutableArray *)AllMArray {
    if (!_AllMArray) {
        _AllMArray = [NSMutableArray array];
    }
    return _AllMArray;
}

@end
