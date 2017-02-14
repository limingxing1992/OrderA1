//
//  UserInfoViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/28.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "UserInfoViewController.h"
#import "STL_TextField.h"


#define ManTag 1000
#define WomanTag 1001
#define NickTag 1002
#define CompanyTag 1003
#define PhoneTag 1004
#define EmailTag 1005
#define AddressTag 1006
#define AddNumTag 1007
#define QQTag 1008
#define WeiBoTag 1009


@interface UserInfoViewController ()<UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>

/** 编辑按钮*/
@property (nonatomic, strong) UIButton *editBtn;
/** 头像*/
@property (nonatomic, strong) UIImageView *headIv;
/** 昵称标题*/
@property (nonatomic, strong) UILabel *nickNameTitleLb;
/** 昵称输入框*/
@property (nonatomic, strong) UITextField *nickNameTf;
/** 性别标题*/
@property (nonatomic, strong) UILabel *sexTitleLb;
/** 性别男按钮*/
@property (nonatomic, strong) UIButton *manBtn;
/** 性别女按钮*/
@property (nonatomic, strong) UIButton *womanBtn;
/** 单位*/
@property (nonatomic, strong) UILabel *companyTitleLb;
/** 单位输入框*/
@property (nonatomic, strong) UITextField *companyTextField;
/** 资料标题*/
@property (nonatomic, strong) UILabel *infoTitleLb;

/** 资料表*/
@property (nonatomic, strong) UIView *infoView;
/** 电话*/
@property (nonatomic, strong) STL_TextField *phoneTf;
/** 邮箱*/
@property (nonatomic, strong) STL_TextField *emailTf;
/** 地址*/
@property (nonatomic, strong) STL_TextField *addressTf;
/** 邮编*/
@property (nonatomic, strong) STL_TextField *addNumTf;
/** QQ*/
@property (nonatomic, strong) STL_TextField *qqTf;
/** 微博*/
@property (nonatomic, strong) STL_TextField *weiboTf;
/** 个人说明标题*/
@property (nonatomic, strong) UILabel *introduceTitleLb;
/** 个人说明*/
@property (nonatomic, strong) UITextView *introduceView;


/** 个人信息模型*/
@property (nonatomic, strong) UserInfoModel *model;



@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"我的资料";
    [self setNavi];
    [self.contentView sd_addSubviews:@[self.headIv,self.nickNameTitleLb, self.nickNameTf, self.sexTitleLb, self.manBtn, self.womanBtn, self.companyTitleLb, self.companyTextField]];
    [self.contentView addSubview:self.infoTitleLb];
    [self.contentView addSubview:self.infoView];
    //默认关闭编辑状态
    self.view.userInteractionEnabled = NO;
    
    
    [self loadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoLayoutTopSubviews];
    [self.contentView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + 80)];
}

