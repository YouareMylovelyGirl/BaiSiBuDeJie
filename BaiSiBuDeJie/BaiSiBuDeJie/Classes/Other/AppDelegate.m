//
//  AppDelegate.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/16.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "AppDelegate.h"
#import "YGADViewController.h"
#import "TMCommonTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//如果想监听点击状态栏, 只需要在这个文件中 实现这个方法
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //严谨期间 判断触摸点
//    UITouch *touch = touches.anyObject;
//    CGPoint point = [touch locationInView:nil];
//    if (point.y > 20) {
//        return;
//    }
//    //点击状态栏需要做的事情
//    
//    NSLog(@"%s", __func__);
//};

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[TMCommonTabBarController alloc] init];
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
