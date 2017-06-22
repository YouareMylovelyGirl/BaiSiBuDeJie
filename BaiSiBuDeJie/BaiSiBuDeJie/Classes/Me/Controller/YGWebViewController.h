//
//  YGWebViewController.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/22.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YGWebViewController : UIViewController
/** url */
@property(nonatomic, strong) NSString *urlString;

- (instancetype)initWithURLString:(NSString *)urlString;
@end
