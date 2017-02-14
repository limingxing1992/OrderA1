//
//  BusinessManager.h
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

@interface BusinessManager : NSObject

@property (nonatomic, strong) UserManager *userManager;
@property (nonatomic, strong) AdvManager *advManager;
@property (nonatomic, strong) HelpManager *helpManager;
@property (nonatomic, strong) NewsManager *newsManager;
@property (nonatomic, strong) SearchManager *searchManager;
@property (nonatomic, strong) CompanyManager *companyManager;
@property (nonatomic, strong) NeedsManager *needsManager;
@property (nonatomic, strong) BlogManager *blogManager;
@property (nonatomic, strong) OpenManager *openManager;
@property (nonatomic, strong) ShowManager *showManager;

/*********************************************************************
 函数名称 : shareBusinessManager:
 函数描述 : 共享默认实例` BusinessManager `。
 输入参数 :
 输出参数 :
 返回值 :
 作者   : 张永亮
 *********************************************************************/
+ (instancetype)shareBusinessManager;

@end
