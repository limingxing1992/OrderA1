//
//  CommenIdea.h
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommenIdea : NSObject

/** 获取登录模块导航*/
+ (UINavigationController *)loginNavi;
/** 判断登录*/
+ (BOOL)isLogin;
/** 拼接图片服务器路径*/
+ (NSURL *)imgUrl:(NSString *)str;
/** 图片上传*/
+(NSString*)image2ByteStr:(UIImage*)image;
@end
