//
//  YGADViewController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGADViewController.h"

@interface YGADViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContentView;

@end

@implementation YGADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //屏幕适配
    [self setupLaunchImage];
}

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
