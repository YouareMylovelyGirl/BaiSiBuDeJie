//
//  YGNavigationController.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "YGNavigationController.h"

@interface YGNavigationController ()<UINavigationControllerDelegate, UIGestureRecognizerDelegate>


@end

@implementation YGNavigationController

+ (void)load {
    //设置全局
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    [navBar setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20]}];
    
    //设置导航条的背景图片 --- 这里要选择Default
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置导航不透明
    self.navigationBar.translucent = NO;
    
    __weak YGNavigationController *weakSelf = self;
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = weakSelf;
        self.delegate = weakSelf;
    }
}


//重写push方法
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    self.interactivePopGestureRecognizer.enabled = NO;
    
    if (self.childViewControllers.count > 0) {
        
        
        NSString *title = @"返回";
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemButtonWithTitle:title fontSize:16 normalColor:[UIColor blackColor] highLightColor:[UIColor redColor] target:self action:@selector(popLastViewController) NormalReturnPic:[UIImage imageNamed:@"navigationButtonReturn"] highLightImage:[UIImage imageNamed:@"navigationButtonReturnClick"]];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

//返回上一控制器
- (void)popLastViewController {
    [self popViewControllerAnimated:YES];
}


#pragma mark UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate
{
    // Enable the gesture again once the new controller is shown
    
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    self.interactivePopGestureRecognizer.enabled = YES;
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated {
    
    return [super popViewControllerAnimated:YES];
}

#pragma mark UINavigationControllerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if ([self.childViewControllers count] == 1) {
        return NO;
    }
    return YES;
}

// 同时接受多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}
//解决手指在滑动的时候，被 pop 的 ViewController 中的 UIScrollView 会跟着一起滚动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}



@end
