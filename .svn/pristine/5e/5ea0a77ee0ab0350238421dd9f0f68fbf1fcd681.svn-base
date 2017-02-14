//
//  SendNeedsViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2017/1/1.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "SendNeedsViewController.h"

@interface SendNeedsViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UIImageView *starView_0;

@property (nonatomic, strong) UILabel *contentTitleLb;

@property (nonatomic, strong) UIImageView *starView_1;

@property (nonatomic, strong) UILabel *phoneTitlteLb;

@property (nonatomic, strong) UIImageView *starView_2;

@property (nonatomic, strong) UILabel *addressTitleLb;

@property (nonatomic, strong) UIImageView *starView_3;

@property (nonatomic, strong) UILabel *imgTitleLb;

@property (nonatomic, strong) UIImageView *starView_4;

/** 标题输入框*/
@property (nonatomic, strong) UITextField *titleTf;
/** 内容输入框*/
@property (nonatomic, strong) UITextView *contentTV;
/** 电话输入框*/
@property (nonatomic, strong) UITextField *phoneTf;
/** 地址输入框*/
@property (nonatomic, strong) UITextField *addressTf;
/** 图片选择*/
@property (nonatomic, strong) UIImageView *infoIv;

/** 发布按钮*/
@property (nonatomic, strong) UIButton *sendBtn;





@end

@implementation SendNeedsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"发布信息";
    [self.contentView sd_addSubviews:@[self.titleLb, self.starView_0, self.contentTitleLb, self.starView_1,
                                       self.phoneTitlteLb, self.starView_2, self.addressTitleLb, self.starView_3,
                                       self.imgTitleLb, self.starView_4]];

    [self.contentView sd_addSubviews:@[self.titleTf, self.contentTV, self.phoneTf, self.addressTf, self.infoIv]];
    [self.contentView addSubview:self.sendBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoLayoutSubViews];
}


