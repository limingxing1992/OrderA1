//
//  ShowDetailViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2017/1/3.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "ShowDetailViewController.h"

@interface ShowDetailViewController ()<UIWebViewDelegate, UITextFieldDelegate>
/** 头像*/
@property (nonatomic, strong) UIImageView *logoIv;
/** 展会标题*/
@property (nonatomic, strong) UILabel *titleLb;
/** 时间*/
@property (nonatomic, strong) UILabel *timeLb;
/** 展会状态*/
@property (nonatomic, strong) UILabel *styleLb;
/** 横线1*/
@property (nonatomic, strong) UIView *line_0;
/** 横线2*/
@property (nonatomic, strong) UIView *line_1;
/** 横线3*/
@property (nonatomic, strong) UIView *line_2;

/** 地址图标*/
@property (nonatomic, strong) UIImageView *addressIv;
/** 房屋图标*/
@property (nonatomic, strong) UIImageView *companyIv;
/** 地址标题*/
@property (nonatomic, strong) UILabel *addressTitleLb;
/** 主板单位标题*/
@property (nonatomic, strong) UILabel *companyTitleLb;


/** 地址*/
@property (nonatomic, strong) UILabel *addressLb;
/** 主板单位*/
@property (nonatomic, strong) UILabel *companyLb;
/** url*/
@property (nonatomic, strong) UIWebView *webView;

/** 收藏按钮*/
@property (nonatomic, strong) UIButton *favoriteBtn;
/** 分享按钮*/
@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) TravelCommentView *commentView;//评论组件


@end






@implementation ShowDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"详情";
    [self.contentView sd_addSubviews:@[self.logoIv, self.titleLb, self.timeLb, self.styleLb,
                                       self.line_0, self.line_1, self.line_2
                                       ,
                                       self.addressIv,self.addressTitleLb, self.addressLb,
                                       self.companyIv, self.companyTitleLb, self.companyLb]];
    [self.contentView addSubview:self.webView];
    [self.view addSubview:self.commentView];

    [self setNavi];

    [SVProgressHUD show];
    [NotificationCenter addObserver:self selector:@selector(keyBoardShowAction:) name:UIKeyboardWillShowNotification object:nil];
    [NotificationCenter addObserver:self selector:@selector(keyBoardHideAction:) name:UIKeyboardWillHideNotification object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoLayoutSubViews];
}

- (void)setNavi{
    UIBarButtonItem *itmeShare = [[UIBarButtonItem alloc] initWithCustomView:self.shareBtn];
    UIBarButtonItem *itmeFavo = [[UIBarButtonItem alloc] initWithCustomView:self.favoriteBtn];
    
    if ([_type isEqualToString:@"needs"]) {
        self.navigationItem.rightBarButtonItems = @[itmeFavo];
    }else{
        self.navigationItem.rightBarButtonItems = @[itmeShare, itmeFavo];
    }
    
    
}

- (void)dealloc{
    [NotificationCenter removeObserver:self];
}

#pragma mark ----------------webView代理

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    CGRect frame = webView.frame;
    
    frame.size.width = SCREEN_WIDTH;
    
    frame.size.height = 1;
    
    webView.scrollView.scrollEnabled = NO;
    
    webView.frame = frame;
    
    frame.size.height = webView.scrollView.contentSize.height;
    
    
    webView.frame = frame;
    
    [self.contentView setupAutoContentSizeWithBottomView:_webView bottomMargin:10];
    [SVProgressHUD dismiss];
}

#pragma mark ----------------监听输入框弹出和隐藏

