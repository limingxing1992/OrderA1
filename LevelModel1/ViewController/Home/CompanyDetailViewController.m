//
//  CompanyDetailViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2017/1/4.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "CompanyDetailViewController.h"
#import <MapKit/MapKit.h>
@interface CompanyDetailViewController ()<UIWebViewDelegate>
/** 图*/
@property (nonatomic, strong) UIImageView *logoIv;
/** 标题图标*/
@property (nonatomic, strong) UIImageView *nameIv;
/** 标题*/
@property (nonatomic, strong) UILabel *nameLb;

/** 内容*/
@property (nonatomic, strong) UIWebView *webView;

/** 横线1*/
@property (nonatomic, strong) UIView *line_0;
/** 横线2*/
@property (nonatomic, strong) UIView *line_1;
/** 横线3*/
@property (nonatomic, strong) UIView *line_2;

/** 地址图标*/
@property (nonatomic, strong) UIImageView *addressIv;
/** 电话图标*/
@property (nonatomic, strong) UIImageView *phoneIv;


/** 地址*/
@property (nonatomic, strong) UILabel *addressLb;
/** 主板单位*/
@property (nonatomic, strong) UILabel *phoneLb;

/** 竖线1*/
@property (nonatomic, strong) UIView *pacing_0;
/** 竖线2*/
@property (nonatomic, strong) UIView *pacing_1;

/** 地图导航*/
@property (nonatomic, strong) UIButton *mapBtn;
/** 拨打电话*/
@property (nonatomic, strong) UIButton *callBtn;


/** 查看评论图标*/
@property (nonatomic, strong) UIImageView *commentIv;
/** 查看评论*/
@property (nonatomic, strong) UILabel *commentLb;
/** 右箭头*/
@property (nonatomic, strong) UIImageView *rightIv;
/** 底部线*/
@property (nonatomic, strong) UIView *bottomLineView;

/** 收藏按钮*/
@property (nonatomic, strong) UIButton *favoriteBtn;
/** 分享按钮*/
@property (nonatomic, strong) UIButton *shareBtn;




@end

@implementation CompanyDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];

    [self.contentView sd_addSubviews:@[self.logoIv, self.nameLb, self.nameIv,
                                       self.webView, self.line_0, self.line_1, self.line_2,
                                       self.addressIv, self.addressLb,
                                       self.phoneIv, self.phoneLb, self.pacing_0, self.pacing_1,
                                       self.mapBtn, self.callBtn, self.commentIv,
                                       self.commentLb, self.rightIv, self.bottomLineView]];
    [SVProgressHUD show];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoLayoutSubViews];
}

#pragma mark ----------------自动布局


- (void)autoLayoutSubViews{
    _logoIv.sd_layout
    .topSpaceToView(self.contentView, 70)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(120);
    
    _nameIv.sd_layout
    .topSpaceToView(_logoIv, 70)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(25)
    .widthIs(22);
    
    _nameLb.sd_layout
    .centerYEqualToView(_nameIv)
    .leftSpaceToView(_nameIv, 10)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    
    _webView.sd_layout
    .topSpaceToView(_nameLb, 25)
    .leftEqualToView(_nameIv)
    .rightEqualToView(_nameLb);
    
    
    _line_0.sd_layout
    .topSpaceToView(_webView, 0)
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

    _addressLb.sd_layout
    .centerYEqualToView(_addressIv)
    .leftEqualToView(_line_1)
    .rightSpaceToView(self.contentView, 0)
    .autoHeightRatio(0);
    
    _phoneIv.sd_layout
    .bottomSpaceToView(_line_2, 15)
    .centerXEqualToView(_addressIv)
    .heightIs(20)
    .widthIs(17);

    _phoneLb.sd_layout
    .centerYEqualToView(_phoneIv)
    .leftEqualToView(_addressLb)
    .rightEqualToView(_addressLb)
    .autoHeightRatio(0);
    
    _pacing_0.sd_layout
    .centerYEqualToView(_addressLb)
    .rightSpaceToView(self.contentView, 90)
    .widthIs(0.5)
    .heightIs(45);
    
    
    _pacing_1.sd_layout
    .centerYEqualToView(_phoneLb)
    .rightSpaceToView(self.contentView, 90)
    .widthIs(0.5)
    .heightIs(45);
    
    _mapBtn.sd_layout
    .centerYEqualToView(_addressLb)
    .rightSpaceToView(self.contentView, 10)
    .leftSpaceToView(_pacing_0, 10)
    .heightIs(45);
    
    _callBtn.sd_layout
    .centerYEqualToView(_phoneLb)
    .rightSpaceToView(self.contentView, 10)
    .leftSpaceToView(_pacing_0, 10)
    .heightIs(45);
    
    _bottomLineView.sd_layout
    .topSpaceToView(_line_2, 45)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(0.5);
    
    _commentIv.sd_layout
    .bottomSpaceToView(_bottomLineView, 15)
    .centerXEqualToView(_addressIv)
    .heightIs(20)
    .widthIs(17);
    
    _commentLb.sd_layout
    .centerYEqualToView(_commentIv)
    .leftEqualToView(_phoneLb)
    .autoHeightRatio(0);
    [_commentLb setSingleLineAutoResizeWithMaxWidth:300];
    
    _rightIv.sd_layout
    .centerYEqualToView(_commentIv)
    .rightSpaceToView(self.contentView, 15)
    .heightIs(12.5)
    .widthIs(7);
    
    [self.contentView setupAutoContentSizeWithBottomView:_bottomLineView bottomMargin:30];

}

