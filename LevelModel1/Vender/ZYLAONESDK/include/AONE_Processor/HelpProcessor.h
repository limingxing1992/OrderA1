//
//  HelpProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface HelpProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getUserHelpsWithDictionary:
 函数描述 : 帮助中心（关于我们，新手帮助）接口
 输入参数 : cid ：应用id
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getUserHelpsWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : feedbackWithDictionary:
 函数描述 : 意见反馈接口
 输入参数 :
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)feedbackWithDictionary:(NSDictionary *)parameters
                       success:(void (^)(id responseObject))success
                       failure:(void (^)(NSError *error))failure;

@end
