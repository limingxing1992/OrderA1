//
//  BaseTabBarViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "BaseTabBarViewController.h"
#import "BaseNaviViewController.h"
#import "HomeViewController.h"
#import "SearchViewController.h"
#import "UserViewController.h"
#import "CollectViewController.h"
#import "SettingViewController.h"
#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


@interface BaseTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setChildrenControllers];
    [self setupItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)setChildrenControllers{
    [self setupChildVc:[[HomeViewController alloc] init] title:@"首页" image:@"bt_home" selectedImage:@"bt_home2"];
    [self setupChildVc:[[SearchViewController alloc] init] title:@"搜索" image:@"bt_search" selectedImage:@"bt_search2"];
    [self setupChildVc:[[UserViewController alloc] init] title:@"个人" image:@"bt_person" selectedImage:@"bt_person2"];
    [self setupChildVc:[[CollectViewController alloc] init] title:@"收藏" image:@"bt_collect" selectedImage:@"bt_collect2"];
    [self setupChildVc:[[SettingViewController alloc] init] title:@"设置" image:@"bt_setting" selectedImage:@"bt_setting2"];
}


/**
 * 添加一个子控制器
 * @param title 文字
 * @param image 图片
 * @param selectedImage 选中时的图片
 */
- (void)setupChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    BaseNaviViewController *nav = [[BaseNaviViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
//    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UITabBarItem *item = [[UITabBarItem alloc] init];
    [item setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [item setTitle:title];
    nav.tabBarItem = item;
}

/**
 * 设置item属性
 */
- (void)setupItem
{
    [self.tabBar setTintColor:RGBColor(219, 189, 194)];
    
    if (Device_VERSION >= 10.0) {
        [self.tabBar setUnselectedItemTintColor:RGBColor(142, 110, 110)];
    }
    
    [self.tabBar setBarTintColor:RGBColor(10, 1, 1)];
}


@end
