//
//  ShowManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "ShowProcessor.h"

@interface ShowManager : BaseManager

@property(strong,nonatomic) ShowProcessor *showProcessor;

/*********************************************************************
 函数名称 : getShowListWithDictionary:
 函数描述 : 获取展会列表接口
 输入参数 : id：栏目ID,area：地区,size：每页条数,page：页码
 返回值 : success（showArray 存放blog列表数据（数据为ShowModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getShowListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(NSArray *showArray))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getShowDetailUrlWithID:
 函数描述 : 信息详情（网页版）url
 输入参数 : show id
 返回值 : showDetailUrl
 作者   : 张永亮
 *********************************************************************/
- (NSURL *)getShowDetailUrlWithID:(NSNumber *)ID;

@end
