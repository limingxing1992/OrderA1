//
//  NewsManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "NewsProcessor.h"

@interface NewsManager : BaseManager

@property(strong,nonatomic) NewsProcessor *newsProcessor;

/*********************************************************************
 函数名称 : getOneChannelListWithDictionary:
 函数描述 : 获取一级栏目及一级栏目下二级栏目列表接口（Channel_List）
 输入参数 : os：端口型号 android-安卓 apple-苹果，cid：应用ID，result：每页显示数量，id：栏目ID
 返回值 : success（channelsArray 存放栏目列表数据（数据为ChannelModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getOneChannelListWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(NSArray *channelsArray))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getNewsListWithDictionary:
 函数描述 : 获取资讯列表接口（News_List）
 输入参数 : id ：栏目id ,page：页码 ,size：每页条数
 返回值 : success（newsArray 存放资讯列表数据（数据为NewsModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getNewsListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(NSArray *newsArray))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getNewsPageUrlWithID:
 函数描述 : 获取资讯详情（网页版）url
 输入参数 : ID
 返回值 : newsPageUrl
 作者   : 张永亮
 *********************************************************************/
- (NSURL *)getNewsPageUrlWithID:(NSNumber *)ID;

/*********************************************************************
 函数名称 : addDiscussWithDictionary:
 函数描述 : 发布评论接口（DisAll_Add）
 输入参数 : obj.linkid：信息链接ID，obj.type：信息类型，obj.title：信息标题，obj.logo：图片，obj.content：信息内容
           obj.regtime：发布时间，obj.examin：检测，obj.uid：发布人ID，obj.cid：应用ID
 返回值 : success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)addDiscussWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id object))responseSuccess
                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : delDiscussWithDictionary:
 函数描述 : 删除评论接口（DisAll_Del）
 输入参数 : obj.uid：用户ID,obj.cid：应用ID,obj.id：信息ID
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)delDiscussWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id object))responseSuccess
                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getMyDiscussListWithDictionary:
 函数描述 : 获取我的评论接口（DisAll_Local）
 输入参数 : uid：用户ID，cid：应用ID，page：页码，size：每页条数
 返回值 : success（dissArray 存放我的评论列表数据（数据为DiscussModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getMyDiscussListWithDictionary:(NSDictionary *)parameters
                               success:(void (^)(NSArray *dissArray))responseSuccess
                               failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getDiscussListWithDictionary:
 函数描述 : 获取评论接口（DisAll_List）
 输入参数 : id：信息链接ID ,type：信息类型 news-新闻,blog-日志,company-企业,product-产品,show-说明,group-分组
           page：页码,size：每页条数
 返回值 : success（dissArray 存放评论列表数据（数据为DiscussModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getDiscussListWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(NSArray *dissArray))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;


@end
