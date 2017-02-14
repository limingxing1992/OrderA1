//
//  ReplacePasswordViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/28.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "ReplacePasswordViewController.h"

#import "STL_TextField.h"


@interface ReplacePasswordViewController ()<UITextFieldDelegate>


/** 输入背景*/
@property (nonatomic, strong) UIImageView *replaceBackIv;

/** 账号输入*/
@property (nonatomic, strong) STL_TextField *phoneTf;
/** 邮箱输入*/
@property (nonatomic, strong) STL_TextField *emailTf;

/** 确定按钮*/
@property (nonatomic, strong) UIButton *sureBtn;


@end

@implementation ReplacePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"找回密码";
    [self.contentView addSubview:self.replaceBackIv];
    [self.contentView addSubview:self.sureBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _replaceBackIv.sd_layout
    .topSpaceToView(self.contentView, 20)
    .leftSpaceToView(self.contentView, 20)
    .rightSpaceToView(self.contentView, 20)
    .heightIs(100);
    
    _phoneTf.sd_layout
    .centerYIs(25)
    .leftSpaceToView(_replaceBackIv, 0)
    .rightSpaceToView(_replaceBackIv, 0)
    .heightIs(50);
    
    _emailTf.sd_layout
    .centerYIs(75)
    .leftSpaceToView(_replaceBackIv, 0)
    .rightSpaceToView(_replaceBackIv, 0)
    .heightIs(50);

    _sureBtn.sd_layout
    .topSpaceToView(_replaceBackIv, 20)
    .rightEqualToView(_replaceBackIv)
    .heightIs(35)
    .widthIs(85);
    [_sureBtn setSd_cornerRadius:@5];
    
}



#pragma mark ----------------界面逻辑


/*********************************************************************
 函数名称 : resetUserPasswordWithDictionary:
 函数描述 : 找回用户密码接口
 输入参数 : username  用户名/手机号 ,email  邮箱
 返回值 : success：1，responseFailure：0
 作者   : 张永亮*/
/** 确定*/
- (void)sureAction{
    [self.view endEditing:YES];
    if (!_phoneTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        return;
    }
    
    if (!_emailTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入邮箱"];
        return;
    }
    
    if (![_emailTf.text validateEmail]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确邮箱格式"];
        return;
    }
    [SVProgressHUD show];
    [ShareBusinessManager.userManager resetUserPasswordWithDictionary:@{@"username":_phoneTf.text,
                                                                        @"email":_emailTf.text}
                                                              success:^(id object) {
                                                                  [SVProgressHUD showSuccessWithStatus:@"验证码已发送至您的邮箱，请重新登录"];
                                                              } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                  [SVProgressHUD showErrorWithStatus:@"找回密码失败"];
                                                              }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark ----------------实例


- (UIImageView *)replaceBackIv{
    if (!_replaceBackIv) {
        _replaceBackIv = [[UIImageView alloc] initWithImage:IMAGE(@"bg_login.@2xpng")];
        [_replaceBackIv addSubview:self.phoneTf];
        [_replaceBackIv addSubview:self.emailTf];
        _replaceBackIv.userInteractionEnabled = YES;
    }
    return _replaceBackIv;
}

- (STL_TextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[STL_TextField alloc] initWithTitle:@"账号：" placeHolder:@"请输入账号"];
        _phoneTf.delegate = self;
    }
    return _phoneTf;
}

- (STL_TextField *)emailTf{
    if (!_emailTf) {
        _emailTf = [[STL_TextField alloc] initWithTitle:@"邮箱：" placeHolder:@"请输入邮箱"];
        _emailTf.delegate = self;
    }
    return _emailTf;
}


- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc] init];
        [_sureBtn setBackgroundColor:RGBColor(127, 127, 127)];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_sureBtn setTitleColor:WHITECOLOR forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = FONT(18);
        [_sureBtn addTarget:self action:@selector(sureAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}


@end