- (void)keyBoardShowAction:(NSNotification *)fication{
    NSDictionary *info = [fication userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    WeakObj(self);
    [UIView animateWithDuration:0.15 animations:^{
        weakself.commentView.transform = CGAffineTransformMakeTranslation(0, -keyboardSize.height);
    }];
    
}

- (void)keyBoardHideAction:(NSNotification *)fication{
    WeakObj(self);
    
    [UIView animateWithDuration:0.15 animations:^{
        weakself.commentView.transform = CGAffineTransformIdentity;
    }];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([[[UITextInputMode currentInputMode] primaryLanguage]isEqualToString:@"emoji"]) {
        [SVProgressHUD showErrorWithStatus:@"暂不支持表情符号，请重新输入"];
        return NO;
        
    }
    
    return YES;
    
}
- (void)loadData{
    
    NSURL *url = [ShareBusinessManager.showManager getShowDetailUrlWithID:_Id];
    if (url) {
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    
}

/** 发表评论*/
- (void)postComment{
    //发送评论
    /*********************************************************************
     函数名称 : addDiscussWithDictionary:
     函数描述 : 发布评论接口（DisAll_Add）
     输入参数 : obj.linkid：信息链接ID，obj.type：信息类型，obj.title：信息标题，obj.logo：图片，obj.content：信息内容
     obj.regtime：发布时间，obj.examin：检测，obj.uid：发布人ID，obj.cid：应用ID
     返回值 : success：1，responseFailure：0
     作者   : 张永亮
     *********************************************************************/
    if (!IsLogin) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    
    [_commentView.commentTf resignFirstResponder];
    if (_commentView.commentTf.text.length == 0 ) {
        [SVProgressHUD showErrorWithStatus:@"请输入评论内容"];
        return;
    }
    NSString *time = [NSDate jk_stringWithDate:[NSDate date] format:[NSDate jk_ymdHmsFormat]];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setValue:_Id forKey:@"obj.linkid"];
    [dict setValue:_type forKey:@"obj.type"];
    [dict setValue:_commentView.commentTf.text forKey:@"obj.content"];
    [dict setValue:time forKey:@"obj.regtime"];
    [dict setValue:APPCID forKey:@"obj.cid"];
    [dict setValue:UserID forKey:@"obj.uid"];
    [dict setValue:_titleText forKey:@"obj.title"];
    [dict setValue:[UserDefault objectForKey:@"userLogo"] forKey:@"obj.logo"];
    
    WeakObj(self);
    [ShareBusinessManager.newsManager addDiscussWithDictionary:dict
                                                       success:^(id object) {
                                                           [SVProgressHUD showSuccessWithStatus:@"评论成功"];
                                                           [weakself loadData];
                                                       } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                           [SVProgressHUD showErrorWithStatus:@"评论失败"];
                                                       }];
    _commentView.commentTf.text = @"";//评论完成后清空输入框
    
}

#pragma mark ----------------输入代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_commentView.commentTf resignFirstResponder];
    [self postComment];
    return YES;
}


#pragma mark ----------------自动布局


- (void)autoLayoutSubViews{
    _logoIv.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(280);
    
    _titleLb.sd_layout
    .topSpaceToView(_logoIv, 5)
    .leftSpaceToView(self.contentView, 10)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    _timeLb.sd_layout
    .topSpaceToView(_titleLb, 22)
    .leftEqualToView(_titleLb)
    .heightIs(15);
    [_timeLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _styleLb.sd_layout
    .rightSpaceToView(self.contentView, 15)
    .topEqualToView(_timeLb)
    .autoHeightRatio(0);
    [_styleLb setSingleLineAutoResizeWithMaxWidth:200];
    
    _line_0.sd_layout
    .topSpaceToView(_timeLb, 15)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    _line_1.sd_layout
    .topSpaceToView(_line_0, 50)
    .leftSpaceToView(self.contentView, 50)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    
    _line_2.sd_layout
    .topSpaceToView(_line_1, 50)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    _addressIv.sd_layout
    .topSpaceToView(_line_0, 12.5)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(25)
    .widthIs(20);
    
    _addressTitleLb.sd_layout
    .centerYEqualToView(_addressIv)
    .leftEqualToView(_line_1)
    .autoHeightRatio(0);
    [_addressTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _companyIv.sd_layout
    .bottomSpaceToView(_line_2, 15)
    .centerXEqualToView(_addressIv)
    .heightIs(20)
    .widthIs(17);
    
    _companyTitleLb.sd_layout
    .centerYEqualToView(_companyIv)
    .leftEqualToView(_line_1)
    .autoHeightRatio(0);
    [_companyTitleLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _addressLb.sd_layout
    .centerYEqualToView(_addressTitleLb)
    .leftSpaceToView(_addressTitleLb, 5)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    _companyLb.sd_layout
    .centerYEqualToView(_companyIv)
    .leftSpaceToView(_companyTitleLb, 5)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    _webView.sd_layout
    .topSpaceToView(_line_2, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0);
}

#pragma mark ----------------收藏和分享

- (void)collectAction{
    
    if (!IsLogin) {
        [SVProgressHUD showErrorWithStatus:@"请先登录"];
        return;
    }
    
    [SVProgressHUD show];
    [ShareBusinessManager.userManager addFavWithDictionary:@{@"obj.uid":UserID,
                                                             @"obj.infotype":_type,
                                                             @"obj.infoid":_Id}
                                                   success:^(id object) {
                                                       [SVProgressHUD showSuccessWithStatus:@"收藏成功"];
                                                   } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                       [SVProgressHUD showErrorWithStatus:@"已收藏"];
                                                   }];
}

- (void)shareAction{
    
    WeakObj(self);
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMShareMenuSelectionView *shareSelectionView, UMSocialPlatformType platformType) {
        [weakself shareDataWithPlatform:platformType];
    }];
    
}
- (void)shareDataWithPlatform:(UMSocialPlatformType)platformType{
    // 创建UMSocialMessageObject实例进行分享
    // 分享数据对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    messageObject.text = @"分享高尔夫";
    
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id result, NSError *error) {
        NSString *message = nil;
        if (!error) {
            message = [NSString stringWithFormat:@"分享成功"];
        } else {
            message = [NSString stringWithFormat:@"失败原因Code: %d\n",(int)error.code];
            
        }
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"share"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                              otherButtonTitles:nil];
        [alert show];
        
    }];
    
}

