//
//  YGRecommendViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/21.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGRecommendViewController.h"
#import "YGRecommendCell.h"

static NSString * const ID = @"cell";

@interface YGRecommendViewController ()
/** 推荐数组 */
@property(nonatomic, strong) NSMutableArray *recommendArr;

@end

@implementation YGRecommendViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    //配置网络请求
    [self setupNetManager];
    //设置标题
    self.title = @"推荐标签";
    //取消cell下面多余线
    self.tableView.tableFooterView = [[UIView alloc] init];
    //取出cell下面的线, 因为调整cell之间的间距来显示线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YGRecommendCell class]) bundle:nil] forCellReuseIdentifier:ID];
    //设置背景颜色
    self.view.backgroundColor = VIEW_BG_COLOR;
    //加载指示器
    [self.view showHUD];
}
//配置网络请求
- (void)setupNetManager {
    
    [YGNetManager GetRecommendConpletionHandler:^(NSArray<YGRecommendItem *> *obj, NSError *error) {
        
        [self.recommendArr addObjectsFromArray:obj];
        NSLog(@"%@", self.recommendArr);
        //这里!!!!一定要记得刷新表格 日了
        [self.tableView reloadData];
        //隐藏指示器
        [self.view hideHUD];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.recommendArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //只要使用注册, 就不用if判断
    YGRecommendCell *cell = [YGRecommendCell cellForTableView:tableView indexPath:indexPath];
    YGRecommendItem *item = self.recommendArr[indexPath.row];
    cell.recommendItem = item;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - life 
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view hideHUD];
    //取消请求
    
}

#pragma mark - lazy
- (NSMutableArray *)recommendArr {
    if (!_recommendArr) {
        _recommendArr = [NSMutableArray array];
    }
    return _recommendArr;
}

@end
