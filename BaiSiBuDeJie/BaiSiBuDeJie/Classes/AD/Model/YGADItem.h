//
//  YGADItem.h
//  BaiSiBuDeJie
//
//  Created by 阳光 on 2017/6/20.
//  Copyright © 2017年 YG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YGADExp2Item,YGADExp2E61Item,YGADAdItem,YGADAdExp2Item,YGADAdExp2E62Item;
@interface YGADItem : NSObject

@property (nonatomic, strong) NSArray<YGADAdItem *> *ad;

@property (nonatomic, copy) NSString *theme;

@property (nonatomic, copy) NSString *req_id;

@property (nonatomic, assign) NSInteger x;

@property (nonatomic, assign) NSInteger error_code;

@property (nonatomic, assign) NSInteger interval;

@property (nonatomic, assign) NSInteger province;

@property (nonatomic, assign) NSInteger y;

@property (nonatomic, assign) NSInteger iap_buy;

@property (nonatomic, copy) NSString *impt;

@property (nonatomic, strong) YGADExp2Item *exp2;

@property (nonatomic, assign) NSInteger mode;

@property (nonatomic, assign) NSInteger city;

@property (nonatomic, assign) NSInteger m;

@property (nonatomic, copy) NSString *u;

@property (nonatomic, copy) NSString *clkt;

@property (nonatomic, assign) NSInteger n;

@end
@interface YGADExp2Item : NSObject

@property (nonatomic, assign) NSInteger e59;

@property (nonatomic, assign) NSInteger e76;

@property (nonatomic, strong) YGADExp2E61Item *e61;

@end

@interface YGADExp2E61Item : NSObject

@property (nonatomic, assign) BOOL IS_SEND_EVENT_ERROR_LOG;

@end

@interface YGADAdItem : NSObject

@property (nonatomic, assign) NSInteger fwt;

@property (nonatomic, copy) NSString *curl;

@property (nonatomic, strong) YGADAdExp2Item *exp2;
//id -> ID
@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *clklogurl;

@property (nonatomic, assign) NSInteger h;

@property (nonatomic, copy) NSString *src;

@property (nonatomic, copy) NSString *bid;

@property (nonatomic, copy) NSString *pk;

@property (nonatomic, copy) NSString *wb;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, assign) NSInteger iv;

@property (nonatomic, copy) NSString *theme;

@property (nonatomic, copy) NSString *qk;

@property (nonatomic, assign) NSInteger act;

@property (nonatomic, copy) NSString *sms;

@property (nonatomic, assign) NSInteger anti_tag;

@property (nonatomic, assign) NSInteger adtd;

@property (nonatomic, assign) NSInteger pict;

@property (nonatomic, copy) NSString *mimetype;

@property (nonatomic, copy) NSString *lb_phone;

@property (nonatomic, copy) NSString *sk;

@property (nonatomic, assign) NSInteger sz;

@property (nonatomic, copy) NSString *tit;

@property (nonatomic, copy) NSString *ad_title;

@property (nonatomic, copy) NSString *winurl;
//这个有用
@property (nonatomic, copy) NSString *w_picurl;

@property (nonatomic, copy) NSString *surl;

@property (nonatomic, assign) NSInteger ad_charge;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, assign) NSInteger dur;

@property (nonatomic, assign) NSInteger sound;
//点击图片后跳转的网址
@property (nonatomic, copy) NSString *ori_curl;

@property (nonatomic, assign) NSInteger actt;

@property (nonatomic, assign) NSInteger wi;

@property (nonatomic, assign) NSInteger styt;

@property (nonatomic, assign) NSInteger w;

@property (nonatomic, assign) NSInteger sb;

@property (nonatomic, copy) NSString *phone;

@end

@interface YGADAdExp2Item : NSObject

@property (nonatomic, strong) YGADAdExp2E62Item *e62;

@property (nonatomic, assign) NSInteger e99;

@property (nonatomic, assign) NSInteger e64;

@property (nonatomic, assign) NSInteger e70;

@end

@interface YGADAdExp2E62Item : NSObject

@property (nonatomic, assign) NSInteger ms;

@end

