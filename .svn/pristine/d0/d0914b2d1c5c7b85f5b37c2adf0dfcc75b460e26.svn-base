//
//  ShowProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface ShowProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getShowListWithDictionary:
 函数描述 : 获取展会列表接口
 输入参数 : id：栏目ID,area：地区,size：每页条数,page：页码
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getShowListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

@end
