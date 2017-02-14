//
//  DetailViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>

@interface DetailViewController ()<WKNavigationDelegate, UITextFieldDelegate>
/** h5页面*/
@property (nonatomic, strong) WKWebView *webView;

/** 收藏按钮*/
@property (nonatomic, strong) UIButton *favoriteBtn;
/** 分享按钮*/
@property (nonatomic, strong) UIButton *shareBtn;

@property (nonatomic, strong) TravelCommentView *commentView;//评论组件


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"详情页面";
    self.isAutoBack = NO;
    [self.view addSubview:self.webView];
    [self.view addSubview:self.commentView];
    [self setNavi];
    [self loadData];
    [SVProgressHUD showWithStatus:@"努力加载中"];
    
    [NotificationCenter addObserver:self selector:@selector(keyBoardShowAction:) name:UIKeyboardWillShowNotification object:nil];
    [NotificationCenter addObserver:self selector:@selector(keyBoardHideAction:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)dealloc{
    [NotificationCenter removeObserver:self];
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

- (void)loadData{
    
    NSURL *url;
    if ([_type isEqualToString:@"news"]) {
        url = [ShareBusinessManager.newsManager getNewsPageUrlWithID:_Id];
    }else if ([_type isEqualToString:@"image"]){
        url = [ShareBusinessManager.newsManager getNewsPageUrlWithID:_Id];
    }else if ([_type isEqualToString:@"company"]){
        url = [ShareBusinessManager.companyManager getCompanyDetailUrlWithID:_Id];
    }else if ([_type isEqualToString:@"show"]){
        url = [ShareBusinessManager.showManager getShowDetailUrlWithID:_Id];
    }else if ([_type isEqualToString:@"needs"]){
        url = [ShareBusinessManager.needsManager getNeedsDetailUrlWithID:_Id];
    }else if ([_type isEqualToString:@"blog"]){
        url = [ShareBusinessManager.blogManager getBlogDetailUrlWithID:_Id];
    }else if ([_type isEqualToString:@"product"]){
        
    }else if ([_type isEqualToString:@"group"]){
        
    }else if ([_type isEqualToString:@"menu"]){
        
    }
    NSLog(@"%@, %@", url , _type);

    
    if (url) {
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    }

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

#pragma mark ----------------wkWebView代理

/// 2 页面开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
/// 4 开始获取到网页内容时返回
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
/// 5 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
}
/// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
}

#pragma mark ----------------输入代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_commentView.commentTf resignFirstResponder];
    [self postComment];
    return YES;
}


#pragma mark ----------------实例化

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT)];
        _webView.navigationDelegate = self;
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