#pragma mark ----------------界面
/** 查看地图*/
- (void)lookMapAction{
    
    MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];

    
    CLLocationCoordinate2D cordinate;
    cordinate.latitude = _model.maplat.floatValue;
    cordinate.longitude = _model.maplng.floatValue;
    
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:cordinate addressDictionary:nil]];
    toLocation.name = _model.title;
    [MKMapItem openMapsWithItems:@[currentLocation, toLocation]
                   launchOptions:@{MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving,MKLaunchOptionsShowsTrafficKey: [NSNumber numberWithBool:YES]}];
}
/** 打电话*/
- (void)callAction{
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"telprompt://%@",_model.tel];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
    
}
/** 查看评论*/
- (void)lookCommentListAction{
    CommentListViewController *commentVc = [[CommentListViewController alloc] init];
    commentVc.ID = _model.ID;
    commentVc.titleText = _model.title;
    commentVc.type = @"company";
    [self.navigationController pushViewController:commentVc animated:YES];
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

#pragma mark ----------------webView代理

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    CGRect frame = webView.frame;
    
    frame.size.width = SCREEN_WIDTH;
    
    frame.size.height = 1;
    
    webView.scrollView.scrollEnabled = NO;
    
    webView.frame = frame;
    
    frame.size.height = webView.scrollView.contentSize.height;
    
    
    webView.frame = frame;
    
//    [self.contentView setupAutoContentSizeWithBottomView:_webView bottomMargin:10];
    [SVProgressHUD dismiss];
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

#pragma mark ----------------实例

- (UIImageView *)logoIv{
    if (!_logoIv) {
        _logoIv = [[UIImageView alloc] init];
        [_logoIv sd_setImageWithURL:LOGOURL(_model.logo) placeholderImage:Placeholder_big];
    }
     return _logoIv;
}

- (UIImageView *)nameIv{
    if (!_nameIv) {
        _nameIv = [[UIImageView alloc] init];
        _nameIv.image = IMAGE(@"dt_titleImage");
    }
    return _nameIv;
}

- (UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [[UILabel alloc] init];
        _nameLb.font = FONT(20);
        _nameLb.textColor = BLACKTEXTCOLOR;
        _nameLb.text = _model.title;
    }
    return _nameLb;
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

- (UIImageView *)phoneIv{
    if (!_phoneIv) {
        _phoneIv = [[UIImageView alloc] init];
        _phoneIv.image = IMAGE(@"dt_call");
    }
    return _phoneIv;
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

- (UILabel *)phoneLb{
    if (!_phoneLb) {
        _phoneLb = [[UILabel alloc] init];
        _phoneLb.font = FONT(15);
        _phoneLb.textColor = BLACKTEXTCOLOR;
        _phoneLb.text = _model.tel;
    }
    return _phoneLb;

}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;;
        NSURL *url = [ShareBusinessManager.companyManager getCompanyDetailUrlWithID:_Id];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    return _webView;
}

- (UIView *)pacing_0{
    if (!_pacing_0) {
        _pacing_0 = [[UIView alloc] init];
        _pacing_0.backgroundColor = GRAYCOLOR;
    }
    return _pacing_0;
}

- (UIView *)pacing_1{
    if (!_pacing_1) {
        _pacing_1 = [[UIView alloc] init];
        _pacing_1.backgroundColor = GRAYCOLOR;
    }
    return _pacing_1;
}

- (UIButton *)mapBtn{
    if (!_mapBtn) {
        _mapBtn = [[UIButton alloc] init];
        _mapBtn.titleLabel.font = FONT(15);
        [_mapBtn setTitle:@"地图导航" forState:UIControlStateNormal];
        [_mapBtn setTitleColor:RGBColor(1, 139, 248) forState:UIControlStateNormal];
        [_mapBtn addTarget:self action:@selector(lookMapAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mapBtn;
}

- (UIButton *)callBtn{
    if (!_callBtn) {
        _callBtn = [[UIButton alloc] init];
        _callBtn.titleLabel.font = FONT(15);
        [_callBtn setTitle:@"拨打电话" forState:UIControlStateNormal];
        [_callBtn setTitleColor:RGBColor(1, 139, 248) forState:UIControlStateNormal];
        [_callBtn addTarget:self action:@selector(callAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _callBtn;
}

- (UIImageView *)commentIv{
    if (!_commentIv) {
        _commentIv = [[UIImageView alloc] init];
        _commentIv.image = IMAGE(@"dt_commentShow");
    }
    return _commentIv;
}

- (UILabel *)commentLb{
    if (!_commentLb) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.font = FONT(15);
        _commentLb.textColor = RGBColor(1, 139, 248);
        _commentLb.text = @"查看评论";
        _commentLb.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lookCommentListAction)];
        [_commentLb addGestureRecognizer:tap];
    }
    return _commentLb;
}

- (UIImageView *)rightIv{
    if (!_rightIv) {
        _rightIv = [[UIImageView alloc] init];
        _rightIv.image = IMAGE(@"classify8-1");
    }
    return _rightIv;
}

- (UIView *)bottomLineView{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] init];
        _bottomLineView.backgroundColor = GRAYCOLOR;
    }
    return _bottomLineView;
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


@end
