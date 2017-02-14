//
//  SettingSearchViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/30.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "SettingSearchViewController.h"

@interface SettingSearchViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>


@property (nonatomic, strong) UIImageView *searchBackView;

@property (nonatomic, strong) UITextField *searchTf;

/** 搜索动作按钮*/
@property (nonatomic, strong) UIButton *searchBtn;


/** 选择栏目标题*/
@property (nonatomic, strong) UILabel *titleLb;

/** 一级栏目按钮*/
@property (nonatomic, strong) UIButton *firstBtn;
/** 链接标志*/
@property (nonatomic, strong) UIImageView *connectIv;

/** 二级栏目按钮*/
@property (nonatomic, strong) UIButton *secondBtn;


/** 一级栏目tableview*/
@property (nonatomic, strong) UITableView *firstTableView;

/** 二级栏目tableview*/
@property (nonatomic, strong) UITableView *secondTableView;

/** 一级栏目数据*/
@property (nonatomic, strong) NSMutableArray *firstData;

/** 二级栏目数据*/
@property (nonatomic, strong) NSMutableArray *secondData;

/** 当前一级栏目是否展示*/
@property (nonatomic, assign) BOOL fisrtShow;
/** 当前二级栏目是否展示*/
@property (nonatomic, assign) BOOL secondShow;
/** 当前选择model*/
@property (nonatomic, strong) ChannelModel *currentModel;



@end

static NSString *const cellFirst = @"cellFirst";
static NSString *const cellSecond = @"cellSecond";

@implementation SettingSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"搜索";
    self.isAutoBack = NO;
    [self.view addSubview:self.searchBackView];
    [self.view addSubview:self.titleLb];
    [self.view addSubview:self.firstBtn];
    [self.view addSubview:self.connectIv];
    [self.view addSubview:self.secondBtn];
    [self.view addSubview:self.firstTableView];
    [self.view addSubview:self.secondTableView];
    [self.view addSubview:self.connectIv];
    [self autoLayoutSubViews];
    [self loadFirstData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (void)autoLayoutSubViews{
    _searchBackView.sd_layout
    .topSpaceToView(self.view, 10)
    .leftSpaceToView(self.view, 15)
    .rightSpaceToView(self.view, 15)
    .heightIs(40);
    
    _titleLb.sd_layout
    .topSpaceToView(_searchBackView, 30)
    .leftEqualToView(_searchBackView)
    .rightSpaceToView(self.view, 15)
    .autoHeightRatio(0);
    
    _firstBtn.sd_layout
    .topSpaceToView(_titleLb, 20)
    .leftSpaceToView(self.view, 30)
    .heightIs(60)
    .widthIs(95);
    
    _firstTableView.sd_layout
    .topSpaceToView(_firstBtn, 0.5)
    .leftEqualToView(_firstBtn)
    .rightEqualToView(_firstBtn)
    .heightIs(0.5);
    
    _connectIv.sd_layout
    .centerYEqualToView(_firstBtn)
    .leftSpaceToView(_firstBtn, 15)
    .widthIs(6.5)
    .heightIs(0);
    
    _secondBtn.sd_layout
    .topEqualToView(_firstBtn)
    .leftSpaceToView(_connectIv, 15)
    .heightIs(60)
    .widthIs(0);
    
    _secondTableView.sd_layout
    .topSpaceToView(_secondBtn, 0.5)
    .leftEqualToView(_secondBtn)
    .rightEqualToView(_secondBtn)
    .heightIs(0);
    

}

#pragma mark ----------------数据处理

- (void)initData{
    _firstData = [[NSMutableArray alloc] init];
    _secondData = [[NSMutableArray alloc] init];
}


- (void)loadFirstData{
    WeakObj(self);
    /** os：端口型号 android-安卓 apple-苹果，cid：应用ID，result：每页显示数量，id：栏目ID*/
    [ShareBusinessManager.newsManager getOneChannelListWithDictionary:@{@"os":@"apple",
                                                                        @"cid":APPCID,
                                                                        } success:^(NSArray *channelsArray) {
                                                                            [SVProgressHUD dismiss];
                                                                            [weakself.firstData removeAllObjects];
                                                                            [weakself.firstData addObjectsFromArray:channelsArray];
                                                                            [weakself.firstTableView reloadData];
                                                                        } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                            [SVProgressHUD showErrorWithStatus:@"加载失败"];
                                                                        }];
}


