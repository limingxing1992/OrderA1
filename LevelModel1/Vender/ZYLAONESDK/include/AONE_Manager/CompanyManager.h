//
//  CompanyManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "CompanyProcessor.h"

@interface CompanyManager : BaseManager

@property(strong,nonatomic) CompanyProcessor *companyProcessor;

/*********************************************************************
 函数名称 : getCompanyListWithDictionary:
 函数描述 : 获取企业列表接口（Company_List）
 输入参数 : id：栏目ID，lat：经度，lng：纬度，page：页码，size：每页条数
 返回值 : success（companyArray 存放企业列表数据（数据为CompanyModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getCompanyListWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(NSArray *companyArray))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getCompanyDetailUrlWithID:
 函数描述 : 获取企业详情url
 输入参数 : 企业ID 
 返回值 : companyDetailUrl
 作者   : 张永亮
 *********************************************************************/
- (NSURL *)getCompanyDetailUrlWithID:(NSNumber *)ID;

@end
