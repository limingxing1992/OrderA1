//
//  IdeaAboutEditViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/30.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "IdeaAboutEditViewController.h"

@interface IdeaAboutEditViewController ()

@property (nonatomic, strong) UILabel *phoneTitleLb;
@property (nonatomic, strong) UILabel *titleTitleLb;
@property (nonatomic, strong) UILabel *contentTitleLb;
@property (nonatomic, strong) UIImageView *starView_0;
@property (nonatomic, strong) UIImageView *starView_1;
@property (nonatomic, strong) UIImageView *starView_2;


/** 电话输入*/
@property (nonatomic, strong) UITextField *phoneTf;
/** 标题输入*/
@property (nonatomic, strong) UITextField *titleTf;
/** 内容输入*/
@property (nonatomic, strong) UITextView *contentTfView;
/** 发布按钮*/
@property (nonatomic, strong) UIButton *sendBtn;

@end

@implementation IdeaAboutEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"意见反馈";
    [self.contentView addSubview:self.phoneTitleLb];
    [self.contentView addSubview:self.titleTitleLb];
    [self.contentView addSubview:self.contentTitleLb];
    [self.contentView addSubview:self.starView_0];
    [self.contentView addSubview:self.starView_1];
    [self.contentView addSubview:self.starView_2];
    [self.contentView addSubview:self.phoneTf];
    [self.contentView addSubview:self.titleTf];
    [self.contentView addSubview:self.contentTfView];
    [self.contentView addSubview:self.sendBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoLayoutSubViews];
}


- (void)autoLayoutSubViews{
    _phoneTitleLb.sd_layout
    .topSpaceToView(self.contentView, 25)
    .leftSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    [_phoneTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    _starView_0.sd_layout
    .centerYEqualToView(_phoneTitleLb)
    .leftSpaceToView(_phoneTitleLb, 2)
    .widthIs(8)
    .heightIs(12);
    
    _titleTitleLb.sd_layout
    .topSpaceToView(_phoneTitleLb, 22)
    .leftSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    [_titleTitleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    _starView_1.sd_layout
    .centerYEqualToView(_titleTitleLb)
    .leftSpaceToView(_titleTitleLb, 2)
    .widthIs(8)
    .heightIs(12);
    
    
    _contentTitleLb.sd_layout
    .topSpaceToView(_titleTitleLb, 25)
    .leftSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    [_contentTitleLb setSingleLineAutoResizeWithMaxWidth:200];

    
    _starView_2.sd_layout
    .centerYEqualToView(_contentTitleLb)
    .leftSpaceToView(_contentTitleLb, 2)
    .widthIs(8)
    .heightIs(12);

    _phoneTf.sd_layout
    .centerYEqualToView(_phoneTitleLb)
    .leftSpaceToView(_starView_0, 3)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(36);
    
    _titleTf.sd_layout
    .centerYEqualToView(_titleTitleLb)
    .leftSpaceToView(_starView_1, 3)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(36);

    _contentTfView.sd_layout
    .topEqualToView(_contentTitleLb)
    .leftSpaceToView(_starView_2, 3)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(190);
    
    
    _sendBtn.sd_layout
    .topSpaceToView(_contentTfView, 10)
    .centerXEqualToView(self.contentView)
    .widthIs(230)
    .heightIs(50);
    
    [self.contentView setContentSize:CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT + 60)];
}

#pragma mark ----------------发布动作

- (void)sendACtion{
    
    [self.view endEditing:YES];
    
    if (!_phoneTf.text.length || ![_phoneTf.text validateMobile]) {
        [SVProgressHUD showErrorWithStatus:@"请输入正确联系电话"];
        return;
    }
    
    if (!_titleTf.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入标题"];
        return;
    }
    
    if (!_contentTfView.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入内容"];
        return;
    }
    
    
    NSString *time = [NSDate jk_stringWithDate:[NSDate date] format:[NSDate jk_ymdHmsFormat]];
    NSLog(@"%@",time);
    [SVProgressHUD show];
    WeakObj(self);
    [ShareBusinessManager.helpManager feedbackWithDictionary:@{@"obj.cid":APPCID,
                                                               @"obj.title":_titleTf.text,
                                                               @"obj.relation":_phoneTf.text,
                                                               @"obj.content":_contentTfView.text,
                                                               @"obj.uid":UserID,
                                                               @"obj.regtime":time}
                                                     success:^(id object) {
                                                         [SVProgressHUD showSuccessWithStatus:@"反馈已发送，谢谢您宝贵的意见"];
                                                         
                                                         dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                                                             [weakself.navigationController popViewControllerAnimated:YES];
                                                         });
                                                         
                                                     } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                         [SVProgressHUD showErrorWithStatus:@"反馈失败"];
                                                     }];
    
}



