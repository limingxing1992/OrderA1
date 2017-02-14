//
//  SearchProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface SearchProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getSearchAppKeyListWithDictionary:
 函数描述 : 搜索应用下的热词关键字接口
 输入参数 : id ：栏目id ,page：页码 ,size：每页条数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchAppKeyListWithDictionary:(NSDictionary *)parameters
                                  success:(void (^)(id responseObject))success
                                  failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getSearchListFromCidKeyWithDictionary:
 函数描述 : 根据应用下的热词关键字搜索结果集接口
 输入参数 : cid ：应用id ,str：关键字 ,size：每页条数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchListFromCidKeyWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id responseObject))success
                                      failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getSearchNewsListForKeyWithDictionary:
 函数描述 : 根据关键字搜索资讯接口
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchNewsListForKeyWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(id responseObject))success
                                      failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getSearchCompanyListForKeyWithDictionary:
 函数描述 : 根据关键字搜索企业接口
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchCompanyListForKeyWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(id responseObject))success
                                         failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getSearchNeedsListForKeyWithDictionary:
 函数描述 : 根据关键字搜索供求信息接口
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchNeedsListForKeyWithDictionary:(NSDictionary *)parameters
                                       success:(void (^)(id responseObject))success
                                       failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getSearchProductListForKeyWithDictionary:
 函数描述 : 根据关键字搜索产品接口
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchProductListForKeyWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(id responseObject))success
                                         failure:(void (^)(NSError *error))failure;

@end
