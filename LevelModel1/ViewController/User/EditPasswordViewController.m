//
//  EditPasswordViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/28.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "EditPasswordViewController.h"
#import "STL_TextField.h"
@interface EditPasswordViewController ()

/** 编辑按钮*/
@property (nonatomic, strong) UIButton *editBtn;

/** 背景框*/
@property (nonatomic, strong) UIImageView *backView;

/** 原密码输入框*/
@property (nonatomic, strong)  STL_TextField *oldPasswordTf;

/** 新密码输入框*/
@property (nonatomic, strong) STL_TextField *nePasswordTf;






@end


@implementation EditPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"修改密码";
    [self setNavi];
    [self.contentView addSubview:self.backView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _backView.sd_layout
    .topSpaceToView(self.contentView, 20)
    .leftSpaceToView(self.contentView, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(80);
    [_backView setSd_cornerRadius:@5];
    
    _oldPasswordTf.sd_layout
    .topSpaceToView(_backView, 0)
    .leftSpaceToView(_backView, 0)
    .rightSpaceToView(_backView, 0)
    .heightIs(40);
    
    _nePasswordTf.sd_layout
    .topSpaceToView(_backView, 40.5)
    .leftSpaceToView(_backView, 0)
    .rightSpaceToView(_backView, 0)
    .heightIs(40);

}


- (void)setNavi{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.editBtn];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark ----------------保存修改

- (void)sumbitEditAction{
    [self.view endEditing:YES];
    
    if (!_oldPasswordTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入旧密码"];
        return;
    }
    
    if (!_nePasswordTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入新密码"];
        return;
        
    }
    
    WeakObj(self);
    [ShareBusinessManager.userManager modifyUserPasswordWithDictionary:@{@"obj.uid":UserID,
                                                                         @"obj.password":_oldPasswordTf.text,
                                                                         @"password":_nePasswordTf.text}
                                                               success:^(id object) {
                                                                   [SVProgressHUD showSuccessWithStatus:@"修改成功，请重新登录"];
                                                                   //清除用户id缓存
                                                                   [UserDefault removeObjectForKey:@"userId"];
                                                                   //进入登录
                                                                   [weakself retLogin];
                                                               } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                   [SVProgressHUD showErrorWithStatus:@"修改失败"];
                                                               }];

}

/** 判断登录进入登录界面*/
- (void)retLogin{
    if (!IsLogin) {
        LoginViewController *loginVc = [[LoginViewController alloc] init];
        loginVc.isUser = YES;
        [self.navigationController pushViewController:loginVc animated:NO];
    }
}

#pragma mark ----------------实例

- (UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        _editBtn.titleLabel.font = FONT(14);
        [_editBtn setBackgroundImage:IMAGE(@"bg_btClear") forState:UIControlStateNormal];
        [_editBtn setTitle:@"修改" forState:UIControlStateNormal];
        [_editBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(sumbitEditAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}

- (UIImageView *)backView{
    if (!_backView) {
        _backView  = [[UIImageView alloc] initWithImage:IMAGE(@"bg_login.@2xpng")];
        [_backView sd_addSubviews:@[self.oldPasswordTf, self.nePasswordTf]];
        _backView.userInteractionEnabled = YES;
    }
    return _backView;
}

- (STL_TextField *)oldPasswordTf{
    if (!_oldPasswordTf) {
        _oldPasswordTf = [[STL_TextField alloc] initWithTitle:@"原密码：" placeHolder:@"请输入原密码"];
    }
    return _oldPasswordTf;
}

- (STL_TextField *)nePasswordTf{
    if (!_nePasswordTf) {
        _nePasswordTf = [[STL_TextField alloc] initWithTitle:@"新密码：" placeHolder:@"请输入新密码"];
    }
    return _nePasswordTf;
}

@end