#pragma mark ----------------界面逻辑
/** 选择一级栏目动作*/
- (void)firstListAction{
    
    if (_fisrtShow) {
        //关闭一级栏目
        [self animationTableView:_firstTableView withShow:NO];
    }else{
        //展示一级栏目
        [self animationTableView:_firstTableView withShow:YES];
        [self animationTableView:_secondTableView withShow:NO];
    }
    
}
/** 选择二级栏目*/
- (void)secondListAction{
    if (_secondShow) {
        //关闭二级栏目
        [self animationTableView:_secondTableView withShow:NO];
    }else{
        //开启二级栏目
        [self animationTableView:_secondTableView withShow:YES];
        [self animationTableView:_firstTableView withShow:NO];
    }
}

/** 添加和移除二级按钮和二级栏目*/
- (void)showSecondWithRet:(BOOL)ret{
    
    if (ret) {
        _secondBtn.sd_layout
        .widthIs(95);
        _connectIv.sd_layout
        .heightIs(15);
    }else{
        _secondBtn.sd_layout
        .widthIs(0);
        _connectIv.sd_layout
        .heightIs(0);
    }
    
}

/** 选择栏目*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _firstTableView) {
        ChannelModel *model = _firstData[indexPath.row];
        [_firstBtn setTitle:model.title forState:UIControlStateNormal];
        [self animationTableView:_firstTableView withShow:NO];
        _currentModel = model;
        //切换二级栏目数据
        [_secondData removeAllObjects];
        [_secondData addObjectsFromArray:model.twoChannelList];
        [_secondBtn setTitle:@"请选择栏目" forState:UIControlStateNormal];
        if (_secondData.count) {
            [self showSecondWithRet:YES];
            _currentModel = nil;//如果有二级分类。则销毁这个指针。防止未选择二级分类进行搜索
        }else{
            [self showSecondWithRet:NO];
        }
        [_secondTableView reloadData];
    }else{
        ChannelModel *model = _secondData[indexPath.row];
        [_secondBtn setTitle:model.title forState:UIControlStateNormal];
        [self animationTableView:_secondTableView withShow:NO];
        
        _currentModel = model;
        
    }
}
/** 搜索按钮*/
- (void)searchAction{
    if (_searchTf.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入关键词"];
        return;
    }
    
    [_searchTf resignFirstResponder];
    
    SearchResultListViewController *result = [[SearchResultListViewController alloc] init];
    if (_currentModel) {
        result.type  = _currentModel.type;
        result.Id = _currentModel.chid;
    }
    result.keyWord = _searchTf.text;
    
    [self.navigationController pushViewController:result animated:YES];
}

#pragma mark ----------------动画弹出列表

- (void)animationTableView:(UITableView *)tableView withShow:(BOOL)show{
    WeakObj(self);
    if (tableView == _firstTableView) {
        _fisrtShow = show;
        if (show) {
            [UIView animateWithDuration:0.3 animations:^{
               weakself.firstTableView.sd_layout
                .heightIs(250 *KHeight_Scale);
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                weakself.firstTableView.sd_layout
                .heightIs(0.5);
            }];
        }
        
        
    }else if (tableView == _secondTableView){
        _secondShow = show;
        if (show) {
            [UIView animateWithDuration:0.3 animations:^{
                weakself.secondTableView.sd_layout
                .heightIs(250 *KHeight_Scale);
            }];
        }else{
            [UIView animateWithDuration:0.1 animations:^{
                weakself.secondTableView.sd_layout
                .heightIs(0.5);
            }];
        }

    }
}



#pragma mark ----------------tableview代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _firstTableView) {
        return _firstData.count;
    }else if (tableView == _secondTableView){
        return _secondData.count;
    }
    return 0;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 32.5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _firstTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellFirst];
        ChannelModel *model = _firstData[indexPath.row];
        cell.textLabel.font = FONT(14);
        cell.textLabel.text = model.title;
        return cell;
    }
    if (tableView == _secondTableView) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellSecond];
        ChannelModel *model = _secondData[indexPath.row];
        cell.textLabel.font = FONT(14);
        cell.textLabel.text = model.title;
        return cell;
    }
    return nil;
}

