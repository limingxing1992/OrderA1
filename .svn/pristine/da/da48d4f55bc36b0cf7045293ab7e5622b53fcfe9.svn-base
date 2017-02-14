//
//  SearchManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
@class SearchProcessor;

@interface SearchManager : BaseManager

@property(strong,nonatomic) SearchProcessor *searchProcessor;

/*********************************************************************
 函数名称 : getSearchAppKeyListWithDictionary:
 函数描述 : 搜索应用下的热词关键字接口（SchKey_Cid）
 输入参数 : id ：栏目id ,page：页码 ,size：每页条数
 返回值 : success（keysArray 存放关键字列表数据（数据为KeyModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchAppKeyListWithDictionary:(NSDictionary *)parameters
                                  success:(void (^)(NSArray *keysArray))responseSuccess
                                  failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getSearchListFromCidKeyWithDictionary:
 函数描述 : 根据应用下的热词关键字搜索结果集接口（SearchAll_Search，Blog_Sch）
 输入参数 : cid ：应用id ,str：关键字 ,size：每页条数
 返回值 : success（searchesArray 存放搜索列表数据（数据为SearchModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchListFromCidKeyWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(NSArray *searchesArray))responseSuccess
                                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getSearchNewsListForKeyWithDictionary:
 函数描述 : 根据关键字搜索资讯接口（News_Sch）
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（newsArray 存放搜索列表数据（数据为NewsModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchNewsListForKeyWithDictionary:(NSDictionary *)parameters
                                      success:(void (^)(NSArray *newsArray))responseSuccess
                                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getSearchCompanyListForKeyWithDictionary:
 函数描述 : 根据关键字搜索企业接口（Company_Sch）
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（companyArray 存放搜索列表数据（数据为CompanyModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchCompanyListForKeyWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(NSArray *companyArray))responseSuccess
                                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getSearchNeedsListForKeyWithDictionary:
 函数描述 : 根据关键字搜索供求信息接口（Needs_Sch）
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（needsArray 存放搜索列表数据（数据为NeedsModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchNeedsListForKeyWithDictionary:(NSDictionary *)parameters
                                       success:(void (^)(NSArray *needsArray))responseSuccess
                                       failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getSearchProductListForKeyWithDictionary:
 函数描述 : 根据关键字搜索产品接口（Pro_Sch）
 输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
 返回值 : success（productArray 存放搜索列表数据（数据为ProductModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getSearchProductListForKeyWithDictionary:(NSDictionary *)parameters
                                         success:(void (^)(NSArray *productArray))responseSuccess
                                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;


@end
