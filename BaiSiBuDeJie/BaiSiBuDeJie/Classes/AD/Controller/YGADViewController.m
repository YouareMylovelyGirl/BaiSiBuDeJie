//
//  YGADViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGADViewController.h"
#import "TMCommonTabBarController.h"

@interface YGADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContentView;

/** 广告数组 */
@property(nonatomic, strong) NSArray *adArray;
/** 展示图片 */
@property(nonatomic, strong) UIImageView *showImageView;
/** 广告定时器 */
@property(nonatomic, strong) NSTimer *timer;
/** 跳过广告按钮 */
@property (weak, nonatomic) IBOutlet UIButton *skipShowAD;



@end

@implementation YGADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //屏幕适配
    [self setupLaunchImage];
    //配置网络数据
    [self setupNetManager];
    //创建定时器
    [self setupTimer];
}

//创建定时器
- (void)setupTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        //倒计时
        static int i = 3;
        
        if (i == 0) {
            //销毁广告界面
            self.view.window.rootViewController = [[TMCommonTabBarController alloc] init];
        }
        i--;
        //设置按钮上文字  -  如果设置系统样式, 会一闪一闪的, 设置自定义就没有问题
        [self.skipShowAD setTitle:[NSString stringWithFormat:@"  跳过 (%d)  ", i] forState:UIControlStateNormal];
    }];
}



//屏幕适配启动图片
- (void)setupLaunchImage {
    if (IS_IPHONE_4) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700@2x"];
    } else if (IS_IPHONE_5) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h@2x"];
    } else if (IS_IPHONE_6) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h@2x"];
    } else if (IS_IPHONE_6P) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
}

//配置广告数据
- (void)setupNetManager {
    [YGNetManager GetADItemCompletionHandler:^(YGADItem *adItem, NSError *error) {
        self.adArray = adItem.ad;
        
        YGADAdItem *item = self.adArray.firstObject;
        
        //广告图片
        CGFloat h = item.h * YGScreenW / item.w;
        
        self.showImageView.frame =CGRectMake(0, 0, YGScreenW, h);
        [self.showImageView sd_setImageWithURL:item.w_picurl.yg_URL];
        NSLog(@"%@", item.w_picurl);
    }];
}
#pragma mark - action
//跳转广告界面
- (void)gotoADView {
    NSLog(@"跳转界面");
    YGADAdItem *item = self.adArray.firstObject;
    NSLog(@"%@", item.ori_curl);
    //使用safri
    UIApplication *app = [UIApplication sharedApplication];
    
    if ([app canOpenURL:item.ori_curl.yg_URL]) {
        [app openURL:item.ori_curl.yg_URL];
    } else {
        NSLog(@"打开失败");
    }
 
}
//点击按钮直接跳过广告界面
- (IBAction)skipADView:(id)sender {
    self.view.window.rootViewController = [[TMCommonTabBarController alloc] init];
}

#pragma mark - life

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //销毁定时器
    [self.timer invalidate];
}


- (void)dealloc {
    NSLog(@"广告界面销毁了");
}


#pragma mark - lazy
- (UIImageView *)showImageView {
    if (!_showImageView) {
        _showImageView = [[UIImageView alloc] init];
        _showImageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapADView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoADView)];
        [_showImageView addGestureRecognizer:tapADView];
        [self.adContentView addSubview:_showImageView];
    }
    return _showImageView;
}

@end