- (void)autoLayoutSubViews{
    _titleLb.sd_layout
    .topSpaceToView(self.contentView, 20)
    .leftSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [_titleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _starView_0.sd_layout
    .centerYEqualToView(_titleLb)
    .leftSpaceToView(_titleLb, 5)
    .heightIs(8)
    .widthEqualToHeight();
    
    _contentTitleLb.sd_layout
    .topSpaceToView(_titleLb, 30)
    .leftEqualToView(_titleLb)
    .autoHeightRatio(0);
    [_contentTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _starView_1.sd_layout
    .centerYEqualToView(_contentTitleLb)
    .leftSpaceToView(_contentTitleLb, 5)
    .heightRatioToView(_starView_0, 1)
    .widthEqualToHeight();
    
    
    _phoneTitlteLb.sd_layout
    .topSpaceToView(_contentTitleLb, 100)
    .leftEqualToView(_contentTitleLb)
    .autoHeightRatio(0);
    [_phoneTitlteLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _starView_2.sd_layout
    .centerYEqualToView(_phoneTitlteLb)
    .leftSpaceToView(_contentTitleLb, 5)
    .heightRatioToView(_starView_1, 1)
    .widthEqualToHeight();
    
    _addressTitleLb.sd_layout
    .topSpaceToView(_phoneTitlteLb, 35)
    .leftEqualToView(_phoneTitlteLb)
    .autoHeightRatio(0);
    [_addressTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _starView_3.sd_layout
    .centerYEqualToView(_addressTitleLb)
    .leftSpaceToView(_addressTitleLb, 5)
    .heightRatioToView(_starView_1, 1)
    .widthEqualToHeight();
    
    
    _imgTitleLb.sd_layout
    .topSpaceToView(_addressTitleLb, 30)
    .leftEqualToView(_addressTitleLb)
    .autoHeightRatio(0);
    [_imgTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _starView_4.sd_layout
    .centerYEqualToView(_imgTitleLb)
    .leftSpaceToView(_imgTitleLb, 5)
    .heightRatioToView(_starView_1, 1)
    .widthEqualToHeight();
    
    _titleTf.sd_layout
    .topSpaceToView(self.contentView, 12)
    .leftSpaceToView(_starView_0, 3)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(45);
    [_titleTf setSd_cornerRadius:@5];
    
    _contentTV.sd_layout
    .topSpaceToView(_titleTf, 10)
    .leftEqualToView(_titleTf)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(110);
    [_contentTV setSd_cornerRadius:@5];
    
    _phoneTf.sd_layout
    .topSpaceToView(_contentTV, 13)
    .leftEqualToView(_titleTf)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(45);
    [_phoneTf setSd_cornerRadius:@5];
    
    _addressTf.sd_layout
    .topSpaceToView(_phoneTf, 13)
    .leftEqualToView(_titleTf)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(45);
    [_addressTf setSd_cornerRadius:@5];
    
    _infoIv.sd_layout
    .topSpaceToView(_addressTf, 10)
    .leftEqualToView(_addressTf)
    .heightIs(88)
    .widthEqualToHeight();
    
    _sendBtn.sd_layout
    .topSpaceToView(_infoIv, 13)
    .centerXEqualToView(self.contentView)
    .heightIs(50)
    .widthIs(225);
}


#pragma mark ----------------发布动作
/** 发布按钮*/
- (void)sendNeedsAction{
    
    if (!IsLogin) {
        [self presentViewController:LoginNavi animated:YES completion:nil];
        return;
    }
    
    [SVProgressHUD showWithStatus:@""];

    
    /*********************************************************************
     函数名称 : addNeedsWithDictionary:
     函数描述 : 新增供求关系接口（Needs_Add）
     输入参数 : obj.chid：栏目ID,obj.cid：应用ID,obj.uid：用户iD,obj.title：信息标题,
     obj.content：信息内容,obj.loge：图片,obj.tel：电话,obj.address：地址,obj.email：邮箱
     返回值 : success：1，responseFailure：0
     作者   : 张永亮
     *********************************************************************/
    NSString *imgStr = [CommenIdea image2ByteStr:self.infoIv.image];

    NSDictionary *dict = @{@"obj.chid":_chid,
                           @"obj.cid":APPCID,
                           @"obj.uid":UserID,
                           @"obj.title":_titleTf.text,
                           @"obj.content":_contentTV.text,
                           @"obj.tel":_phoneTf.text,
                           @"obj.address":_addressTf.text,
                           @"obj.type":_type,
                           @"obj.logo":imgStr};
    WeakObj(self);
    [ShareBusinessManager.needsManager addNeedsWithDictionary:dict
                                                      success:^(id object) {
                                                          [SVProgressHUD showSuccessWithStatus:@"发布成功，等待平台审核"];
                                                          [weakself.navigationController popViewControllerAnimated:YES];
                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                      }];

}
/** 选择图片*/
- (void)selectImg{
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
    
    self.infoIv.image = info[UIImagePickerControllerOriginalImage];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark ----------------实例

- (UIImageView *)starView_0{
    if (!_starView_0) {
        _starView_0 = [[UIImageView alloc] init];
        _starView_0.image = IMAGE(@"start");
    }
    return _starView_0;
}

- (UIImageView *)starView_1{
    if (!_starView_1) {
        _starView_1 = [[UIImageView alloc] init];
        _starView_1.image = IMAGE(@"start");
    }
    return _starView_1;
}

- (UIImageView *)starView_2{
    if (!_starView_2) {
        _starView_2 = [[UIImageView alloc] init];
        _starView_2.image = IMAGE(@"start");
    }
    return _starView_2;
}

- (UIImageView *)starView_3{
    if (!_starView_3) {
        _starView_3 = [[UIImageView alloc] init];
        _starView_3.image = IMAGE(@"start");
    }
    return _starView_3;
}

- (UIImageView *)starView_4{
    if (!_starView_4) {
        _starView_4 = [[UIImageView alloc] init];
        _starView_4.image = IMAGE(@"start");
    }
    return _starView_4;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(14);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = @"标题";
    }
    return _titleLb;
}

- (UILabel *)contentTitleLb{
    if (!_contentTitleLb) {
        _contentTitleLb = [[UILabel alloc] init];
        _contentTitleLb.font = FONT(14);
        _contentTitleLb.textColor = BLACKTEXTCOLOR;
        _contentTitleLb.text = @"内容";
    }
    return _contentTitleLb;
}

- (UILabel *)phoneTitlteLb{
    if (!_phoneTitlteLb) {
        _phoneTitlteLb = [[UILabel alloc] init];
        _phoneTitlteLb.font = FONT(14);
        _phoneTitlteLb.textColor = BLACKTEXTCOLOR;
        _phoneTitlteLb.text = @"联系";
    }
    return _phoneTitlteLb;
}

- (UILabel *)addressTitleLb{
    if (!_addressTitleLb) {
        _addressTitleLb = [[UILabel alloc] init];
        _addressTitleLb.font = FONT(14);
        _addressTitleLb.textColor = BLACKTEXTCOLOR;
        _addressTitleLb.text = @"地址";
    }
    return _addressTitleLb;
}

- (UILabel *)imgTitleLb{
    if (!_imgTitleLb) {
        _imgTitleLb = [[UILabel alloc] init];
        _imgTitleLb.font = FONT(14);
        _imgTitleLb.textColor = BLACKTEXTCOLOR;
        _imgTitleLb.text = @"图片";

    }
    return _imgTitleLb;
}

- (UIImageView *)infoIv{
    if (!_infoIv) {
        _infoIv = [[UIImageView alloc] init];
        _infoIv.image = IMAGE(@"selectBtn");
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(selectImg)];
        
        [_infoIv addGestureRecognizer:tap];
        _infoIv.userInteractionEnabled = YES;
        
    }
    return _infoIv;
}

- (UITextField *)titleTf{
    if (!_titleTf) {
        _titleTf = [[UITextField alloc] init];
        _titleTf.font = FONT(14);
        _titleTf.textColor = BLACKTEXTCOLOR;
        _titleTf.layer.borderWidth = 0.5;
        _titleTf.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _titleTf;
}

- (UITextView *)contentTV{
    if (!_contentTV) {
        _contentTV = [[UITextView alloc] init];
        _contentTV.font = FONT(14);
        _contentTV.textColor = BLACKTEXTCOLOR;
        _contentTV.layer.borderWidth = 0.5;
        _contentTV.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _contentTV;
}

- (UITextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[UITextField alloc] init];
        _phoneTf.font = FONT(14);
        _phoneTf.textColor = BLACKTEXTCOLOR;
        _phoneTf.layer.borderWidth = 0.5;
        _phoneTf.layer.borderColor = GRAYCOLOR.CGColor;

    }
    return _phoneTf;
}

- (UITextField *)addressTf{
    if (!_addressTf) {
        _addressTf = [[UITextField alloc] init];
        _addressTf.font = FONT(14);
        _addressTf.textColor = BLACKTEXTCOLOR;
        _addressTf.layer.borderWidth = 0.5;
        _addressTf.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _addressTf;
}

- (UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] init];
        [_sendBtn addTarget:self action:@selector(sendNeedsAction) forControlEvents:UIControlEventTouchUpInside];
        [_sendBtn setImage:IMAGE(@"publicBtn") forState:UIControlStateNormal];
    }
    return _sendBtn;
}

@end
