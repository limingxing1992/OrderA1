//
//  MyCommentViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/28.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "MyCommentViewController.h"
#import "MyCommentTableViewCell.h"

@interface MyCommentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) NSInteger page;
/** 数据*/
@property (nonatomic, strong) NSMutableArray *data;
/** 列表*/
@property (nonatomic, strong) UITableView *tableView;


@end

static NSString *const cellId = @"myCommentId";

@implementation MyCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*********************************************************************
     函数名称 : getMyDiscussListWithDictionary:
     函数描述 : 获取我的评论接口（DisAll_Local）
     输入参数 : uid：用户ID，cid：应用ID，page：页码，size：每页条数
     返回值 : success（dissArray 存放我的评论列表数据（数据为DiscussModel模型）），responseFailure（errCode、errorMsg）
     作者   : 张永亮
     *********************************************************************/
    self.name = @"我的评论";
    self.isAutoBack = NO;
    
    [self.view addSubview:self.tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadDataWithRet:YES];
}


- (void)initData{
    _data = [[NSMutableArray alloc] init];
}

- (void)loadDataWithRet:(BOOL)ret{
    if (ret) {
        _page = 1;
    }else{
        _page += 1;
    }
    WeakObj(self);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    /**  输入参数 : id ：栏目id ,page：页码 ,size：每页条数*/
    [dict setValue:PAGESIZE forKey:@"size"];
    [dict setValue:[NSNumber numberWithInteger:_page] forKey:@"page"];
    [dict setValue:APPCID forKey:@"cid"];
    [dict setValue:UserID forKey:@"uid"];
    [ShareBusinessManager.newsManager getMyDiscussListWithDictionary:dict
                                                             success:^(NSArray *dissArray) {
                                                                 
                                                                 [SVProgressHUD dismiss];
                                                                 
                                                                 if (ret) {
                                                                     [weakself.data removeAllObjects];
                                                                     [weakself.tableView.mj_header endRefreshing];
                                                                     [weakself.tableView.mj_footer setState:MJRefreshStateIdle];
                                                                 }else{
                                                                     if (dissArray.count < PAGESIZE.integerValue ) {
                                                                         [weakself.tableView.mj_footer endRefreshingWithNoMoreData];
                                                                     }else{
                                                                         [weakself.tableView.mj_footer endRefreshing];
                                                                     }
                                                                 }
                                                                 [weakself.data addObjectsFromArray:dissArray];
                                                                 [weakself.tableView reloadData];
                                                             } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                 [SVProgressHUD showErrorWithStatus:@"加载失败"];
                                                                 if (ret) {
                                                                     [weakself.tableView.mj_header endRefreshing];
                                                                 }else{
                                                                     [weakself.tableView.mj_footer endRefreshing];
                                                                 }

                                                             }];

}


#pragma mark ----------------进入详情页

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscussModel *model = _data[indexPath.row];
    DetailViewController *detailVc = [[DetailViewController alloc] init];
    detailVc.Id = model.linkid;
    detailVc.type = model.type;
    detailVc.titleText = model.title;
    [self.navigationController pushViewController:detailVc animated:YES];


}


#pragma mark ----------------tableview代理

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [tableView cellHeightForIndexPath:indexPath model:_data[indexPath.row] keyPath:@"model" cellClass:[MyCommentTableViewCell class] contentViewWidth:SCREEN_WIDTH];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.model = _data[indexPath.row];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DiscussModel *model = _data[indexPath.row];
    [_data removeObjectAtIndex:indexPath.row];
    /*********************************************************************
     函数名称 : delDiscussWithDictionary:
     函数描述 : 删除评论接口（DisAll_Del）
     输入参数 : obj.uid：用户ID,obj.cid：应用ID,obj.id：信息ID
     返回值 : success（），responseFailure（errCode、errorMsg）
     作者   : 张永亮
     *********************************************************************/
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    //静默删除处理
    [ShareBusinessManager.newsManager delDiscussWithDictionary:@{@"obj.uid":UserID,
                                                                 @"obj.cid":APPCID,
                                                                 @"obj.id":model.ID}
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
        [_tableView registerClass:[MyCommentTableViewCell class] forCellReuseIdentifier:cellId];
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
