//
//  BaseProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseProcessor : NSObject

/*********************************************************************
 函数名称 : afHTTPSessionManagerJSONResponseSerializerToServerInteractionWithInterface:
 函数描述 : AFHTTPSessionManager响应请求 JSONResponseSerializer JSON
 输入参数 :
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)afHTTPSessionManagerJSONResponseSerializerToServerInteractionWithInterface:(NSString *)interface
                                                                         parameter:(NSDictionary *)parameters
                                                                           success:(void (^)(id responseObject))success
                                                                           failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : afHTTPSessionManagerJSONResponseSerializerToServerInteractionWithInterface:
 函数描述 : AFHTTPSessionManager响应请求 HTTPResponseSerializer 二进制格式
 输入参数 :
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)afHTTPSessionManagerHTTPResponseSerializerToServerInteractionWithInterface:(NSString *)interface
                                                                         parameter:(NSDictionary *)parameters
                                                                           success:(void (^)(id responseObject))success
                                                                           failure:(void (^)(NSError *error))failure;

@end
