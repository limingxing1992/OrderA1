//
//  AdvProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface AdvProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getAdvsWithDictionary:
 函数描述 : 获取广告列表
 输入参数 : cid、size...
 返回值 : success（advsArray 存放广告数据（广告数据为AdvModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getAdvsWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

@end
