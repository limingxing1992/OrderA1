//
//  OpenProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OpenProcessor : NSObject

/*********************************************************************
 函数名称 : openHTTPRequestWithUrlString:parameters:responseSerializer:success:failure
 函数描述 : 自定义网络请求
 输入参数 : urlString:http://appserver.1035.mobi/MobiSoft/Channel_List?
           parameters:@{@"cid":@"xxx"}
           serializer:HTTPResponseSerializer/JSONResponseSerializer(ZYLAONETypedef.h)
 返回值 : success:responseObject     failure:error
 作者   : 张永亮
 *********************************************************************/
- (void)openHTTPRequestWithUrlString:(NSString *)urlString
                  responseSerializer:(NSInteger)serializer
                          parameters:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

@end
