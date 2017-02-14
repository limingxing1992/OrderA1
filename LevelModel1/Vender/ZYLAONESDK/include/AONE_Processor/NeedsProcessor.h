//
//  NeedsProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface NeedsProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getNeedsListWithDictionary:
 函数描述 : 获取供求关系列表接口
 输入参数 : id ：栏目id ,type：供求类型 1-供应 2-需求 ,page：页码 ,size：每页条数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getNeedsListWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : addNeedsWithDictionary:
 函数描述 : 新增供求关系接口
 输入参数 : obj.chid：栏目ID,obj.cid：应用ID,obj.uid：用户iD,obj.title：信息标题,
          obj.content：信息内容,obj.loge：图片,obj.tel：电话,obj.address：地址,obj.email：邮箱
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)addNeedsWithDictionary:(NSDictionary *)parameters
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

@end
