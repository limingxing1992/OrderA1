//
//  NeedsModel.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NeedsModel : NSObject

@property (nonatomic, copy) NSString *address;    //地址
@property (nonatomic, copy) NSNumber *chid;       //栏目ID
@property (nonatomic, copy) NSNumber *cid;        //应用ID
@property (nonatomic, copy) NSString *click;      //点击量
@property (nonatomic, copy) NSString *company;    //公司名称
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSNumber *discount;
@property (nonatomic, copy) NSString *email;      //电子邮件
@property (nonatomic, copy) NSString *examine;
@property (nonatomic, copy) NSNumber *ID;         //供求ID
@property (nonatomic, copy) NSString *logo;       //图片
@property (nonatomic, copy) NSString *realname;   //真实姓名
@property (nonatomic, copy) NSString *regtime;    //创建时间
@property (nonatomic, copy) NSString *style;
@property (nonatomic, copy) NSString *tel;        //联系电话
@property (nonatomic, copy) NSString *title;      //供求信息标题
@property (nonatomic, copy) NSString *type;       //类别 1-供应 2-求购
@property (nonatomic, copy) NSString *uid;        //用户ID

@end
