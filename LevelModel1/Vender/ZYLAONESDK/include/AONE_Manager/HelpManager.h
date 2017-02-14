//
//  HelpManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/28.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "HelpProcessor.h"
@class HelpModel;

@interface HelpManager : BaseManager

@property(strong,nonatomic) HelpProcessor *helpProcessor;

/*********************************************************************
 函数名称 : getUserHelpsWithDictionary:
 函数描述 : 帮助中心（关于我们，新手帮助）接口（Help_List）
 输入参数 : cid ：应用id
 返回值 : success（helpsArray 存放帮助数据（数据为HelpModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getUserHelpsWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(NSArray *helpsArray))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getHelpsDetailUrlWithID:
 函数描述 : 获取关于我们、新手帮助详情url
 输入参数 : ID
 返回值 : helpsDetailUrl
 作者   : 张永亮
 *********************************************************************/
- (NSURL *)getHelpsDetailUrlWithID:(NSNumber *)ID;

/*********************************************************************
 函数名称 : feedbackWithDictionary:
 函数描述 : 意见反馈接口（Sug_Add）
 输入参数 : obj.cid ：应用ID ，obj.title ：反馈标题 ，obj.relation ：联系方式
           obj.content : 反馈内容 ，obj.uid ：用户ID ，obj.regtime ：新增时间
 返回值 :  success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)feedbackWithDictionary:(NSDictionary *)parameters
                       success:(void (^)(id object))responseSuccess
                       failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

@end
