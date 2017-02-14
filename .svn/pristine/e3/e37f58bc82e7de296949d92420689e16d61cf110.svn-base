//
//  List_2ViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/29.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "List_2ViewController.h"

@interface List_2ViewController ()<UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *data;
/** 当前页类型*/
@property (nonatomic, assign) ListType typeTag;
/** 当前页类型*/
@property (nonatomic, copy) NSString *currentType;


/** 当前页*/
@property (nonatomic, assign) NSInteger page;

@end

static NSString *const cellId_0 = @"collectionCell_0";//只有图片标题
static NSString *const cellId_1 = @"collectionCell_1";//除了图标标题还有报价


@implementation List_2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = _model.title;
    self.isAutoBack = NO;
    [self.view addSubview:self.collectionView];
    [self loadDataWithRet:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData{
    _data = [[NSMutableArray alloc] init];
     _typeTag  = [self comnByType:_model.type typeId:_model.typeId];
    _currentType = _model.type;
    
}

//专业组合方法。传入type 和id，返回cell类型
- (NSInteger)comnByType:(NSString *)type typeId:(NSString *)typeId{

    if ([type isEqualToString:@"menu"]){
        return ListType10;
    }else if ([type isEqualToString:@"image"]){
        return ListType7;
    }else if ([type isEqualToString:@"company"]){
        return ListType8;
    }else if ([type isEqualToString:@"product"]){
        return ListType9;
    }else if ([type isEqualToString:@"group"]){
        return ListType10;
    }else{
        [SVProgressHUD showErrorWithStatus:@"找不到对应类型，无法进入列表页"];
    }
    return 0;
}

- (void)loadDataWithRet:(BOOL)ret{
    
    if (ret) {
        _page = 1;
    }else{
        _page += 1;
    }
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    /**  输入参数 : id ：栏目id ,page：页码 ,size：每页条数*/
    [dict setValue:PAGESIZE forKey:@"size"];
    [dict setValue:[NSNumber numberWithInteger:_page] forKey:@"page"];
    [dict setValue:_model.chid forKey:@"id"];

    switch (_typeTag) {
        case ListType7:
        {
            [self getNewsListByParameters:dict ret:ret];
        }
            break;
        case ListType8:
        {
            [self getCompanyListByParameters:dict ret:ret];
        }
            break;
        case ListType9:
        {
            [self getProductListByParameters:dict ret:ret];
        }
            break;
        case ListType10:
        {
            [self getGroupListByParameters:dict ret:ret];
        }
            break;
        default:
            break;
    }
    
}

/** 请求company类型*/
- (void)getCompanyListByParameters:(NSDictionary *)parameters ret:(BOOL)ret{
    [SVProgressHUD showWithStatus:@"加载中"];
    WeakObj(self);
    [ShareBusinessManager.companyManager getCompanyListWithDictionary:parameters
                                                              success:^(NSArray *companyArray) {
                                                                  [weakself successWith:companyArray ret:ret];
                                                              } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                  [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                  if (ret) {
                                                                      [weakself.collectionView.mj_header endRefreshing];
                                                                  }else{
                                                                      [weakself.collectionView.mj_footer endRefreshing];
                                                                  }
                                                                  [weakself.collectionView reloadData];
                                                                  
                                                              }];;
    
}

/** 请求news--images类型*/
- (void)getNewsListByParameters:(NSDictionary *)parameters ret:(BOOL)ret{
    [SVProgressHUD showWithStatus:@"加载中"];
    WeakObj(self);
    [ShareBusinessManager.newsManager getNewsListWithDictionary:parameters
                                                        success:^(NSArray *newsArray) {
                                                            [weakself successWith:newsArray ret:ret];
                                                        } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                            [SVProgressHUD showErrorWithStatus:errorMsg];
                                                            if (ret) {
                                                                [weakself.collectionView.mj_header endRefreshing];
                                                            }else{
                                                                [weakself.collectionView.mj_footer endRefreshing];
                                                            }
                                                            [weakself.collectionView reloadData];
                                                        }];
}

/** 请求product类型*/
- (void)getProductListByParameters:(NSDictionary *)parameters ret:(BOOL)ret{
    //A1项目没有
}

/** 请求group类型*/
- (void)getGroupListByParameters:(NSDictionary *)parameters ret:(BOOL)ret{
    //A1项目没有
}

