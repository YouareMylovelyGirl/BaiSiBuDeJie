//
//  FileTools.m
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import "FileTools.h"

@implementation FileTools


+ (void)getFileSizeWithFilePath: (NSString *)directoryPath completion:(void(^)(NSInteger totalPath))completion{
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [manager fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isExist || !isDirectory) {
        // 不是文件夹 抛异常
        /*
         name: 异常名称
         reason: 报错原因
         */
        NSException *exception = [NSException exceptionWithName:@"路径错误" reason:@"需要传入的是文件夹路径, 并且路径需要在沙盒中存在" userInfo:nil];
        [exception raise];
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *subPaths = [manager subpathsAtPath:directoryPath];
        NSLog(@"%@", subPaths);
        NSInteger totalSize = 0;
        for (NSString *subPath in subPaths) {
            //获取文件的全路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            
            //不包含隐藏文件
            if ([filePath containsString:@".DS"]) {
                continue;
            }
            //判断是否是文件夹
            BOOL isDirectory;
            BOOL isExist = [manager fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExist || isDirectory) {
                continue;
            }
            
            //获取文件属性
            NSDictionary *attr = [manager attributesOfItemAtPath:filePath error:nil];
            //cache尺寸
            NSInteger fileSize = [attr fileSize];
            totalSize += fileSize;
        }
        //回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            //计算完成回调
            !completion ?: completion(totalSize);
        });
        
    });
}

+ (void)removeDirectoryPath:(NSString *)directoryPath {
    //清空缓存
    NSFileManager *manager = [NSFileManager defaultManager];
    
    BOOL isDirectory;
    BOOL isExist = [manager fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    if (!isExist || !isDirectory) {
        // 不是文件夹 抛异常
        /*
         name: 异常名称
         reason: 报错原因
         */
        NSException *exception = [NSException exceptionWithName:@"路径错误" reason:@"需要传入的是文件夹路径, 并且路径需要在沙盒中存在" userInfo:nil];
        [exception raise];
    }
    
    //获取cache文件夹下所有文件 --- 不包括子路经
    NSArray *subPaths = [manager contentsOfDirectoryAtPath:directoryPath error:nil];
    
    for (NSString *subPath in subPaths) {
        //拼接成完整路径
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        //删除路径
        [manager removeItemAtPath:filePath error:nil];
    }
}

@end
