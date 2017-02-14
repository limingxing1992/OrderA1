//
//  UserProcessor.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/27.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseProcessor.h"

@interface UserProcessor : BaseProcessor

/*********************************************************************
 函数名称 : userLoginWithDictionary:
 函数描述 : 用户登录接口
 输入参数 : cusername：用户名，password：密码
 返回值 : success（NSString），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)userLoginWithDictionary:(NSDictionary *)parameters
                        success:(void (^)(id responseObject))success
                        failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : userRegWithDictionary:
 函数描述 : 用户注册接口
 输入参数 : obj.username ：用户名
           obj.password ：密码
           regCode：验证码
           obj.cid：应用Id
           obj.logo：用户头像
 返回值 : success（），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)userRegWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id responseObject))success
                      failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : userSendRegCodeWithDictionary:
 函数描述 : 发送验证码接口
 输入参数 :username ：用户名  Tel：手机号码 cid：应用ID
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)userSendRegCodeWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id responseObject))success
                              failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getUserInfoWithDictionary:
 函数描述 : 获取用户个人信息接口
 输入参数 : id：用户ID
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)getUserInfoWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(id responseObject))success
                          failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : modifyUserInfoWithDictionary:
 函数描述 : 修改用户个人信息接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)modifyUserInfoWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : showUserLogoWithDictionary:
 函数描述 : 显示用户个人头像接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)showUserLogoWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id responseObject))success
                           failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : upUserLogoWithDictionary:
 函数描述 : 上传修改用户个人头像接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)upUserLogoWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : modifyUserPasswordWithDictionary:
 函数描述 : 修改用户密码接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)modifyUserPasswordWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id responseObject))success
                                 failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : modifyUserNickWithDictionary:
 函数描述 : 修改用户昵称接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)modifyUserNickWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id responseObject))success
                             failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : resetUserPasswordWithDictionary:
 函数描述 : 找回用户密码接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)resetUserPasswordWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id responseObject))success
                                failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : addFavWithDictionary:
 函数描述 : 添加收藏接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)addFavWithDictionary:(NSDictionary *)parameters
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : delFavWithDictionary:
 函数描述 : 删除收藏接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)delFavWithDictionary:(NSDictionary *)parameters
                     success:(void (^)(id responseObject))success
                     failure:(void (^)(NSError *error))failure;

/*********************************************************************
 函数名称 : getFavListWithDictionary:
 函数描述 : 获取收藏列表接口
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)getFavListWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;

@end