#pragma mark ----------------实例

- (UILabel *)phoneTitleLb{
    if (!_phoneTitleLb) {
        _phoneTitleLb = [[UILabel alloc] init];
        _phoneTitleLb.font = FONT(18);
        _phoneTitleLb.textColor = BLACKTEXTCOLOR;
        _phoneTitleLb.text= @"电话";
    }
    return _phoneTitleLb;
}

- (UILabel *)titleTitleLb{
    if (!_titleTitleLb) {
        _titleTitleLb = [[UILabel alloc] init];
        _titleTitleLb.font = FONT(18);
        _titleTitleLb.textColor = BLACKTEXTCOLOR;
        _titleTitleLb.text = @"标题";
    }
    return _titleTitleLb;
}

- (UILabel *)contentTitleLb{
    if (!_contentTitleLb) {
        _contentTitleLb = [[UILabel alloc] init];
        _contentTitleLb.font = FONT(18);
        _contentTitleLb.textColor = BLACKTEXTCOLOR;
        _contentTitleLb.text = @"内容";
    }
    return _contentTitleLb;
}

- (UIImageView *)starView_0{
    if (!_starView_0) {
        _starView_0 = [[UIImageView alloc] init];
        _starView_0.image  = IMAGE(@"start");
    }
    return _starView_0;
}

- (UIImageView *)starView_1{
    if (!_starView_1) {
        _starView_1 = [[UIImageView alloc] init];
        _starView_1.image  = IMAGE(@"start");
    }
    return _starView_1;
}
- (UIImageView *)starView_2{
    if (!_starView_2) {
        _starView_2 = [[UIImageView alloc] init];
        _starView_2.image  = IMAGE(@"start");
    }
    return _starView_2;
}

- (UITextField *)phoneTf{
    if (!_phoneTf) {
        _phoneTf = [[UITextField alloc] init];
        _phoneTf.placeholder = @"请输入您的电话";
        _phoneTf.textColor = BLACKTEXTCOLOR;
        _phoneTf.font = FONT(15);
        _phoneTf.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _phoneTf;
}

- (UITextField *)titleTf{
    if (!_titleTf) {
        _titleTf = [[UITextField alloc] init];
        _titleTf.placeholder = @"请输入标题";
        _titleTf.textColor = BLACKTEXTCOLOR;
        _titleTf.font = FONT(15);
        _titleTf.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _titleTf;
}


- (UITextView *)contentTfView{
    if (!_contentTfView) {
        _contentTfView = [[UITextView alloc] init];
        _contentTfView.font = FONT(15);
        _contentTfView.textColor = BLACKTEXTCOLOR;
        _contentTfView.layer.borderWidth = 1;
        _contentTfView.layer.borderColor = RGBColor(204, 204, 204).CGColor;
        _contentTfView.layer.cornerRadius = 5;
    }
    return _contentTfView;
}

- (UIButton *)sendBtn{
    if (!_sendBtn) {
        _sendBtn = [[UIButton alloc] init];
        [_sendBtn setImage:IMAGE(@"publicBtn") forState:UIControlStateNormal];
        [_sendBtn addTarget:self action:@selector(sendACtion) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendBtn;
}

@end
