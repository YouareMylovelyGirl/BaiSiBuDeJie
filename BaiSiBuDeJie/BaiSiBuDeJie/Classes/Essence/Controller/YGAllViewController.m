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


@end

@implementation YGAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(99, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(99, 0, 49, 0);
    
    NSLog(@"%s", __func__);
    
    [self setupRefresh];
    
    //添加双击按钮的刷新操作
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarButtonDidRepeatClick) name:TMTabBarItemsDidRepeatClickedNotifecation object:nil ];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(titleButtonRepeatClick) name:YGTitleButtonDidRepeatClickedNotifecation object:nil ];
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

}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //处理header
    [self dealHeader];
    //处理footer
    [self dealFooter];
}

//处理header
- (void)dealHeader {
    //当scrollView的偏移量y值 <= offsetY值 代表header已经完全出现
    CGFloat offsetY = - (self.tableView.contentInset.top + self.header.height);
    NSLog(@"%f  -- %f --- %f ---- %f",self.tableView.contentInset.bottom,  self.header.height, offsetY, self.tableView.contentOffset.y);
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
    
    //如果正在刷新直接 返回
    if (self.isFooterRefreshing) {
        return;
    }
    
    CGFloat offsetY = self.tableView.contentSize.height + self.tableView.contentInset.bottom - self.tableView.height;
    if (self.tableView.contentOffset.y >= offsetY) {
        self.footerRefreshing = YES;
        self.footerLabel.text = @"正在加载更多..";
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"加载网络数据");
            self.footerLabel.text = @"上拉加载更多..";
            self.footerRefreshing = NO;
        });
        
    }
}

#pragma mark - 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //根据数据量显示或者隐藏
//    self.footer.hidden = (数据量 == 0)
    return 30;
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






@end
