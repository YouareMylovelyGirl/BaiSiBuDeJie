//
//  YGSettingViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGSettingViewController.h"
#import "FileTools.h"
static NSString * const ID = @"cell";
#define cacheFilePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
@interface YGSettingViewController ()
/** 缓存文件总大小 */
@property(nonatomic, assign) NSInteger totalSize;
@end

@implementation YGSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
    [self setupNavBar];
    [self setupTableView];
    [self getCacheSize];
}

//刚一进入界面就先计算缓存数据
- (void)getCacheSize {
    [self.view showHUD];
    [FileTools getFileSizeWithFilePath:cacheFilePath completion:^(NSInteger totalSize) {
        _totalSize = totalSize;
        [self.tableView reloadData];
        [self.view hideHUD];
    }];
}

- (void)setupTableView {
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}


#pragma mark - 设置导航条
- (void)setupNavBar {
    //快速创建导航条左右item
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemButtonWithNormalImage:[UIImage imageNamed:@"MainTagSubIcon"] hightLightImage:[UIImage imageNamed:@"MainTagSubIconClick"] target:self action:@selector(pushNextVC)];
    
}
//左边subIcon
- (void)pushNextVC {
    YGSettingViewController *setting = [[YGSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    /*
     计算缓存数据, 计算整个应用程序缓存数据 => 沙盒 (cache) => 获取cache文件夹尺寸
     */
    cell.textLabel.text = [self sizeString];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    [FileTools removeDirectoryPath:cacheFilePath];
    _totalSize = 0;
    [self.tableView reloadData];
}

#pragma mark - action


- (NSString *)sizeString {
    
    NSString *sizeStr = @"清除缓存";
    
    NSInteger totalSize = _totalSize;
    
    if (totalSize > 1000 * 1000 * 1000) {
        //GB
        CGFloat sizeF = totalSize / 1000.0 / 1000.0 / 1000.0 ;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fGB)", sizeStr, sizeF];
    } else if (totalSize > 1000 * 1000) {
        //MB
        CGFloat sizeF = totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fMB)", sizeStr, sizeF];
    } else if (totalSize > 1000) {
        //KB
        CGFloat sizeF = totalSize / 1000.0 ;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fKB)", sizeStr, sizeF];
    } else if (totalSize > 0) {
        //B
        CGFloat sizeF = totalSize ;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fB)", sizeStr, sizeF];
    }
    return sizeStr;
}


@end