- (void)autoLayoutTopSubviews{
    _headIv.sd_layout
    .topSpaceToView(self.contentView, 35)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(85)
    .widthEqualToHeight();
    [_headIv setSd_cornerRadius:@5];
    
    
    _nickNameTitleLb.sd_layout
    .leftSpaceToView(_headIv, 15)
    .topEqualToView(_headIv)
    .heightIs(16);
    [_nickNameTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _nickNameTf.sd_layout
    .centerYEqualToView(_nickNameTitleLb)
    .leftSpaceToView(_nickNameTitleLb, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(16);
    
    _sexTitleLb.sd_layout
    .centerYEqualToView(_headIv)
    .leftSpaceToView(_headIv, 15)
    .heightIs(16);
    [_sexTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    
    _manBtn.sd_layout
    .centerYEqualToView(_sexTitleLb)
    .leftSpaceToView(_sexTitleLb, 15)
    .heightIs(20)
    .widthIs(55);
    
    _womanBtn.sd_layout
    .centerYEqualToView(_sexTitleLb)
    .leftSpaceToView(_manBtn, 25)
    .heightIs(20)
    .widthIs(55);
    
    _companyTitleLb.sd_layout
    .bottomEqualToView(_headIv)
    .leftSpaceToView(_headIv, 15)
    .heightIs(16);
    [_companyTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    _companyTextField.sd_layout
    .centerYEqualToView(_companyTitleLb)
    .leftSpaceToView(_companyTitleLb, 15)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(16);

    _infoTitleLb.sd_layout
    .topSpaceToView(_headIv, 33)
    .leftEqualToView(_headIv)
    .autoHeightRatio(0);
    [_infoTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _infoView.sd_layout
    .topSpaceToView(_infoTitleLb, 3)
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .heightIs(310);
    [_infoView setSd_cornerRadius:@5];
    [self autoLayoutInfoViews];
}

- (void)autoLayoutInfoViews{
    _phoneTf.sd_layout
    .centerYIs(20)
    .leftSpaceToView(_infoView, 0)
    .rightSpaceToView(_infoView, 0)
    .heightIs(40);
    
    _emailTf.sd_layout
    .centerYIs(60)
    .leftSpaceToView(_infoView, 0)
    .rightSpaceToView(_infoView, 0)
    .heightIs(40);
    
    _addressTf.sd_layout
    .centerYIs(100)
    .leftSpaceToView(_infoView, 0)
    .rightSpaceToView(_infoView, 0)
    .heightIs(40);
    
    _addNumTf.sd_layout
    .centerYIs(140)
    .leftSpaceToView(_infoView, 0)
    .rightSpaceToView(_infoView, 0)
    .heightIs(40);
    
    _qqTf.sd_layout
    .centerYIs(180)
    .leftSpaceToView(_infoView, 0)
    .rightSpaceToView(_infoView, 0)
    .heightIs(40);
    
    _weiboTf.sd_layout
    .centerYIs(220)
    .leftSpaceToView(_infoView, 0)
    .rightSpaceToView(_infoView, 0)
    .heightIs(40);
    

    _introduceTitleLb.sd_layout
    .topSpaceToView(_weiboTf, 0.5)
    .leftSpaceToView(_infoView, 0)
    .widthIs(95)
    .heightIs(40);
    
    _introduceView.sd_layout
    .topEqualToView(_introduceTitleLb)
    .leftSpaceToView(_introduceTitleLb, 0)
    .rightSpaceToView(_infoView, 0)
    .bottomSpaceToView(_infoView, 0);

}

- (void)setNavi{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:self.editBtn];
    self.navigationItem.rightBarButtonItem = item;
}

#pragma mark ----------------数据

- (void)initData{
    _model = [[UserInfoModel alloc] init];
}

- (void)loadData{
    WeakObj(self);
    [SVProgressHUD showWithStatus:@"获取个人信息中"];
    [ShareBusinessManager.userManager getUserInfoWithDictionary:@{@"id":UserID} success:^(UserInfoModel *userInfoModel) {
        [SVProgressHUD dismiss];
        weakself.model = userInfoModel;
        [weakself upUI];
    } failure:^(NSInteger errCode, NSString *errorMsg) {
        [SVProgressHUD showErrorWithStatus:@"个人信息获取错误"];
    }];
}

- (void)upUI{
    //更新用户头型
    WeakObj(self);
    [ShareBusinessManager.userManager showUserLogoWithDictionary:@{@"id":UserID}
                                                         success:^(id object) {
                                                             
                                                             NSData *data = [AONEShareBusinessManager.userManager getImageDataByEncodingString:object];
                                                             UIImage *img = [UIImage imageWithData:data];
                                                             [weakself.headIv setImage:img];
                                                             [UserDefault setObject:object forKey:@"userLogo"];
//                                                             NSString *sry = [[NSString alloc] initWithData:object encoding:NSUTF8StringEncoding];
//                                                             UIImage *img = [UIImage imageWithData:ob];
                                                             
                                                         } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                             [SVProgressHUD showErrorWithStatus:@"头像加载失败"];
                                                         }];
    //更新用户昵称
    _nickNameTf.text = _model.realname;
    //更新用户性别
    if ([_model.sex isEqualToString:@"男"]) {
        _manBtn.enabled = NO;
    }else if([_model.sex isEqualToString:@"女"]){
        _womanBtn.enabled = NO;
    }
    //更新用户单位
    _companyTextField.text = _model.company;
    //更新用户电话
    [_phoneTf setTfText:_model.phone];//注册的时候传的手机号去哪了？黑人问号
    //更新邮箱
    [_emailTf setTfText:_model.email];
    //更新地址
    [_addressTf setTfText:_model.address];
    //更新邮编
    [_addNumTf setTfText:_model.postcode];
    //更新QQ
    [_qqTf setTfText:_model.qq];
    //更新微博
    [_weiboTf setTfText:_model.web];
    //更新个人说明
    [_introduceView setText:_model.des];

}


#pragma mark ----------------输入代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    switch (textField.tag) {
        case NickTag:
        {
            [_model setRealname:textField.text];
        }
            break;
        case CompanyTag:
        {
            [_model setCompany:textField.text];
        }
            break;
        case PhoneTag:
        {
            [_model setPhone:textField.text];
        }
            break;
        case EmailTag:
        {
                [_model setEmail:textField.text];
        }
            break;
        case AddressTag:
        {
            [_model setAddress:textField.text];
        }
            break;
        case AddNumTag:
        {
                [_model setPostcode:textField.text];
        }
            break;
        case QQTag:
        {
            [_model setQq:textField.text];
        }
            break;
        case WeiBoTag:
        {
            [_model setWeb:textField.text];
        }
            break;
        default:
            break;
    }

}

- (void)textViewDidEndEditing:(UITextView *)textView{
    [_model setDes:textView.text];
}



#pragma mark ----------------界面逻辑
/** 编辑动作*/
- (void)editAction{
    
    
    
    self.editBtn.selected = !self.editBtn.isSelected;
    self.view.userInteractionEnabled = self.editBtn.isSelected;

    if (_editBtn.isSelected) {
        //开始编辑
        [_phoneTf becomeFirstResponder];
    }else{
        //结束编辑
        
        if (!_model.sex.length || !_model.realname.length) {
            [SVProgressHUD showErrorWithStatus:@"请填写昵称和选择性别"];
            [self.editBtn setSelected:YES];
            self.view.userInteractionEnabled = self.editBtn.isSelected;
            return;
        }
        
        if ((![_model.phone validateMobile] && _model.phone.length)  || (![_model.email validateEmail] && _model.email.length)) {
            [SVProgressHUD showErrorWithStatus:@"信息格式有误,请重新填写"];
            [self.editBtn setSelected:YES];
            self.view.userInteractionEnabled = self.editBtn.isSelected;
            return;
        }
        
        [self.contentView setContentOffset:CGPointMake(0, 0)];
        [self.view endEditing:YES];
        [self uploadUserInfo];
    }
}
/** 选择性别*/
- (void)selectSexAction:(UIButton *)btn{
    
    btn.enabled = !btn.isEnabled;
    if (btn.tag == ManTag) {
        _womanBtn.enabled = YES;
        [_model setSex:@"男"];
    }else if(btn.tag == WomanTag){
        _manBtn.enabled = YES;
        [_model setSex:@"女"];
    }
}

/** 上传编辑信息*/
- (void)uploadUserInfo{
    NSDictionary *parameters = @{@"id":UserID,
                                 @"head":@"sex,company,email,address,des,realname,phone,qq,web,postcode",
                                 @"data":[NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@, %@, %@, %@, %@", _model.sex,
                                          _model.company, _model.email, _model.address, _model.des, _model.realname,
                                          _model.phone, _model.qq, _model.web, _model.postcode]};
    NSLog(@"%@", parameters);
    [ShareBusinessManager.userManager modifyUserInfoWithDictionary:parameters
                                                           success:^(id object) {
                                                               [SVProgressHUD showSuccessWithStatus:@"修改成功"];
                                                           } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                               [SVProgressHUD showErrorWithStatus:@"修改失败"];
                                                           }];
    
}
/** 编辑用户头像*/
- (void)upLoadHeadIv{
    
    [self.view endEditing:YES];
    
    WeakObj(self);
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action_cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *action_camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //拍照
        [weakself pickerImage:UIImagePickerControllerSourceTypeCamera];
        
    }];
    UIAlertAction *action_photo = [UIAlertAction actionWithTitle:@"选取相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相册
        [weakself pickerImage:UIImagePickerControllerSourceTypePhotoLibrary];
        
    }];
    [alertVc addAction:action_cancel];
    [alertVc addAction:action_camera];
    [alertVc addAction:action_photo];
    [self presentViewController:alertVc animated:YES completion:nil];

}
#pragma mark ---------图片选择

