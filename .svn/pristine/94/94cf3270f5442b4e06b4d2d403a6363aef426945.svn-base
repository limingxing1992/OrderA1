//
//  CommentListViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2017/1/4.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "CommentListViewController.h"
#import "CommentTableViewCell.h"

@interface CommentListViewController ()
<
    UITableViewDelegate,
    UITableViewDataSource,
    UITextFieldDelegate
>


/** 帖子列表*/
@property (nonatomic, strong) UITableView *articleTableView;
/** 数据源*/
@property (nonatomic, strong) NSMutableArray *data;
/** 当前页*/
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, strong) TravelCommentView *commentView;//评论组件

@end

@implementation CommentListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"评论列表";
    self.isAutoBack = NO;
    self.view.backgroundColor = BACKGROUNDCOLOR;
    [self.view addSubview:self.articleTableView];
    [self loadDataWithRet:YES];
    [self.view addSubview:self.commentView];
    
    [NotificationCenter addObserver:self selector:@selector(keyBoardShowAction:) name:UIKeyboardWillShowNotification object:nil];
    [NotificationCenter addObserver:self selector:@selector(keyBoardHideAction:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)dealloc{
    [NotificationCenter removeObserver:self];
}

#pragma mark ----------------数据

- (void)initData{
    _data = [[NSMutableArray alloc] init];
    _currentPage = 1;
}

- (void)loadDataWithRet:(BOOL)ret{
    if (ret) {
        _currentPage = 1;
    }else{
        _currentPage += 1;
    }
    /*********************************************************************
      函数名称 : getDiscussListWithDictionary:
      函数描述 : 获取评论接口（DisAll_List）
      输入参数 : id：信息链接ID ,type：信息类型 news-新闻,blog-日志,company-企业,product-产品,show-说明,group-分组
      page：页码,size：每页条数
      返回值 : success（dissArray 存放评论列表数据（数据为DiscussModel模型）），responseFailure（errCode、errorMsg）
      作者   : 张永亮
      *********************************************************************/

    NSDictionary *dict = @{@"id":_ID,
                           @"type":_type,
                           @"page":[NSNumber numberWithInteger:_currentPage],
                           @"size":PAGESIZE};
    
    WeakObj(self);
    [ShareBusinessManager.newsManager getDiscussListWithDictionary:dict
                                                           success:^(NSArray *dissArray) {
                                                               if (ret) {
                                                                   [weakself.data removeAllObjects];
                                                                   [weakself.articleTableView.mj_header endRefreshing];
                                                                   [weakself.articleTableView.mj_footer setState:MJRefreshStateIdle];
                                                               }else{
                                                                   if (dissArray.count < PAGESIZE.integerValue ) {
                                                                       [weakself.articleTableView.mj_footer endRefreshingWithNoMoreData];
                                                                   }else{
                                                                       [weakself.articleTableView.mj_footer endRefreshing];
                                                                   }
                                                               }
                                                               [weakself.data addObjectsFromArray:dissArray];
                                                               [weakself.articleTableView reloadData];
                                                           }
                                                           failure:^(NSInteger errCode, NSString *errorMsg) {
                                                               [SVProgressHUD showErrorWithStatus:errorMsg];
                                                               if (ret) {
                                                                   [weakself.articleTableView.mj_header endRefreshing];
                                                               }else{
                                                                   [weakself.articleTableView.mj_footer endRefreshing];
                                                               }
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
    [dict setValue:_ID forKey:@"obj.linkid"];
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
                                                           [weakself loadDataWithRet:YES];
                                                       } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                           [SVProgressHUD showErrorWithStatus:@"评论失败"];
                                                       }];
    _commentView.commentTf.text = @"";//评论完成后清空输入框
    
}

#pragma mark ----------------table代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [tableView cellHeightForIndexPath:indexPath model:_data[indexPath.row] keyPath:@"model" cellClass:[CommentTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    cell.model = _data[indexPath.row];
//    MyArticleItemModel *model = _data[indexPath.row];
//    cell.model = model;
    return cell;
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


#pragma mark ----------------实例

- (UITableView *)articleTableView{
    if (!_articleTableView) {
        _articleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT)];
        _articleTableView.delegate = self;
        _articleTableView.dataSource= self;
        _articleTableView.backgroundColor  = WHITECOLOR;
        _articleTableView.separatorColor = GRAYCOLOR;
        _articleTableView.separatorInset = UIEdgeInsetsZero;
        [_articleTableView registerClass:[CommentTableViewCell class] forCellReuseIdentifier:@"commentCell"];
        
        WeakObj(self);
        //下拉刷新
        _articleTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadDataWithRet:YES];
        }];
        
        _articleTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadDataWithRet:NO];
        }];
        
        _articleTableView.mj_footer.automaticallyHidden = YES;
    }
    return _articleTableView;
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