#pragma mark ----------------搜索代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (_searchTf.text.length == 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入关键词"];
        return NO;
    }
    [_searchTf resignFirstResponder];
    
    SearchResultListViewController *result = [[SearchResultListViewController alloc] init];
    if (_currentModel) {
        result.type  = _currentModel.type;
        result.Id = _currentModel.chid;
    }
    result.keyWord = _searchTf.text;
    
    [self.navigationController pushViewController:result animated:YES];
    
    return YES;
}


#pragma mark ----------------实例

- (UITextField *)searchTf{
    if (!_searchTf) {
        _searchTf = [[UITextField alloc] init];
        _searchTf.font = FONT(16);
        _searchTf.textColor = BLACKTEXTCOLOR;
        _searchTf.placeholder = @"请输入关键词";
        _searchTf.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchTf.returnKeyType = UIReturnKeySearch;
        _searchTf.delegate = self;
    }
    return _searchTf;

}

- (UIImageView *)searchBackView{
    if (!_searchBackView) {
        _searchBackView = [[UIImageView alloc] init];
        _searchBackView.image = IMAGE(@"search_image");
        [_searchBackView addSubview:self.searchTf];
        [_searchBackView addSubview:self.searchBtn];
        _searchBackView.userInteractionEnabled = YES;
        _searchTf.sd_layout
        .topSpaceToView(_searchBackView, 0)
        .leftSpaceToView(_searchBackView, 13)
        .rightSpaceToView(_searchBackView, 50)
        .heightRatioToView(_searchBackView, 1);
        
        
        _searchBtn.sd_layout
        .rightSpaceToView(_searchBackView, 0)
        .topSpaceToView(_searchBackView, 0)
        .bottomSpaceToView(_searchBackView, 0)
        .widthIs(45);
    }
    return _searchBackView;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(16);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.text = @"请选择栏目:";
    }
    return _titleLb;
}

- (UIButton *)firstBtn{
    if (!_firstBtn) {
        _firstBtn = [[UIButton alloc] init];
        [_firstBtn setBackgroundImage:IMAGE(@"search_rect") forState:UIControlStateNormal];
        [_firstBtn addTarget:self action:@selector(firstListAction) forControlEvents:UIControlEventTouchUpInside];
        _firstBtn.titleLabel.font = FONT(16);
        [_firstBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_firstBtn setTitle:@"全部" forState:UIControlStateNormal];
    }
    return _firstBtn;
}

- (UIImageView *)connectIv{
    if (!_connectIv) {
        _connectIv = [[UIImageView alloc] init];
        _connectIv.image = IMAGE(@"search_go");
    }
    return _connectIv;
}

- (UIButton *)secondBtn{
    if (!_secondBtn) {
        _secondBtn = [[UIButton alloc] init];
        [_secondBtn setBackgroundImage:IMAGE(@"search_rect") forState:UIControlStateNormal];
        [_secondBtn addTarget:self action:@selector(secondListAction) forControlEvents:UIControlEventTouchUpInside];
        [_secondBtn setTitle:@"请选择栏目" forState:UIControlStateNormal];
        _secondBtn.titleLabel.font = FONT(16);
        [_secondBtn setTitleColor:BLACKTEXTCOLOR forState:UIControlStateNormal];
        [_secondBtn addTarget:self action:@selector(secondListAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _secondBtn;
}


- (UITableView *)firstTableView{
    if (!_firstTableView) {
        _firstTableView = [[UITableView alloc] init];
        _firstTableView.delegate = self;
        _firstTableView.dataSource =self;
        _firstTableView.separatorColor = GRAYCOLOR;
        [_firstTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellFirst];
        _firstTableView.layer.borderWidth = 0.5;
        _firstTableView.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _firstTableView;
}


- (UITableView *)secondTableView{
    if (!_secondTableView) {
        _secondTableView = [[UITableView alloc] init];
        _secondTableView.delegate = self;
        _secondTableView.dataSource =self;
        _secondTableView.separatorColor = GRAYCOLOR;
        [_secondTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellSecond];
        _secondTableView.layer.borderWidth = 0.5;
        _secondTableView.layer.borderColor = GRAYCOLOR.CGColor;
    }
    return _secondTableView;

}


- (UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] init];
        [_searchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}
@end