-(void)pickerImage:(UIImagePickerControllerSourceType)type
{
    //判断是否能用
    if ([UIImagePickerController isSourceTypeAvailable:type]) {
        UIImagePickerController *picker =[[UIImagePickerController alloc] init];
        picker.sourceType = type;
        picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        //        NSLog(@"不行");
        [SVProgressHUD showErrorWithStatus:@"相机无法启动"];
    }
    
    
}


#pragma mark ----------图片选择器代理



- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    self.headIv.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];

    
    NSData *data = UIImageJPEGRepresentation(self.headIv.image, 0.2f);

    NSString *imgStr = [AONEShareBusinessManager.userManager getImageStringByEncodingData:data];//[GTMBase64 stringByEncodingData:data];
    
    
    [ShareBusinessManager.userManager upUserLogoWithDictionary:@{@"id":UserID,
                                                                 @"data":imgStr}
                                                               success:^(id object) {
//                                                                   [SVProgressHUD showSuccessWithStatus:@"头像编辑成功"];
                                                               } failure:^(NSInteger errCode, NSString *errorMsg) {
    
                                                                   [SVProgressHUD showErrorWithStatus:@"头像上传失败"];
                                                               }];
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark ----------------实例

- (UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
        _editBtn.titleLabel.font = FONT(14);
        [_editBtn setBackgroundImage:IMAGE(@"bg_btClear") forState:UIControlStateNormal];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBtn setTitle:@"完成" forState:UIControlStateSelected];
        [_editBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_editBtn addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _editBtn;
}

