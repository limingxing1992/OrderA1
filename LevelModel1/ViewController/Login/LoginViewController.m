//
//  LoginViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "ReplacePasswordViewController.h"
#import "STL_TextField.h"

@interface LoginViewController ()<UITextFieldDelegate>

/** 电话*/
@property (nonatomic, strong) STL_TextField *phoneTf;
/** 密码输入*/
@property (nonatomic, strong) STL_TextField *passwordTf;
/** 登录背景*/
@property (nonatomic, strong) UIImageView *loginBackIv;
/** 记住密码按钮*/
@property (nonatomic, strong) UIButton *remeberBtn;
/** 忘记密码按钮*/
@property (nonatomic, strong) UIButton *forgetBtn;
/** 登录按钮*/
@property (nonatomic, strong) UIButton *loginBtn;
/** 注册按钮*/
@property (nonatomic, strong) UIButton *registerBtn;
/** 登录信息*/
@property (nonatomic, strong) NSMutableDictionary *parameters;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.name = @"登录";
    self.isAutoBack = NO;
    [self setNavi];
    [self.view addSubview:self.loginBackIv];
    [self.view addSubview:self.remeberBtn];
    [self.view addSubview:self.forgetBtn];
    [self.view addSubview:self.loginBtn];
    
    
    if (_isUser) {
        self.showBack = NO;
    }

    
    if ([UserDefault objectForKey:@"phone"]) {
        [_remeberBtn setSelected:YES];
    }else{
        [_remeberBtn setSelected:NO];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];

    _loginBackIv.sd_layout
    .topSpaceToView(self.view, 50)
    .leftSpaceToView(self.view, 20)
    .rightSpaceToView(self.view, 20)
    .heightIs(100);
    
    
    _phoneTf.sd_layout
    .centerYIs(25)
    .leftSpaceToView(_loginBackIv, 0)
    .rightSpaceToView(_loginBackIv, 0)
    .heightIs(45);
    
    _passwordTf.sd_layout
    .centerYIs(75)
    .leftSpaceToView(_loginBackIv, 0)
    .rightSpaceToView(_loginBackIv, 0)
    .heightIs(45);

    _remeberBtn.sd_layout
    .topSpaceToView(_loginBackIv, 45)
    .leftSpaceToView(self.view, 20)
    .heightIs(18)
    .widthIs(140);
    
    _forgetBtn.sd_layout
    .centerYEqualToView(_remeberBtn)
    .rightSpaceToView(self.view, 20)
    .heightIs(18)
    .widthIs(120);
    
    _loginBtn.sd_layout
    .topSpaceToView(_forgetBtn, 10)
    .centerXEqualToView(_forgetBtn)
    .heightIs(40)
    .widthIs(90);
    [_loginBtn setSd_cornerRadius:@6];
    
    self.tabBarController.tabBar.hidden = NO;
    

}


- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 禁用 iOS7 返回手势
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 开启
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}


- (void)leftBackAction{
    if (_isUser) {
        [self.navigationController popToRootViewControllerAnimated:NO];
        return;
    }
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)setNavi{
    UIBarButtonItem *registITem = [[UIBarButtonItem alloc] initWithCustomView:self.registerBtn];
    self.navigationItem.rightBarButtonItem = registITem;
}

- (void)dealloc{
    [NotificationCenter removeObserver:self name:LoginTextReceiveName object:nil];
}

- (void)initData{
    _parameters = [[NSMutableDictionary alloc] init];
}

#pragma mark ----------------界面逻辑

/** 注册操作*/
- (void)registerAction{
    RegisterViewController *registerVc = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerVc animated:YES];
}

/** 登录操作*/
- (void)loginAction{
    WeakObj(self);
    
    [_parameters removeAllObjects];
    [self.view endEditing:YES];
    if (!_phoneTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入账号"];
        return;
    }
    
    if (!_passwordTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    
    if (_remeberBtn.isSelected) {
        [UserDefault setObject:_phoneTf.text forKey:@"phone"];
        [UserDefault setObject:_passwordTf.text forKey:@"password"];
    }
    
    [ShareBusinessManager.userManager userLoginWithDictionary:@{@"username":_phoneTf.text,
                                                                @"password":_passwordTf.text}
                                                      success:^(id object) {
                                                          //登录成功
                                                          [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                                                          //存储用户id
                                                          [UserDefault setObject:object forKey:@"userId"];
                                                          /** 登录页面消失*/
                                                          [weakself leftBackAction];
                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                          NSString *str;
                                                          /** 0-账号不存在,-1-密码错误*/
                                                          switch (errCode) {
                                                              case 0:
                                                                  str = @"账号不存在";
                                                                  break;
                                                              case -1:
                                                                  str = @"密码错误";
                                                                  break;
                                                              default:
                                                                  break;
                                                          }
                                                          [SVProgressHUD showErrorWithStatus:str];
                                                      }];
    


}

/** 记住按钮操作*/
- (void)remeberAction{
    _remeberBtn.selected = !_remeberBtn.isSelected;
}

/** 忘记密码按钮*/
- (void)forgetAction{
    ReplacePasswordViewController *replaceVc = [[ReplacePasswordViewController alloc] init];
    [self.navigationController pushViewController:replaceVc animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark ----------------实例


- (UIImageView *)loginBackIv{
    if (!_loginBackIv) {
        _loginBackIv = [[UIImageView alloc] init];
        _loginBackIv.image = IMAGE(@"bg_login.@2xpng");
        [_loginBackIv addSubview:self.phoneTf];
        [_loginBackIv addSubview:self.passwordTf];
        _loginBackIv.userInteractionEnabled = YES;
    }
    return _loginBackIv;
}

- (STL_TextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[STL_TextField alloc] initWithTitle:@"账号：" placeHolder:@"请输入账号"];
        _phoneTf.delegate = self;
    }
    return _phoneTf;
}

- (STL_TextField *)passwordTf{
    if (!_passwordTf) {
        _passwordTf = [[STL_TextField alloc] initWithTitle:@"密码：" placeHolder:@"请输入密码"];
        _passwordTf.delegate = self;
        [_passwordTf setSecrityBOOL:YES];
    }
    return _passwordTf;
}

- (UIButton *)remeberBtn{
    if (!_remeberBtn) {
        _remeberBtn = [[UIButton alloc] init];
        [_remeberBtn setImage:IMAGE(@"key_rem") forState:UIControlStateNormal];
        [_remeberBtn setImage:IMAGE(@"key_rem2") forState:UIControlStateSelected];
        [_remeberBtn setTitle:@"记住密码？" forState:UIControlStateNormal];
        _remeberBtn.titleLabel.font = FONT(18);
        [_remeberBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_remeberBtn addTarget:self action:@selector(remeberAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _remeberBtn;



}

- (UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        _forgetBtn.titleLabel.font = FONT(18);
        [_forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:RGBColor(0, 124, 245) forState:UIControlStateNormal];
        [_forgetBtn addTarget:self action:@selector(forgetAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        _loginBtn.titleLabel.font = FONT(15);
        [_loginBtn setBackgroundImage:IMAGE(@"loginBtn") forState:UIControlStateNormal];
        [_loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}

- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        _registerBtn.titleLabel.font = FONT(15);
        [_registerBtn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setBackgroundImage:IMAGE(@"bg_btClear") forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;

}



@end
