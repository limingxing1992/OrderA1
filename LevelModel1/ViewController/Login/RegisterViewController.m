//
//  RegisterViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRuleViewController.h"
#import "STL_TextField.h"


@interface RegisterViewController ()<UITextFieldDelegate>

/** 输入框按钮*/
@property (nonatomic, strong) UIImageView *registerbackIv;
/** 账号*/
@property (nonatomic, strong)  STL_TextField *nameTf;
/** 密码*/
@property (nonatomic, strong)  STL_TextField *passwordTf;
/** 确认密码*/
@property (nonatomic, strong)  STL_TextField *surePassTf;
/** 邮箱*/
@property (nonatomic, strong)  STL_TextField *emailTf;
/** 电话*/
@property (nonatomic, strong)  STL_TextField *phoneTf;


/** 同意按钮*/
@property (nonatomic, strong) UIButton *agreenBtn;
/** 查看协议按钮*/
@property (nonatomic, strong) UIButton *lookRuleBtn;
/** 注册按钮*/
@property (nonatomic, strong) UIButton *registerBtn;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"注册";
    [self.contentView addSubview:self.registerbackIv];
    [self.contentView addSubview:self.agreenBtn];
    [self.contentView addSubview:self.lookRuleBtn];
    [self.contentView addSubview:self.registerBtn];
    
    [self.contentView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + 60)];//输入框比较多，防止弹出键盘遮住输入框
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
    _registerbackIv.sd_layout
    .topSpaceToView(self.contentView, 50)
    .leftSpaceToView(self.contentView, 20)
    .rightSpaceToView(self.contentView, 20)
    .heightIs(250);
    
    _nameTf.sd_layout
    .centerYIs(25)
    .leftSpaceToView(_registerbackIv, 0)
    .rightSpaceToView(_registerbackIv, 0)
    .heightIs(45);
    
    _passwordTf.sd_layout
    .centerYIs(75)
    .leftSpaceToView(_registerbackIv, 0)
    .rightSpaceToView(_registerbackIv, 0)
    .heightIs(45);

    _surePassTf.sd_layout
    .centerYIs(125)
    .leftSpaceToView(_registerbackIv, 0)
    .rightSpaceToView(_registerbackIv, 0)
    .heightIs(45);

    _emailTf.sd_layout
    .centerYIs(175)
    .leftSpaceToView(_registerbackIv, 0)
    .rightSpaceToView(_registerbackIv, 0)
    .heightIs(45);

    _phoneTf.sd_layout
    .centerYIs(225)
    .leftSpaceToView(_registerbackIv, 0)
    .rightSpaceToView(_registerbackIv, 0)
    .heightIs(45);

    
    
    
    _agreenBtn.sd_layout
    .topSpaceToView(_registerbackIv, 20)
    .leftSpaceToView(self.contentView, 20)
    .heightIs(20)
    .widthIs(150);
    
    _lookRuleBtn.sd_layout
    .centerYEqualToView(_agreenBtn)
    .leftSpaceToView(_agreenBtn, 10)
    .heightIs(20)
    .widthIs(150);
    
    _registerBtn.sd_layout
    .topSpaceToView(_lookRuleBtn, 20)
    .rightSpaceToView(self.contentView, 30)
    .heightIs(40)
    .widthIs(90);
}



