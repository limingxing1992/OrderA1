//
//  SearchResultListViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/30.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "SearchResultListViewController.h"

@interface SearchResultListViewController ()<UITableViewDelegate, UITableViewDataSource>
/** 数据*/
@property (nonatomic, strong) NSMutableArray *data;
/** 列表*/
@property (nonatomic, strong) UITableView *tableView;

@end
static NSString *const cellId_0 = @"cellId_0";


@implementation SearchResultListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"搜索结果";
    self.isAutoBack = NO;
    [self.view addSubview:self.tableView];
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----------------数据处理

- (void)initData{
    _data = [[NSMutableArray alloc] init];
}

/** 加载数据*/
- (void)loadData{
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    /*********************************************************************
     函数名称 : getSearchNewsListForKeyWithDictionary:
     函数描述 : 根据关键字搜索资讯接口（News_Sch）
     输入参数 : id ：子栏目的id ,str：关键字 ,size：每页条数 ,page：页数
     返回值 : success（newsArray 存放搜索列表数据（数据为NewsModel模型）），responseFailure（errCode、errorMsg）
     作者   : 张永亮
     *********************************************************************/
    [dict setValue:PAGESIZE forKey:@"size"];
    [dict setValue:_keyWord forKey:@"str"];
    
    [SVProgressHUD show];
    if ([_type isEqualToString:@"news"]) {
        [self searchNewsByParameters:dict];
    }else if ([_type isEqualToString:@"image"]){
        [self searchNewsByParameters:dict];
    }else if ([_type isEqualToString:@"needs"]){
        [self searchNeedsByParameters:dict];
    }else if ([_type isEqualToString:@"blog"]){
        [self searchAllByParameters:dict];
    }else if ([_type isEqualToString:@"company"]){
        [self searchCompanyByParameters:dict];
    }else if ([_type isEqualToString:@"product"]){
        [self searchProductByParameters:dict];
    }else if ([_type isEqualToString:@"group"]){
        [self searchAllByParameters:dict];
    }else if ([_type isEqualToString:@"show"]){
        [self searchAllByParameters:dict];
    }else if ([_type isEqualToString:@"txt"]){
        [self searchAllByParameters:dict];
    }else{
        [self searchAllByParameters:dict];
    }
    
}

#pragma mark ----------------搜索结果0--根据类型进行搜索

- (void)searchAllByParameters:(NSMutableDictionary *)dict{
    WeakObj(self);
    [dict setValue:APPCID forKey:@"cid"];
    [ShareBusinessManager.searchManager getSearchListFromCidKeyWithDictionary:dict
                                                                      success:^(NSArray *searchesArray) {
                                                                          [weakself.data removeAllObjects];
                                                                          [weakself.data addObjectsFromArray:searchesArray];
                                                                          [weakself.tableView reloadData];
                                                                          if (searchesArray.count == 0) {
                                                                              [SVProgressHUD showSuccessWithStatus:@"暂无搜索结果"];
                                                                          }else{
                                                                              [SVProgressHUD dismiss];
                                                                          }
                                                                          
                                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                      }];

}

