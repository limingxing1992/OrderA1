//
//  UserViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "UserViewController.h"
#import "UserInfoViewController.h"
#import "MyCommentViewController.h"
#import "MyFavoriteViewController.h"
#import "EditPasswordViewController.h"



@interface UserViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** 数据*/
@property (nonatomic, strong) NSArray *data;


@end

static NSString *const cellId = @"userListId";

@implementation UserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"个人中心";
    self.showBack = NO;
    self.isAutoBack = NO;
    
    [self.view addSubview:self.tableView];
    [self retLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark ----------------数据

- (void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"User" ofType:@"plist"];
    _data = [NSArray arrayWithContentsOfFile:path];
}

#pragma mark ----------------界面逻辑

/** 判断登录进入登录界面*/
- (void)retLogin{
    if (!IsLogin) {
        LoginViewController *loginVc = [[LoginViewController alloc] init];
        loginVc.isUser = YES;
        [self.navigationController pushViewController:loginVc animated:NO];
    }
}
/** 个人中心入口*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {//我的资料
            UserInfoViewController *infoVc = [[UserInfoViewController alloc] init];
            [self.navigationController pushViewController:infoVc animated:YES];
        }
            break;
        case 1:
        {//我的评论
            MyCommentViewController *commtVc = [[MyCommentViewController alloc] init];
            [self.navigationController pushViewController:commtVc animated:YES];
        }
            break;
        case 2:
        {//我的收藏
            MyFavoriteViewController *favoVc = [[MyFavoriteViewController alloc] init];
            [self.navigationController pushViewController:favoVc animated:YES];
        }
            break;
        case 3:
        {//修改密码
            EditPasswordViewController *editVc = [[EditPasswordViewController alloc] init];
            [self.navigationController pushViewController:editVc animated:YES];
        }
            break;
        case 4:
        {//注销
            //清除用户id缓存
            [UserDefault removeObjectForKey:@"userId"];
            //进入登录
            [self retLogin];
        }
            break;
        default:
            break;
    }
}


#pragma mark ----------------tableView代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.font = FONT(18);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.textColor = BLACKTEXTCOLOR;
    cell.accessoryView = [[UIImageView alloc] initWithImage:IMAGE(@"classify8-1")];
    cell.textLabel.text = _data[indexPath.row][@"title"];
    return cell;
}



#pragma mark ----------------实例

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
        _tableView.separatorColor = GRAYCOLOR;
        _tableView.separatorInset = UIEdgeInsetsZero;
    }
    return _tableView;

}


@end
