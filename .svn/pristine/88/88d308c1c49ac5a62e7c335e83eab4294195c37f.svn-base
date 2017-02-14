//
//  AppDelegate.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/26.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "AppDelegate.h"
#import "CommonUncaughtExceptionHandler.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


/** 进入主界面*/
- (void)entoMainUI{
    _window.rootViewController = [[BaseTabBarViewController alloc] init];
}
/** 设置SVProgessHUD*/
- (void)settingSVProgressHUD{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.000 green:0.020 blue:0.059 alpha:0.85]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setMinimumDismissTimeInterval:1.0];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
}
/** 友盟设置*/
- (void)settingUMAPI{
    [[UMSocialManager defaultManager] openLog:YES];
    [[UMSocialManager defaultManager] setUmSocialAppkey:@"57e89256e0f55a827800043b"];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_QQ appKey:@"1105819767" appSecret:nil redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_WechatSession appKey:@"wx4bdeb11b1339f074" appSecret:@"e4ec5a00c84417b89a2bcc9250d2e935" redirectURL:nil];
    [[UMSocialManager defaultManager] setPlaform:UMSocialPlatformType_Sina appKey:@"2567990883"  appSecret:@"62326e4d7f9e8c24a633b932f89701d1" redirectURL:nil];
    [[UMSocialManager defaultManager] removePlatformProviderWithPlatformType:UMSocialPlatformType_WechatFavorite];//移除微信收藏
}
/** 业务域名设置*/
- (void)settingAPI{
    [ZYLAONESDK setServerHost:@"https://appserver.1035.mobi"];
}


#pragma mark ----------------主程序设置


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    _window.backgroundColor = [UIColor whiteColor];
    [self settingSVProgressHUD];//设置HUD
    [self settingUMAPI];//设置友盟
    [self settingAPI];
    
    
    [self entoMainUI];//进入主界面
    [_window makeKeyAndVisible];
    
    [CommonUncaughtExceptionHandler setDefaultHandler];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
