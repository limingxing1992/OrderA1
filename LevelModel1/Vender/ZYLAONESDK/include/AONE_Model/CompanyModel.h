//
//  CompanyModel.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompanyModel : NSObject

@property (nonatomic, copy) NSString *address;    //地址
@property (nonatomic, copy) NSString *area;       //地区
@property (nonatomic, copy) NSNumber *chid;       //栏目ID
@property (nonatomic, copy) NSNumber *chid1;      //父栏目ID
@property (nonatomic, copy) NSNumber *cid;        //应用ID
@property (nonatomic, copy) NSNumber *click;      //点击率
@property (nonatomic, copy) NSString *content;    //详细介绍
@property (nonatomic, copy) NSString *des;        //简介
@property (nonatomic, copy) NSNumber *discount;
@property (nonatomic, copy) NSNumber *examine;    //是否审核
@property (nonatomic, copy) NSNumber *ID;         //企业ID
@property (nonatomic, copy) NSString *logo;       //图片
@property (nonatomic, copy) NSString *maplat;     //纬度
@property (nonatomic, copy) NSString *maplng;     //经度
@property (nonatomic, copy) NSString *regtime;    //创建时间
@property (nonatomic, copy) NSNumber *score;      //积分
@property (nonatomic, copy) NSNumber *sort;       //排序
@property (nonatomic, copy) NSString *style;
@property (nonatomic, copy) NSString *tel;        //联系方式
@property (nonatomic, copy) NSString *title;      //企业名
@property (nonatomic, copy) NSNumber *uid;        //企业管理ID

@end