#pragma mark ----------------界面逻辑
/** 同意规则*/
- (void)agreeAction{
    _agreenBtn.selected = !_agreenBtn.isSelected;
}
/** 查看协议*/
- (void)lookRuleAction{
    RegisterRuleViewController *ruleVc = [[RegisterRuleViewController alloc] init];
    [self.navigationController pushViewController:ruleVc animated:YES];
}
/** 注册动作*/
- (void)registerAction{
    
    if (!_agreenBtn.isSelected) {
        //未同意规则，不允许注册
        [SVProgressHUD showErrorWithStatus:@"请阅读同意协议并同意"];
        return;
    }
    
    [self.view endEditing:YES];
    
    
    
    if (_nameTf.text.length < 3 || _nameTf.text.length >20) {
        [SVProgressHUD showErrorWithStatus:@"账号信息有误"];
        return;
    }
    
    if (_passwordTf.text.length < 6 || _passwordTf.text.length >20) {
        [SVProgressHUD showErrorWithStatus:@"密码输入有误"];
    }
    
    if (![_surePassTf.text isEqualToString:_passwordTf.text]) {
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致，请重新输入"];
        return;
    }
    
    if (![_emailTf.text validateEmail]) {
        [SVProgressHUD showErrorWithStatus:@"邮箱输入有误"];
        return;
    }
    
    if (![_phoneTf.text validateMobile]) {
        [SVProgressHUD showErrorWithStatus:@"手机输入有误"];
        return;
    }
    
    
    
    
    //注册
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    [dict setValue:APPCID forKey:@"obj.cid"];//设置应用id
    [dict setValue:@"local" forKey:@"obj.type"];//注册类型 1== 个人 2== 公司
    [dict setValue:_nameTf.text forKey:@"obj.username"];
    [dict setValue:_passwordTf.text forKey:@"obj.password"];
    [dict setValue:_emailTf.text forKey:@"obj.email"];
    [dict setValue:_phoneTf.text forKey:@"obj.tel"];
    
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
    WeakObj(self);
    [SVProgressHUD showWithStatus:@"注册中"];
    [ShareBusinessManager.userManager userRegWithDictionary:dict
                                                    success:^(id object) {
                                                        [SVProgressHUD showSuccessWithStatus:@"注册成功，请重新登录"];
                                                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                            [weakself.navigationController popViewControllerAnimated:YES];
                                                        });
                                                    } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                        NSString *str;
                                                        /** -1：账户已存在 ,-2：昵称已存在 ,-3：未输入验证码 ,-4：验证码过期 ,-5：验证码错误*/
                                                        switch (errCode) {
                                                            case -1:
                                                                str = @"用户已注册";
                                                                break;
                                                            case -2:
                                                                str = @"昵称已存在";
                                                                break;
                                                            case -3:
                                                                str = @"未输入验证码";
                                                                break;
                                                            case -4:
                                                                str = @"验证码过期";
                                                                break;
                                                            case -5:
                                                                str = @"验证码错误";
                                                                break;
                                                                
                                                            default:
                                                                break;
                                                        }
                                                        [SVProgressHUD showErrorWithStatus:str];

                                                    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark ----------------实例


- (UIImageView *)registerbackIv{
    if (!_registerbackIv) {
        _registerbackIv = [[UIImageView alloc] init];
        _registerbackIv.image = IMAGE(@"bg_register");
        [_registerbackIv addSubview:self.nameTf];
        [_registerbackIv addSubview:self.passwordTf];
        [_registerbackIv addSubview:self.surePassTf];
        [_registerbackIv addSubview:self.emailTf];
        [_registerbackIv addSubview:self.phoneTf];
        
        _registerbackIv.userInteractionEnabled = YES;
    }
    return _registerbackIv;
}

- (STL_TextField *)nameTf{
    if (!_nameTf) {
        _nameTf = [[STL_TextField alloc] initWithTitle:@"账        号：" placeHolder:@"用户名长度3-20位"];
        _nameTf.delegate = self;
    }
    return _nameTf;
}

- (STL_TextField *)passwordTf{
    if (!_passwordTf) {
        _passwordTf = [[STL_TextField alloc] initWithTitle:@"密         码：" placeHolder:@"6-12位，区分大小写"];
        _passwordTf.delegate = self;
    }
    return _passwordTf;
}

- (STL_TextField *)surePassTf{
    if (!_surePassTf) {
        _surePassTf = [[STL_TextField alloc] initWithTitle:@"确认密码：" placeHolder:@"请再次输入您的密码"];
        _surePassTf.delegate = self;
    }
    return _surePassTf;
}

- (STL_TextField *)emailTf{
    if (!_emailTf) {
        _emailTf = [[STL_TextField alloc] initWithTitle:@"邮       箱：" placeHolder:@"请输入您的邮箱"];
        _emailTf.delegate = self;
    }
    return _emailTf;
}

- (STL_TextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[STL_TextField alloc] initWithTitle:@"手         机：" placeHolder:@"请输入您的手机号码"];
        _phoneTf.delegate = self;
    }
    return _phoneTf;
}




- (UIButton *)agreenBtn{
    if (!_agreenBtn) {
        _agreenBtn = [[UIButton alloc] init];
        _agreenBtn.titleLabel.font = FONT(16);
        [_agreenBtn setImage:IMAGE(@"key_rem") forState:UIControlStateNormal];
        [_agreenBtn setImage:IMAGE(@"key_rem2") forState:UIControlStateSelected];
        [_agreenBtn setTitle:@"我已阅读并同意" forState:UIControlStateNormal];
        [_agreenBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_agreenBtn addTarget:self action:@selector(agreeAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _agreenBtn;
}

- (UIButton *)lookRuleBtn{
    if (!_lookRuleBtn) {
        _lookRuleBtn = [[UIButton alloc] init];
        _lookRuleBtn.titleLabel.font = FONT(16);
        [_lookRuleBtn setTitle:@"使用条款和隐私政策" forState:UIControlStateNormal];
        [_lookRuleBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_lookRuleBtn addTarget:self action:@selector(lookRuleAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _lookRuleBtn;
}

- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setBackgroundImage:IMAGE(@"registerBtn") forState:UIControlStateNormal];
        [_registerBtn addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}

@end