- (UIImageView *)headIv{
    if (!_headIv) {
        _headIv = [[UIImageView alloc] init];
        _headIv.image = IMAGE(@"pic_person");
        _headIv.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(upLoadHeadIv)];
        [_headIv addGestureRecognizer:tap];
    }
    return _headIv;
}

- (UILabel *)nickNameTitleLb{
    if (!_nickNameTitleLb) {
        _nickNameTitleLb = [[UILabel alloc] init];
        _nickNameTitleLb.font = FONT(16);
        _nickNameTitleLb.textColor = BLACKTEXTCOLOR;
        _nickNameTitleLb.text = @"昵    称";
    }
    return _nickNameTitleLb;
}

- (UITextField *)nickNameTf{
    if (!_nickNameTf) {
        _nickNameTf = [[UITextField alloc] init];
        _nickNameTf.delegate = self;
        _nickNameTf.font = FONT(16);
        _nickNameTf.textColor = BLACKTEXTCOLOR;
        _nickNameTf.clearButtonMode = UITextFieldViewModeWhileEditing;
        _nickNameTf.returnKeyType = UIReturnKeyDone;
        _nickNameTf.tag = NickTag;
    }
    return _nickNameTf;



}

- (UILabel *)sexTitleLb{
    if (!_sexTitleLb) {
        _sexTitleLb = [[UILabel alloc] init];
        _sexTitleLb.font = FONT(16);
        _sexTitleLb.textColor = BLACKTEXTCOLOR;
        _sexTitleLb.text = @"性    别";
    }
    return _sexTitleLb;

}