/** 成功操作*/
- (void)successWith:(NSArray *)ary ret:(BOOL)ret{
    [SVProgressHUD dismiss];
    if (ret) {
        [self.data removeAllObjects];
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer setState:MJRefreshStateIdle];
    }else{
        if (ary.count < PAGESIZE.integerValue ) {
            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.collectionView.mj_footer endRefreshing];
        }
    }
    [self.data addObjectsFromArray:ary];
    [self.collectionView reloadData];

}


#pragma mark ----------------界面逻辑

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *infoId;
    NSString *title;
    if ([_currentType isEqualToString:@"news"]) {
        NewsModel *model = _data[indexPath.row];
        infoId = model.iid;
        title = model.title;
    }else if ([_currentType isEqualToString:@"image"]){
        NewsModel *model = _data[indexPath.row];
        infoId = model.iid;
        title = model.title;
    }else if ([_currentType isEqualToString:@"company"]){
        CompanyModel *model = _data[indexPath.row];
        infoId = model.ID;
        title = model.title;
        
        CompanyDetailViewController *detailVc = [[CompanyDetailViewController alloc] init];
        detailVc.Id = infoId;
        detailVc.type = _currentType;
        detailVc.titleText = title;
        detailVc.model = model;
        [self.navigationController pushViewController:detailVc animated:YES];
        return;
        
    }else if ([_currentType isEqualToString:@"show"]){
        ShowModel *model = _data[indexPath.row];
        infoId = model.ID;
        title = model.title;
        ShowDetailViewController *detailVc = [[ShowDetailViewController alloc] init];
        detailVc.Id = infoId;
        detailVc.type = _currentType;
        detailVc.titleText = title;
        [self.navigationController pushViewController:detailVc animated:YES];
        return;
    }else if ([_currentType isEqualToString:@"needs"]){
        NeedsModel *model = _data[indexPath.row];
        infoId = model.ID;
        title = model.title;
    }else if ([_currentType isEqualToString:@"blog"]){
        BlogModel *model = _data[indexPath.row];
        infoId = model.bid;
        title = model.title;
        BlogDetailViewController *detailVc = [[BlogDetailViewController alloc] init];
        detailVc.Id = infoId;
        detailVc.type = _currentType;
        detailVc.titleText = title;
        detailVc.model = model;
        [self.navigationController pushViewController:detailVc animated:YES];
        return;

    }else if ([_currentType isEqualToString:@"product"]){
        
    }else if ([_currentType isEqualToString:@"group"]){
        
    }else if ([_currentType isEqualToString:@"menu"]){
        
    }
    
    
    
    if (infoId) {
        DetailViewController *detailVc = [[DetailViewController alloc] init];
        detailVc.Id = infoId;
        detailVc.type = _currentType;
        detailVc.titleText = title;
        [self.navigationController pushViewController:detailVc animated:YES];
    }
}


#pragma mark ----------------代理collectionview

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _data.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (_typeTag) {
        case ListType7:
        {
            ListCell_0CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId_0 forIndexPath:indexPath];
            cell.newsModel = _data[indexPath.row];
            return cell;
        }
            break;
        case ListType8:
        {
            ListCell_0CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId_0 forIndexPath:indexPath];
            cell.companyModel = _data[indexPath.row];
            return cell;
        }
            break;
        case ListType9:
        {
            ListCell_1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId_1 forIndexPath:indexPath];
            return cell;

        }
            break;
        case ListType10:
        {
            ListCell_1CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId_1 forIndexPath:indexPath];
            return cell;

        }
            break;
        default:
            break;
    }
    return nil;
}


#pragma mark ----------------实例

- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake((SCREEN_WIDTH - 45) / 2, 144);
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 15;
        layout.sectionInset = UIEdgeInsetsMake(10, 15, 10, 15);
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT) collectionViewLayout:layout];;
        _collectionView.backgroundColor = WHITECOLOR;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[ListCell_0CollectionViewCell class] forCellWithReuseIdentifier:cellId_0];
        [_collectionView registerClass:[ListCell_1CollectionViewCell class] forCellWithReuseIdentifier:cellId_1];
        WeakObj(self);
        //下拉刷新
        _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakself loadDataWithRet:YES];
        }];
        
        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [weakself loadDataWithRet:NO];
        }];
        _collectionView.mj_footer.automaticallyHidden = YES;

    }
    return _collectionView;
}


@end
