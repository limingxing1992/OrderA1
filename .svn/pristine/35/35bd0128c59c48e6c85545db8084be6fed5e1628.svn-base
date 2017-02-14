//
//  CollectViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "CollectViewController.h"

@interface CollectViewController ()<UITableViewDelegate, UITableViewDataSource>
/** 当前页*/
@property (nonatomic, assign) NSInteger page;
/** 数据*/
@property (nonatomic, strong) NSMutableArray *data;
/** 列表*/
@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *const cellId = @"favoriteId";

@implementation CollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"我的收藏";
    self.isAutoBack = NO;
    self.showBack = NO;
    [self.view addSubview:self.tableView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
    
    [self loadDataWithRet:YES];
    
}

- (void)initData{
    _data = [[NSMutableArray alloc] init];
}

/** 加载数据*/
- (void)loadDataWithRet:(BOOL)ret{
    /*********************************************************************
     函数名称 : getFavListWithDictionary:
     函数描述 : 获取收藏列表接口（Fav_List）
     输入参数 : id：用户ID ,cid：应用ID ,type:消息种类 ,size：每页条数 ,page：页码
     返回值 : success（favsArray 存放收藏列表数据（数据为FavModel模型）），responseFailure（errCode、errorMsg）
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
    [dict setValue:UserID forKey:@"id"];
    [dict setValue:APPCID forKey:@"cid"];
    
    WeakObj(self);
    
    [ShareBusinessManager.userManager getFavListWithDictionary:dict
                                                       success:^(NSArray *favsArray) {
                                                           if (ret) {
                                                               [weakself.data removeAllObjects];
                                                               [weakself.tableView.mj_header endRefreshing];
                                                               [weakself.tableView.mj_footer setState:MJRefreshStateIdle];
                                                           }else{
                                                               if (favsArray.count < PAGESIZE.integerValue ) {
                                                                   [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
                                                               }else{
                                                                   [weakself.tableView.mj_footer endRefreshing];
                                                               }
                                                           }
                                                           [weakself.data addObjectsFromArray:favsArray];
                                                           [weakself.tableView reloadData];
                                                           
                                                       } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                           [SVProgressHUD showErrorWithStatus:errorMsg];
                                                       }];
    
}

#pragma mark ----------------详情页入口

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FavModel *model = _data[indexPath.row];
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    detailVc.Id = model.infoid;
    detailVc.type = model.infotype;
    detailVc.titleText = model.infotitle;
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
    ListCell_0TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.favoModel = _data[indexPath.row];
    return cell;
}

#pragma mark ----------------左滑删除好友

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FavModel *model = _data[indexPath.row];
    [_data removeObjectAtIndex:indexPath.row];
    /*********************************************************************
     函数名称 : delFavWithDictionary:
     函数描述 : 删除收藏接口（Fav_Del）
     输入参数 : uid：用户Id ,id：收藏Id
     返回值 : success：1，responseFailure：0 ,-1-提交信息不全
     作者   : 张永亮
     *********************************************************************/
    [tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationLeft];

    [ShareBusinessManager.userManager delFavWithDictionary:@{@"uid":UserID,
                                                             @"id":model.ID}
                                                   success:^(id object) {
                                                       
                                                   } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                       [SVProgressHUD showErrorWithStatus:@"删除失败"];
                                                   }];
}

/**
 *  修改Delete按钮文字为“删除”
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


#pragma mark ----------------实例

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorColor = GRAYCOLOR;
        _tableView.separatorInset = UIEdgeInsetsMake(0, 15, 0, 0);
        [_tableView registerClass:[ListCell_0TableViewCell class] forCellReuseIdentifier:cellId];
        WeakObj(self);
        //下拉刷新
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadDataWithRet:YES];
        }];
        
        _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadDataWithRet:NO];
        }];
        _tableView.mj_footer.automaticallyHidden = YES;
    }
    return _tableView;
}

@end
