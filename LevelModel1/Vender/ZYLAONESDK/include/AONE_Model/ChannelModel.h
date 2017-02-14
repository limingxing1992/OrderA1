//
//  ChannelModel.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChannelModel : NSObject

@property (nonatomic, copy) NSString *area;             //地区
@property (nonatomic, copy) NSNumber *chid;             //菜单ID
@property (nonatomic, copy) NSNumber *chid1;            //父节点ID
@property (nonatomic, copy) NSNumber *chstep;           //栏目级别
@property (nonatomic, copy) NSNumber *cid;              //应用ID
@property (nonatomic, copy) NSString *content;          //栏目内容
@property (nonatomic, copy) NSString *des;              //栏目简介
@property (nonatomic, copy) NSString *is_del;           //是否已删除（待定字段）
@property (nonatomic, copy) NSString *logo;             //图片
@property (nonatomic, copy) NSString *regtime;          //创建时间
@property (nonatomic, copy) NSString *sort;             //栏目排序
@property (nonatomic, copy) NSString *style;
@property (nonatomic, copy) NSString *title;            //栏目名称
@property (nonatomic, copy) NSString *type;             //栏目类别
@property (nonatomic, copy) NSString *typeId;
@property (nonatomic, copy) NSString *visible;          //是否可见
@property (nonatomic, strong) NSArray *twoChannelList;  //一级栏目对应的二级栏目 ChannelModel

@end
