//
//  FileTools.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileTools : NSObject

/**
 获取文件夹所有文件

 @param path 文件夹路径
 @param completion 计算完成时的回调
 */

+ (void)getFileSizeWithFilePath: (NSString *)path completion:(void(^)(NSInteger totalSize))completion;



/**
 删除路径下所有文件

 @param directoryPath 所要删除文件夹路径
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;
@end
