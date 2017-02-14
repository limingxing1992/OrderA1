//
//  SearchViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "SearchViewController.h"

#import "SearchTableViewCell.h"

@interface SearchViewController ()<UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource>
/** 搜索框背景图片*/
@property (nonatomic, strong) UIImageView *searchBackIv;
/** 搜索按钮*/
@property (nonatomic, strong) UIButton *searchBtn;
/** 搜索输入框*/
@property (nonatomic, strong) UITextField *searchTf;
/** 搜索排行名字*/
@property (nonatomic, strong) UILabel *searchTitleLb;
/** 热点搜索排行*/
@property (nonatomic, strong) UITableView *tableView;
/** 数据*/
@property (nonatomic, strong) NSMutableArray *data;
/** 当前页*/
@property (nonatomic, assign) NSInteger page;


@end

static NSString *cellId = @"searchId";

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"搜索";
    self.isAutoBack = NO;
    self.showBack = NO;
    [self.view addSubview:self.searchBackIv];
    [self.view addSubview:self.searchBtn];
    [self.view addSubview:self.searchTf];
    [self.view addSubview:self.searchTitleLb];
    [self.view addSubview:self.tableView];
    [self loadDataWithRet:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
    _searchBackIv.sd_layout
    .topSpaceToView(self.view, 10)
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .heightIs(40);
    
    _searchBtn.sd_layout
    .centerYEqualToView(_searchBackIv)
    .rightSpaceToView(self.view, 10)
    .heightIs(40)
    .widthIs(65);
    
    _searchTf.sd_layout
    .centerYEqualToView(_searchBackIv)
    .leftSpaceToView(self.view, 55)
    .rightSpaceToView(_searchBtn, 3)
    .heightIs(40);
    
    _searchTitleLb.sd_layout
    .topSpaceToView(_searchBackIv, 15)
    .leftEqualToView(_searchBackIv)
    .rightSpaceToView(self.view, 15)
    .heightIs(18);
    
    _tableView.sd_layout
    .topSpaceToView(_searchTitleLb, 15)
    .leftEqualToView(_searchTitleLb)
    .rightSpaceToView(self.view, 15)
    .bottomSpaceToView(self.view, TabBar_HEIGHT);
}

#pragma mark ----------------数据源

- (void)initData{
    _data = [[NSMutableArray alloc] init];
}

- (void)loadDataWithRet:(BOOL)ret{
    WeakObj(self);
    /*********************************************************************
     函数名称 : getSearchAppKeyListWithDictionary:
     函数描述 : 搜索应用下的热词关键字接口（SchKey_Cid）
     输入参数 : id ：栏目id ,page：页码 ,size：每页条数
     返回值 : success（keysArray 存放关键字列表数据（数据为KeyModel模型）），responseFailure（errCode、errorMsg）
     作者   : 张永亮
     *********************************************************************/
    if (ret) {
        _page = 1;
    }else{
        _page += 1;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    /**  输入参数 : id ：栏目id ,page：页码 ,size：每页条数*/
    [dict setValue:PAGESIZE forKey:@"size"];
    [dict setValue:[NSNumber numberWithInteger:_page] forKey:@"page"];
    [dict setValue:APPCID forKey:@"id"];

    [ShareBusinessManager.searchManager getSearchAppKeyListWithDictionary:dict
                                                                  success:^(NSArray *keysArray) {
                                                                      [SVProgressHUD dismiss];
                                                                      if (ret) {
                                                                          [weakself.data removeAllObjects];
                                                                          [weakself.tableView.mj_header endRefreshing];
                                                                          [weakself.tableView.mj_footer setState:MJRefreshStateIdle];
                                                                      }else{
                                                                          if (keysArray.count < PAGESIZE.integerValue ) {
                                                                              [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
                                                                          }else{
                                                                              [weakself.tableView.mj_footer endRefreshing];
                                                                          }
                                                                      }
                                                                      [weakself.data addObjectsFromArray:keysArray];
                                                                      [weakself.tableView reloadData];
                                                                  } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                      [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                      if (ret) {
                                                                          [weakself.tableView.mj_header endRefreshing];
                                                                      }else{
                                                                          [weakself.tableView.mj_footer endRefreshing];
                                                                      }
                                                                      [weakself.tableView reloadData];
                                                                  }];
}

#pragma mark ----------------界面逻辑
/** 搜索按钮动作*/
- (void)searchAction{
    [self.searchTf resignFirstResponder];
    
    if (!_searchTf.text.length) {
        return;
    }
    SearchResultListViewController *searchResultVc = [[SearchResultListViewController alloc] init];
    searchResultVc.keyWord = _searchTf.text;
    [self.navigationController pushViewController:searchResultVc animated:YES];
    
    
}

#pragma mark ----------------搜索代理

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (!textField.text.length) {
        return NO;
    }
    [self searchAction];
    return YES;
}

#pragma mark ----------------搜索排行代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    KeyModel *model = _data[indexPath.row];
    cell.model = model;
    if (indexPath.row < 3) {
        cell.placeLb.backgroundColor = OrangeCOLOR;
    }
    cell.placeLb.text = [NSString stringWithFormat:@"%ld", indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.1f];
    KeyModel *model = _data[indexPath.row];
    _searchTf.text = model.str;
}

- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

#pragma mark ----------------实例

- (UIImageView *)searchBackIv{
    if (!_searchBackIv) {
        _searchBackIv = [[UIImageView alloc] init];
        _searchBackIv.image = IMAGE(@"searchBg");
    }
    return _searchBackIv;
}

- (UIButton *)searchBtn{
    if (!_searchBtn) {
        _searchBtn = [[UIButton alloc] init];
        [_searchBtn setBackgroundImage:IMAGE(@"searchBtn") forState:UIControlStateNormal];
        [_searchBtn addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _searchBtn;
}

- (UITextField *)searchTf{
    if (!_searchTf) {
        _searchTf  = [[UITextField alloc] init];
        _searchTf.font = FONT(17);
        _searchTf.textColor = BLACKTEXTCOLOR;
        _searchTf.placeholder = @"请输入关键词";
        _searchTf.returnKeyType = UIReturnKeySearch;
        _searchTf.delegate = self;
        _searchTf.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _searchTf;

}

- (UILabel *)searchTitleLb{
    if (!_searchTitleLb) {
        _searchTitleLb = [[UILabel alloc] init];
        _searchTitleLb.font = FONT(18);
        _searchTitleLb.textColor = SHENTEXTCOLOR;
        _searchTitleLb.text = @"热点搜索排行";
    }
    return _searchTitleLb;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        [_tableView registerClass:[SearchTableViewCell class] forCellReuseIdentifier:cellId];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