- (void)searchNewsByParameters:(NSMutableDictionary *)dict{
    WeakObj(self);
    [dict setValue:_Id forKey:@"id"];
    
    [ShareBusinessManager.searchManager getSearchNewsListForKeyWithDictionary:dict
                                                                      success:^(NSArray *searchesArray) {
                                                                          [weakself.data removeAllObjects];
                                                                          [weakself.data addObjectsFromArray:searchesArray];
                                                                          [weakself.tableView reloadData];
                                                                          if (searchesArray.count == 0) {
                                                                              [SVProgressHUD showSuccessWithStatus:@"暂无搜索结果"];
                                                                          }else{
                                                                              [SVProgressHUD dismiss];
                                                                          }

                                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                      }];
    
}
- (void)searchCompanyByParameters:(NSMutableDictionary *)dict{
    WeakObj(self);
    [dict setValue:_Id forKey:@"id"];
    [ShareBusinessManager.searchManager getSearchCompanyListForKeyWithDictionary:dict
                                                                      success:^(NSArray *searchesArray) {
                                                                          [weakself.data removeAllObjects];
                                                                          [weakself.data addObjectsFromArray:searchesArray];
                                                                          [weakself.tableView reloadData];
                                                                          if (searchesArray.count == 0) {
                                                                              [SVProgressHUD showSuccessWithStatus:@"暂无搜索结果"];
                                                                          }else{
                                                                              [SVProgressHUD dismiss];
                                                                          }

                                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                      }];
    
}
- (void)searchNeedsByParameters:(NSMutableDictionary *)dict{
    WeakObj(self);
    [dict setValue:_Id forKey:@"id"];
    [ShareBusinessManager.searchManager getSearchNeedsListForKeyWithDictionary:dict
                                                                      success:^(NSArray *searchesArray) {
                                                                          [weakself.data removeAllObjects];
                                                                          [weakself.data addObjectsFromArray:searchesArray];
                                                                          [weakself.tableView reloadData];
                                                                          if (searchesArray.count == 0) {
                                                                              [SVProgressHUD showSuccessWithStatus:@"暂无搜索结果"];
                                                                          }else{
                                                                              [SVProgressHUD dismiss];
                                                                          }

                                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                      }];
    
}
- (void)searchProductByParameters:(NSMutableDictionary *)dict{
    WeakObj(self);
    [dict setValue:_Id forKey:@"id"];
    [ShareBusinessManager.searchManager getSearchProductListForKeyWithDictionary:dict
                                                                      success:^(NSArray *searchesArray) {
                                                                          [weakself.data removeAllObjects];
                                                                          [weakself.data addObjectsFromArray:searchesArray];
                                                                          [weakself.tableView reloadData];
                                                                          if (searchesArray.count == 0) {
                                                                              [SVProgressHUD showSuccessWithStatus:@"暂无搜索结果"];
                                                                          }else{
                                                                              [SVProgressHUD dismiss];
                                                                          }

                                                                      } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                          [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                      }];
    
}


#pragma mark ----------------详情页入口

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchModel *model = _data[indexPath.row];
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    detailVc.Id = [NSNumber numberWithInteger:model.ID.integerValue];
    detailVc.type = model.type;
    detailVc.titleText = model.title;
    [self.navigationController pushViewController:detailVc animated:YES];
    
}


#pragma mark ----------------tableview代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListCell_0TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId_0];
    if ([_type isEqualToString:@"news"]) {
        cell.model = _data[indexPath.row];
    }else if ([_type isEqualToString:@"image"]){
        cell.model = _data[indexPath.row];
    }else if ([_type isEqualToString:@"needs"]){
        cell.needModel = _data[indexPath.row];
    }else if ([_type isEqualToString:@"blog"]){
        cell.blogModel  = _data[indexPath.row];
    }else if ([_type isEqualToString:@"company"]){
        cell.companyModel  = _data[indexPath.row];
    }else if ([_type isEqualToString:@"product"]){
        cell.productModel = _data[indexPath.row];
    }else if ([_type isEqualToString:@"group"]){
        cell.searchModel  = _data[indexPath.row];
    }else if ([_type isEqualToString:@"show"]){
        cell.searchModel  = _data[indexPath.row];
    }else if ([_type isEqualToString:@"txt"]){
        cell.searchModel  = _data[indexPath.row];
    }else{
        cell.searchModel  = _data[indexPath.row];
    }

    return cell;
}


#pragma mark ----------------实例化

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorColor = GRAYCOLOR;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
        [_tableView registerClass:[ListCell_0TableViewCell class] forCellReuseIdentifier:cellId_0];
    }
    return _tableView;
    


}

@end
