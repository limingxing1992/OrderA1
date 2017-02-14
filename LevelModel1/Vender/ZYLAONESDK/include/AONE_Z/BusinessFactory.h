//
//  BusinessFactory.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/26.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserManager;
@class AdvManager;
@class HelpManager;
@class NewsManager;
@class SearchManager;
@class CompanyManager;
@class NeedsManager;
@class BlogManager;
@class OpenManager;
@class ShowManager;

@interface BusinessFactory : NSObject

/*
 用户信息
 */
- (UserManager *)createUserManager;

/*
 广告
 */
- (AdvManager *)createAdvManager;

/*
 帮助
 */
- (HelpManager *)createHelpManager;

/*
 资讯／栏目
 */
- (NewsManager *)createNewsManager;

/*
 搜索
 */
- (SearchManager *)createSearchManager;

/*
 企业
 */
- (CompanyManager *)createCompanyManager;

/*
 供求信息
 */
- (NeedsManager *)createNeedsManager;

/*
 blog
 */
- (BlogManager *)createBlogManager;

/*
 展会
 */
- (ShowManager *)createShowManager;

/*
 开放自定义网络请求
 */
- (OpenManager *)createOpenManager;

@end
