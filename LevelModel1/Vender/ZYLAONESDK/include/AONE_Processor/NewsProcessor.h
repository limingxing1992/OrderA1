//
//  NewsProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface NewsProcessor : BaseProcessor

/*********************************************************************
 函数名称 : getOneChannelListWithDictionary:
 函数描述 : 获取一级栏目及一级栏目下二级栏目列表接口
 输入参数 : os：端口型号 android-安卓 apple-苹果，cid：应用ID，result：每页显示数量，id：栏目ID
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getOneChannelListWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getNewsListWithDictionary:
 函数描述 : 获取资讯列表接口
 输入参数 : id ：栏目id ,page：页码 ,size：每页条数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getNewsListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : addDiscussWithDictionary:
 函数描述 : 发布评论接口
 输入参数 : obj.linkid：信息链接ID，obj.type：信息类型，obj.title：信息标题，obj.logo：图片，obj.content：信息内容
          obj.regtime：发布时间，obj.examin：检测，obj.uid：发布人ID，obj.cid：应用ID
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)addDiscussWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : delDiscussWithDictionary:
 函数描述 : 删除评论接口
 输入参数 : obj.uid：用户ID,obj.cid：应用ID,obj.id：信息ID
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)delDiscussWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getMyDiscussListWithDictionary:
 函数描述 : 获取我的评论接口
 输入参数 : uid：用户ID，cid：应用ID，page：页码，size：每页条数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getMyDiscussListWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(id responseObject))success
                               failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getDiscussListWithDictionary:
 函数描述 : 获取评论接口
 输入参数 : id：信息链接ID ,type：信息类型 news-新闻,blog-日志,company-企业,product-产品,show-说明,group-分组
           page：页码,size：每页条数
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getDiscussListWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

@end
