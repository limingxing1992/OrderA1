//
//  BlogDetailViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2017/1/5.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "BlogDetailViewController.h"

@interface BlogDetailViewController ()<UIWebViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UILabel *timeLb;

@property (nonatomic, strong) UIWebView *webView;

@property (nonatomic, strong) UILabel *hotTitleLb;

@property (nonatomic, strong) CommentTableViewCell *hotComment;



@property (nonatomic, strong) TravelCommentView *commentView;//评论组件

/** 收藏按钮*/
@property (nonatomic, strong) UIButton *favoriteBtn;

@end

@implementation BlogDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"详情";
    [self.contentView sd_addSubviews:@[self.titleLb, self.timeLb, self.webView, self.hotTitleLb, self.hotComment]];
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
    [self loadData];
}

- (void)setNavi{
    UIBarButtonItem *itmeFavo = [[UIBarButtonItem alloc] initWithCustomView:self.favoriteBtn];
    
    self.navigationItem.rightBarButtonItems = @[itmeFavo];
    
    
}

- (void)autoLayoutSubViews{
    _titleLb.sd_layout
    .topSpaceToView(self.contentView, 10)
    .leftSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    [_titleLb setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    _timeLb.sd_layout
    .topSpaceToView(_titleLb, 40)
    .leftEqualToView(_titleLb)
    .autoHeightRatio(0);
    [_timeLb setSingleLineAutoResizeWithMaxWidth: SCREEN_WIDTH];
    
    _webView.sd_layout
    .topSpaceToView(_timeLb, 20)
    .leftEqualToView(_timeLb)
    .rightSpaceToView(self.contentView, 15);
    
    _hotTitleLb.sd_layout
    .topSpaceToView(_webView, 30)
    .leftEqualToView(_webView)
    .rightEqualToView(_webView)
    .autoHeightRatio(0);
    
    _hotComment.sd_layout
    .topSpaceToView(_hotTitleLb, 10)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0);
    
    [self.contentView setupAutoContentSizeWithBottomView:_hotComment bottomMargin:60];
}


- (void)loadData{
    /*********************************************************************
     函数名称 : getDiscussListWithDictionary:
     函数描述 : 获取评论接口（DisAll_List）
     输入参数 : id：信息链接ID ,type：信息类型 news-新闻,blog-日志,company-企业,product-产品,show-说明,group-分组
     page：页码,size：每页条数
     返回值 : success（dissArray 存放评论列表数据（数据为DiscussModel模型）），responseFailure（errCode、errorMsg）
     作者   : 张永亮
     *********************************************************************/
    
    NSDictionary *dict = @{@"id":_Id,
                           @"type":_type,
                           @"page":@"1",
                           @"size":PAGESIZE};
    
    WeakObj(self);
//    [ShareBusinessManager.newsManager getDiscussListWithDictionary:dict
//                                                           success:^(NSArray *dissArray) {
//                                                               
//                                                           failure:^(NSInteger errCode, NSString *errorMsg) {
//                                                               
//                                                           }];
    [ShareBusinessManager.newsManager getDiscussListWithDictionary:dict
                                                           success:^(NSArray *dissArray) {
                                                               if (dissArray.count) {
                                                                   DiscussModel *model = dissArray.firstObject;
                                                                   weakself.hotComment.model = model;
                                                               }
                                                           } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                               
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
    [SVProgressHUD show];
    [ShareBusinessManager.newsManager addDiscussWithDictionary:dict
                                                       success:^(id object) {
                                                           [SVProgressHUD showSuccessWithStatus:@"评论成功"];
                                                           [weakself loadData];
                                                       } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                           [SVProgressHUD showErrorWithStatus:@"评论失败"];
                                                       }];
    _commentView.commentTf.text = @"";//评论完成后清空输入框
    
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


#pragma mark ----------------进入评论列表页
- (void)intoCommentList{
    CommentListViewController *commentVc = [[CommentListViewController alloc] init];
    commentVc.ID = _Id;
    commentVc.titleText = _model.title;
    commentVc.type = _type;
    [self.navigationController pushViewController:commentVc animated:YES];

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

#pragma mark ----------------输入代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_commentView.commentTf resignFirstResponder];
    [self postComment];
    return YES;
}


#pragma mark ----------------webView代理

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    CGRect frame = webView.frame;
    
    frame.size.width = SCREEN_WIDTH;
    
    frame.size.height = 1;
    
    webView.scrollView.scrollEnabled = NO;
    
    webView.frame = frame;
    
    frame.size.height = webView.scrollView.contentSize.height + 20;
    
    
    webView.frame = frame;
    
    [SVProgressHUD dismiss];
}

#pragma mark ----------------实例

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(20);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = _titleText;
    }
    return _titleLb;
}

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(15);
        _timeLb.textColor = SHENTEXTCOLOR;
        _timeLb.text = _model.regtime;
    }
    return _timeLb;
}

- (UIWebView *)webView{
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.delegate = self;
        NSURL *url = [ShareBusinessManager.blogManager getBlogDetailUrlWithID:_Id];
        [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    }
    return _webView;
}

- (UILabel *)hotTitleLb{
    if (!_hotTitleLb) {
        _hotTitleLb = [[UILabel alloc] init];
        _hotTitleLb.font = FONT(20);
        _hotTitleLb.textColor = BLACKTEXTCOLOR;
        _hotTitleLb.text = @"最新评论";
    }
    return _hotTitleLb;
}

- (CommentTableViewCell *)hotComment{
    if (!_hotComment) {
        _hotComment = [[CommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"hot"];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(intoCommentList)];
        [_hotComment addGestureRecognizer:tap];
        _hotComment.userInteractionEnabled = YES;
    }
    return _hotComment;
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
- (UIButton *)favoriteBtn{
    if (!_favoriteBtn) {
        _favoriteBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        [_favoriteBtn setImage:IMAGE(@"dt_collect") forState:UIControlStateNormal];
        [_favoriteBtn addTarget:self action:@selector(collectAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _favoriteBtn;
}


@end