- (UIButton *)manBtn{
    if (!_manBtn) {
        _manBtn = [[UIButton alloc] init];
        _manBtn.titleLabel.font = FONT(14);
        _manBtn.tag = ManTag;
        [_manBtn setImage:IMAGE(@"RadioButton-Unselected") forState:UIControlStateNormal];\
        [_manBtn setImage:IMAGE(@"RadioButton-Selected") forState:UIControlStateDisabled];
        [_manBtn setTitle:@"男" forState:UIControlStateNormal];
        [_manBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_manBtn addTarget:self action:@selector(selectSexAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _manBtn;
}

- (UIButton *)womanBtn{
    if (!_womanBtn) {
        _womanBtn = [[UIButton alloc] init];
        _womanBtn.titleLabel.font = FONT(14);
        _womanBtn.tag = WomanTag;
        [_womanBtn setImage:IMAGE(@"RadioButton-Unselected") forState:UIControlStateNormal];
        [_womanBtn setImage:IMAGE(@"RadioButton-Selected") forState:UIControlStateDisabled];
        [_womanBtn setTitle:@"女" forState:UIControlStateNormal];
        [_womanBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_womanBtn addTarget:self action:@selector(selectSexAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _womanBtn;

}

- (UILabel *)companyTitleLb{
    if (!_companyTitleLb) {
        _companyTitleLb = [[UILabel alloc] init];
        _companyTitleLb.font = FONT(16);
        _companyTitleLb.textColor = BLACKTEXTCOLOR;
        _companyTitleLb.text = @"单    位";
    }
    return _companyTitleLb;
}

- (UITextField *)companyTextField{
    if (!_companyTextField) {
        _companyTextField = [[UITextField alloc] init];
        _companyTextField.font = FONT(16);
        _companyTextField.textColor = BLACKTEXTCOLOR;
        _companyTextField.returnKeyType = UIReturnKeyDone;
        _companyTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _companyTextField.delegate = self;
        _companyTextField.tag = CompanyTag;
    }
    return _companyTextField;


}

- (UILabel *)infoTitleLb{
    if (!_infoTitleLb) {
        _infoTitleLb = [[UILabel alloc] init];
        _infoTitleLb.font = [UIFont boldSystemFontOfSize:16.0];
        _infoTitleLb.textColor = [UIColor redColor];
        _infoTitleLb.text = @"资料详情";
    }
    return _infoTitleLb;
}

- (UIView *)infoView{
    if (!_infoView) {
        _infoView = [[UIView alloc] init];
        _infoView.layer.borderColor = GRAYCOLOR.CGColor;
        _infoView.layer.borderWidth = 0.5;
        for (NSInteger i = 0; i < 6; i++) {
            UIView *lineView = [[UIView alloc] init];
            lineView.backgroundColor = GRAYCOLOR;
            [_infoView addSubview:lineView];
            lineView.frame = CGRectMake(0, 40 +40 *i, SCREEN_WIDTH - 20, 0.5);
        }
        [_infoView sd_addSubviews:@[self.phoneTf,self.emailTf, self.addressTf, self.addNumTf, self.qqTf, self.weiboTf, self.introduceTitleLb,self.introduceView]];
    }
    return _infoView;
}

- (STL_TextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[STL_TextField alloc] initWithTitle:@"移动电话" placeHolder:nil];
        _phoneTf.delegate = self;
        _phoneTf.tag = PhoneTag;
    }
    return _phoneTf;

}

- (STL_TextField *)emailTf{
    if (!_emailTf) {
        _emailTf = [[STL_TextField alloc] initWithTitle:@"电子邮箱" placeHolder:nil];
        _emailTf.delegate = self;
        _emailTf.tag = EmailTag;
    }
    return _emailTf;

}

- (STL_TextField *)addressTf{
    if (!_addressTf) {
        _addressTf = [[STL_TextField alloc] initWithTitle:@"详细地址" placeHolder:nil];
        _addressTf.delegate = self;
        _addressTf.tag = AddressTag;
    }
    return _addressTf;

}

- (STL_TextField *)addNumTf{
    if (!_addNumTf) {
        _addNumTf = [[STL_TextField alloc] initWithTitle:@"邮        编" placeHolder:nil];
        _addNumTf.delegate = self;
        _addNumTf.tag = AddNumTag;
    }
    return _addNumTf;


}

- (STL_TextField *)qqTf{
    if (!_qqTf) {
        _qqTf = [[STL_TextField alloc] initWithTitle:@"Q         Q" placeHolder:nil];
        _qqTf.delegate = self;
        _qqTf.tag = QQTag;
    }
    return _qqTf;
}

- (STL_TextField *)weiboTf{
    if (!_weiboTf) {
        _weiboTf = [[STL_TextField alloc] initWithTitle:@"微        博" placeHolder:nil];
        _weiboTf.delegate = self;
        _weiboTf.tag = WeiBoTag;
    }
    return _weiboTf;
}

- (UILabel *)introduceTitleLb{
    if (!_introduceTitleLb) {
        _introduceTitleLb = [[UILabel alloc] init];
        _introduceTitleLb.font = FONT(16);
        _introduceTitleLb.textColor = BLACKTEXTCOLOR;
        _introduceTitleLb.text = @"个人说明";
        _introduceTitleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _introduceTitleLb;
}

- (UITextView *)introduceView{
    if (!_introduceView) {
        _introduceView = [[UITextView alloc] init];
        _introduceView.font = FONT(16);
        _introduceView.textColor = BLACKTEXTCOLOR;
        _introduceView.delegate = self;
    }
    return _introduceView;

}

@end
