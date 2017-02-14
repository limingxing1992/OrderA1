//
//  NeedsManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "NeedsProcessor.h"

@interface NeedsManager : BaseManager

@property(strong,nonatomic) NeedsProcessor *needsProcessor;

/*********************************************************************
 函数名称 : getNeedsListWithDictionary:
 函数描述 : 获取供求关系列表接口（Needs_List）
 输入参数 : id ：栏目id ,type：供求类型 1-供应 2-需求 ,page：页码 ,size：每页条数
 返回值 : success（needsArray 存放供求关系列表数据（数据为NeedsModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getNeedsListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(NSArray *needsArray))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getNeedsDetailUrlWithID:
 函数描述 : 信息详情（网页版）url
 输入参数 : 信息id
 返回值 : needsDetailUrl
 作者   : 张永亮
 *********************************************************************/
- (NSURL *)getNeedsDetailUrlWithID:(NSNumber *)ID;

/*********************************************************************
 函数名称 : addNeedsWithDictionary:
 函数描述 : 新增供求关系接口（Needs_Add）
 输入参数 : obj.chid：栏目ID,obj.cid：应用ID,obj.uid：用户iD,obj.title：信息标题,
           obj.content：信息内容,obj.loge：图片,obj.tel：电话,obj.address：地址,obj.email：邮箱
 返回值 : success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)addNeedsWithDictionary:(NSDictionary *)parameters
                       success:(void (^)(id object))responseSuccess
                       failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

@end
