//
//  FavModel.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FavModel : NSObject

@property (nonatomic, copy) NSNumber *cid;        //应用ID
@property (nonatomic, copy) NSNumber *ID;         //收藏ID
@property (nonatomic, copy) NSString *infodes;    //收藏对象简介
@property (nonatomic, copy) NSNumber *infoid;
@property (nonatomic, copy) NSString *infologo;   //收藏对象图片
@property (nonatomic, copy) NSNumber *infoprice;  //价格（商品的情况下）
@property (nonatomic, copy) NSString *infotitle;  //收藏对象名称
@property (nonatomic, copy) NSString *infotype;   //收藏类别
@property (nonatomic, copy) NSString *memo;
@property (nonatomic, copy) NSString *regtime;    //收藏时间
@property (nonatomic, copy) NSNumber *uid;        //用户ID

@end