#pragma mark ----------------实例化


- (UIImageView *)logoIv{
    if (!_logoIv) {
        _logoIv = [[UIImageView alloc] init];
        [_logoIv sd_setImageWithURL:LOGOURL(_model.logo) placeholderImage:Placeholder_big];
    }
    return _logoIv;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(20);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = _model.title;
    }
    return _titleLb;
}

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(15);
        _timeLb.textColor = SHENTEXTCOLOR;
        _timeLb.text = [NSString stringWithFormat:@"%@至%@", _model.starttime, _model.endtime];
    }
    return _timeLb;
}

- (UILabel *)styleLb{
    if (!_styleLb) {
        _styleLb = [[UILabel alloc] init];
        _styleLb.font = FONT(20);
        _styleLb.textColor = [UIColor redColor];
        _styleLb.text = _model.status;
        if ([_model.status isEqualToString:@"未开始"]) {
            _styleLb.textColor = [UIColor redColor];
        }else{
            _styleLb.textColor = [UIColor greenColor];
        }
    }
    return _styleLb;
}

- (UIView *)line_0{
    if (!_line_0) {
        _line_0 = [[UIView alloc] init];
        _line_0.backgroundColor = GRAYCOLOR;
    }
    return _line_0;
}

- (UIView *)line_1{
    if (!_line_1) {
        _line_1 = [[UIView alloc] init];
        _line_1.backgroundColor = GRAYCOLOR;
    }
    return _line_1;
}

- (UIView *)line_2{
    if (!_line_2) {
        _line_2 = [[UIView alloc] init];
        _line_2.backgroundColor = GRAYCOLOR;
    }
    return _line_2;
}

- (UIImageView *)addressIv{
    if (!_addressIv) {
        _addressIv = [[UIImageView alloc] init];
        _addressIv.image = IMAGE(@"dt_map");
    }
    return _addressIv;
}

- (UIImageView *)companyIv{
    if (!_companyIv) {
        _companyIv = [[UIImageView alloc] init];
        _companyIv.image = IMAGE(@"dt_organizer");
    }
    return _companyIv;
}

- (UILabel *)addressTitleLb{
    if (!_addressTitleLb) {
        _addressTitleLb = [[UILabel alloc] init];
        _addressTitleLb.font = FONT(15);
        _addressTitleLb.textColor = BLACKTEXTCOLOR;
        _addressTitleLb.text = @"展出地址:";
    }
    return _addressTitleLb;
}

- (UILabel *)companyTitleLb{
    if (!_companyTitleLb) {
        _companyTitleLb = [[UILabel alloc] init];
        _companyTitleLb.font = FONT(15);
        _companyTitleLb.textColor = BLACKTEXTCOLOR;
        _companyTitleLb.text = @"主办单位:";
    }
    return _companyTitleLb;
}

- (UILabel *)addressLb{
    if (!_addressLb) {
        _addressLb = [[UILabel alloc] init];
        _addressLb.font = FONT(15);
        _addressLb.textColor = BLACKTEXTCOLOR;
        _addressLb.text = _model.address;
    }
    return _addressLb;
}

- (UILabel *)companyLb{
    if (!_companyLb) {
        _companyLb = [[UILabel alloc] init];
        _companyLb.font = FONT(15);
        _companyLb.textColor = BLACKTEXTCOLOR;
        _companyLb.text = _model.master;
    }
    return _companyLb;
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        NSURL *url = [ShareBusinessManager.showManager getShowDetailUrlWithID:_Id];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    return _webView;
}

- (UIButton *)favoriteBtn{
    if (!_favoriteBtn) {
        _favoriteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_favoriteBtn setImage:IMAGE(@"dt_collect") forState:UIControlStateNormal];
        [_favoriteBtn addTarget:self action:@selector(collectAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favoriteBtn;
}

- (UIButton *)shareBtn{
    if (!_shareBtn) {
        _shareBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_shareBtn setImage:IMAGE(@"dt_share") forState:UIControlStateNormal];
        [_shareBtn addTarget:self action:@selector(shareAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _shareBtn;
}

- (TravelCommentView *)commentView{
    if (_commentView == nil) {
        _commentView = [[TravelCommentView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 50 - NaviBar_HEIGHT, SCREEN_WIDTH, 50)];
        _commentView.backgroundColor = WHITECOLOR;
        WeakObj(self);
        _commentView.block = ^(){
            [weakself postComment];
        };
        _commentView.commentLb.text = @"发表";
        _commentView.commentTf.delegate = self;
    }
    return _commentView;
    
    
}


@end
