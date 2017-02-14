//
//  AdvModel.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AdvModel : NSObject

@property (nonatomic, copy) NSString *area;      //地区
@property (nonatomic, copy) NSNumber *chid;      //栏目ID
@property (nonatomic, copy) NSNumber *cid;       //应用ID
@property (nonatomic, copy) NSString *content;   //详细介绍
@property (nonatomic, copy) NSString *des;       //简介
@property (nonatomic, copy) NSNumber *ID;
@property (nonatomic, copy) NSString *logo;      //图片
@property (nonatomic, copy) NSString *regtime;   //创建时间
@property (nonatomic, copy) NSNumber *sort;
@property (nonatomic, copy) NSString *style;     //展示方式
@property (nonatomic, copy) NSString *title;     //标题
@property (nonatomic, copy) NSNumber *tuijian;   //是否推荐

@end
