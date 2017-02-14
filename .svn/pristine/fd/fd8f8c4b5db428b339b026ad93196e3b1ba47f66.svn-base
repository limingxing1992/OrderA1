//
//  UserManager.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseManager.h"
#import "UserProcessor.h"
@class UserInfoModel;

@interface UserManager : BaseManager

@property(strong,nonatomic) UserProcessor *userProcessor;

/*********************************************************************
 函数名称 : userLoginWithDictionary:
 函数描述 : 用户登录接口（User_Log）
 输入参数 : cusername：用户名，password：密码
 返回值 : success 大于0-操作成功 ，responseFailure 0-账号不存在,-1-密码错误
 作者   : 张永亮
 *********************************************************************/
- (void)userLoginWithDictionary:(NSDictionary *)parameters
                        success:(void (^)(id object))responseSuccess
                        failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : userRegWithDictionary:
 函数描述 : 用户注册接口（User_Reg）
 输入参数 : obj.username ：用户名
          obj.password ：密码
          regCode：验证码
          obj.cid：应用Id
 返回值 : success 大于0：注册成功 为用户ID，responseFailure  0：数据库写入失败 ,-1：账户已存在 ,-2：昵称已存在 ,-3：未输入验证码 ,-4：验证码过期 ,-5：验证码错误
 作者   : 张永亮
 *********************************************************************/
- (void)userRegWithDictionary:(NSDictionary *)parameters
                      success:(void (^)(id object))responseSuccess
                      failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : userSendRegCodeWithDictionary:
 函数描述 : 发送验证码接口（User_SendRegCode）
 输入参数 :username ：用户名  Tel：手机号码 cid：应用ID
 返回值 : success 1：验证码发送成功, responseFailure -1：未输入用户名,-2：用户名已存在,-3：信息发送失败,-4：未输入手机号
 作者   : 张永亮
 *********************************************************************/
- (void)userSendRegCodeWithDictionary:(NSDictionary *)parameters
                              success:(void (^)(id object))responseSuccess
                              failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getUserInfoWithDictionary:
 函数描述 : 获取用户个人信息接口（User_Json）
 输入参数 : id：用户ID
 返回值 : success : UserInfoModel
 作者   : 张永亮
 *********************************************************************/
- (void)getUserInfoWithDictionary:(NSDictionary *)parameters
                          success:(void (^)(UserInfoModel *userInfoModel))responseSuccess
                          failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : modifyUserInfoWithDictionary:
 函数描述 : 修改用户个人信息接口（User_Modify）
 输入参数 :  id：用户ID
           head：参数字段 phone-手机号,sex-性别,company-公司名,email-邮箱,address-地址,des-简介,realname-真实姓名
           data：参数内容 与参数字段一一对应 用逗号隔开
 返回值 :  success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)modifyUserInfoWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : showUserLogoWithDictionary:
 函数描述 : 显示用户个人头像接口
 输入参数 : id：用户ID
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (void)showUserLogoWithDictionary:(NSDictionary *)parameters
                           success:(void (^)(id object))responseSuccess
                           failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getImageStringByEncodingData:
 函数描述 : 通过GTM转码获取头像string  NSData-->NSString
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (NSString *)getImageStringByEncodingData:(NSData *)data;

/*********************************************************************
 函数名称 : getImageDataByEncodingString:
 函数描述 : 通过GTM转码获取头像data  NSString-->NSData
 输入参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
- (NSData *)getImageDataByEncodingString:(NSString *)str;

/*********************************************************************
 函数名称 : upUserLogoWithDictionary:
 函数描述 : 上传修改用户个人头像接口（User_upLogo）
 输入参数 : id：用户ID, data：头像 NSData-->NSString
 返回值 :   success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)upUserLogoWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(id object))responseSuccess
                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : modifyUserPasswordWithDictionary:
 函数描述 : 修改用户密码接口（User_Pass）
 输入参数 : obj.uid：用户ID,obj.password：旧密码,password：新密码
 返回值 : success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)modifyUserPasswordWithDictionary:(NSDictionary *)parameters
                                 success:(void (^)(id object))responseSuccess
                                 failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : modifyUserNickWithDictionary:
 函数描述 : 修改用户昵称接口（User_Nick）
 输入参数 : obj.uid：用户ID,obj.nickname：新昵称
 返回值 : success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)modifyUserNickWithDictionary:(NSDictionary *)parameters
                             success:(void (^)(id object))responseSuccess
                             failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : resetUserPasswordWithDictionary:
 函数描述 : 找回用户密码接口（User_ResetPass）
 输入参数 : username  用户名/手机号 ,email  邮箱
 返回值 : success：1，responseFailure：0
 作者   : 张永亮
 *********************************************************************/
- (void)resetUserPasswordWithDictionary:(NSDictionary *)parameters
                                success:(void (^)(id object))responseSuccess
                                failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : addFavWithDictionary:
 函数描述 : 添加收藏接口（Fav_Add）
 输入参数 : obj.uid：用户ID ,obj.infotype：收藏类型 news-新闻 image-图片 show-展会 product-商品 company-企业 blog-日志 needs-供求信息 group-团购商品 ,obj.infoid：收藏对象ID
 返回值 : success：1，responseFailure：0 ,-1-提交信息不全
 作者   : 张永亮
 *********************************************************************/
- (void)addFavWithDictionary:(NSDictionary *)parameters
                     success:(void (^)(id object))responseSuccess
                     failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : delFavWithDictionary:
 函数描述 : 删除收藏接口（Fav_Del）
 输入参数 : uid：用户Id ,id：收藏Id
 返回值 : success：1，responseFailure：0 ,-1-提交信息不全
 作者   : 张永亮
 *********************************************************************/
- (void)delFavWithDictionary:(NSDictionary *)parameters
                     success:(void (^)(id object))responseSuccess
                     failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

/*********************************************************************
 函数名称 : getFavListWithDictionary:
 函数描述 : 获取收藏列表接口（Fav_List）
 输入参数 : id：用户ID ,cid：应用ID ,type:消息种类 ,size：每页条数 ,page：页码
 返回值 : success（favsArray 存放收藏列表数据（数据为FavModel模型）），responseFailure（errCode、errorMsg）
 作者   : 张永亮
 *********************************************************************/
- (void)getFavListWithDictionary:(NSDictionary *)parameters
                         success:(void (^)(NSArray *favsArray))responseSuccess
                         failure:(void (^)(NSInteger errCode,NSString *errorMsg))responseFailure;

@end
