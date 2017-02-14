//
//  BlogManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "BlogProcessor.h"

@interface BlogManager : BaseManager

@property(strong,nonatomic) BlogProcessor *blogProcessor;

/*********************************************************************
 函数名称 : getBlogListWithDictionary:
 函数描述 : 获取blog求职招聘等列表接口（Blog_List）
 输入参数 : id ：栏目id ,page：页码 ,size：每页条数
 返回值 : success（blogArray 存放blog列表数据（数据为BlogModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getBlogListWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(NSArray *blogArray))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getBlogDetailUrlWithID:
 函数描述 : 信息详情（网页版）url
 输入参数 : blog id
 返回值 : blogDetailUrl
 作者   : 张永亮
 *********************************************************************/
- (NSURL *)getBlogDetailUrlWithID:(NSNumber *)ID;

@end
