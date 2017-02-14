//
//  HomeViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "HomeViewController.h"
#import <SDAutoLayout.h>


@interface HomeViewController ()<SDCycleScrollViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

/** 背景画布*/
@property (nonatomic, strong) UIScrollView *contentView;
/** 头部背景图*/
@property (nonatomic, strong) UIImageView *topBackIv;
/** 折线图*/
@property (nonatomic, strong) UIImageView *indicatorIv;
/** 提示语图*/
@property (nonatomic, strong) UIImageView *noticeIv;
/** 轮播图*/
@property (nonatomic, strong) SDCycleScrollView *scorllView;
/** 下半部按钮集合*/
@property (nonatomic, strong) UICollectionView *downCollectionView;


/** 数据图片*/
@property (nonatomic, strong) NSArray *downData;


/** 真正数据源*/
@property (nonatomic, strong) NSMutableArray *data;

/** 首页banner*/
@property (nonatomic, strong) NSMutableArray *bannerData;



@end


static NSString *cellId = @"homeCell";

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavi];
    [self.view addSubview:self.contentView];
    //顶部背景视图
    [self.contentView addSubview:self.scorllView];
    [self.contentView addSubview:self.topBackIv];
    [self.contentView addSubview:self.indicatorIv];
    [self.contentView addSubview:self.noticeIv];
    [self initData];
    [self.contentView addSubview:self.downCollectionView];
    [self loadData];
    [self loadBannerData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self autoLayoutSubViews];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)setNavi{
    [self.navigationItem setTitleView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]]];
}

- (void)autoLayoutSubViews{
    _topBackIv.sd_layout
    .topSpaceToView(self.contentView, 0)
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .heightIs(205 *KHeight_Scale);
    
    _noticeIv.sd_layout
    .topSpaceToView(_topBackIv, 0)
    .centerXEqualToView(self.contentView)
    .widthIs(155)
    .heightIs(15 *KHeight_Scale);
    
    [self setUpBtn];

    _indicatorIv.sd_layout
    .topSpaceToView(_noticeIv, 0)
    .centerXEqualToView(self.contentView)
    .widthIs(SCREEN_WIDTH)
    .heightIs(30 *KHeight_Scale);
    
    _downCollectionView.sd_layout
    .topSpaceToView(_noticeIv, 170 *KHeight_Scale)
    .leftSpaceToView(self.contentView, 0)
    .widthIs(SCREEN_WIDTH)
    .heightIs(150 *KHeight_Scale);
    
    [_contentView setupAutoContentSizeWithBottomView:_downCollectionView bottomMargin:30];

}

/** 创建上半部按钮*/
- (void)setUpBtn{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Home" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *upBtns = dict[@"Up"];
    for (NSInteger i = 0; i < upBtns.count; i++) {
        UIButton *btn = [[UIButton alloc] init];
        [btn setBackgroundImage:IMAGE(upBtns[i][@"img"]) forState:UIControlStateNormal];
        [self.contentView addSubview:btn];
        CGFloat width = (SCREEN_WIDTH - 25)/ 4;
        CGFloat height = 130 *KHeight_Scale;
        CGFloat landce = 20 *KHeight_Scale ;
        if (i==1) {
            landce = 18 *KHeight_Scale ;
        }else if (i == 3){
            landce = 14 *KHeight_Scale;
        }
        btn.sd_layout
        .topSpaceToView(_noticeIv, landce)
        .leftSpaceToView(self.contentView, i *(width + 5))
        .heightIs(height)
        .widthIs(width);
        btn.tag = i +100;
        [btn addTarget:self action:@selector(upActionInfo:) forControlEvents:UIControlEventTouchUpInside];
    }
}

#pragma mark ----------------数据

- (void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Home" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    _downData = dict[@"Down"];
    _data = [[NSMutableArray alloc] init];
}

- (void)loadData{
    WeakObj(self);
    [SVProgressHUD showWithStatus:@"加载信息中"];
    
    /** os：端口型号 android-安卓 apple-苹果，cid：应用ID，result：每页显示数量，id：栏目ID*/
    [ShareBusinessManager.newsManager getOneChannelListWithDictionary:@{@"os":@"apple",
                                                                        @"cid":APPCID,
                                                                        } success:^(NSArray *channelsArray) {
                                                                            [SVProgressHUD dismiss];
                                                                            [weakself.data removeAllObjects];
                                                                            [weakself.data addObjectsFromArray:channelsArray];
                                                                        } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                            [SVProgressHUD showErrorWithStatus:@"加载失败"];
                                                                        }];

}

- (void)loadBannerData{
    //获取广告数据
    if (!_bannerData) {
        _bannerData = [[NSMutableArray alloc] init];
    }
    
    WeakObj(self);
    [AONEShareBusinessManager.advManager getAdvsWithDictionary:@{@"cid":APPCID,
                                                             @"size":PAGESIZE}
                                                   success:^(NSArray *advsArray) {
                                                       [_bannerData addObjectsFromArray:advsArray];
                                                       [weakself updateBanner];
                                                       
                                                   } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                       [SVProgressHUD showErrorWithStatus:@"加载失败"];
                                                   }];
    
}

/** 刷新banner*/
- (void)updateBanner{
    NSMutableArray *ary = [[NSMutableArray alloc] init];
    for (AdvModel *model in _bannerData) {
        [ary addObject:LOGOURL(model.logo)];
    }
    [_scorllView setImageURLStringsGroup:ary];
}

#pragma mark ----------------界面逻辑入口

/** 集合按钮*/
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (_data.count >= indexPath.row + 5) {
        ChannelModel *model = _data[indexPath.row + 4];
        [self intoListVcByModel:model];
    }else{
        [SVProgressHUD showErrorWithStatus:@"信息错误"];
        return;
    }
}
/** 上半部按钮*/
- (void)upActionInfo:(UIButton *)btn{
    
    if (_data.count <= btn.tag - 100) {
        [SVProgressHUD showErrorWithStatus:@"信息错误"];
        return;
    }
    //防止数组越
    ChannelModel *model = _data[btn.tag - 100];
    [self intoListVcByModel:model];
    
}

/** 根据model模型内type属性和typeId字段判断进入什么类型界面*/
- (void)intoListVcByModel:(ChannelModel *)model{
    
    if ([model.type isEqualToString:@"news"]) {
        //列表页（无菜单）
        List_1ViewController *listVc = [[List_1ViewController alloc] init];
        listVc.model = model;
        [self.navigationController pushViewController:listVc animated:YES];
        
        
    }else if ([model.type isEqualToString:@"menu"]){
        switch (model.typeId.integerValue) {
            case 0:
            {
                //列表页（有菜单）
                List_0ViewController *listVc = [[List_0ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];

            }
                break;
            case 1:
            {
                //列表页（无菜单）
                List_1ViewController *listVc = [[List_1ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];

            }
                break;
            case 2:
            {
                //列表页（一排两个的collectionview）
                List_2ViewController *listVc = [[List_2ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];

            }
                break;
            default:
                break;
        }
        
        
        
    }else if ([model.type isEqualToString:@"image"]){
        
        switch (model.typeId.integerValue) {
            case 0:
            {
                //列表页（无菜单）
                List_1ViewController *listVc = [[List_1ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];

            }
                break;
            case 1:
            {
                //列表页(collectionview）
                List_2ViewController *listVc = [[List_2ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];

            }
                break;
            case 2:
            {
                //列表页（无菜单）
                List_1ViewController *listVc = [[List_1ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];

            }
                break;
            case 1000:
            {
                //和0一致，详情页添加投票模块
                List_1ViewController *listVc = [[List_1ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];
            }
                break;
            default:
                break;
        }

        
        
    }else if ([model.type isEqualToString:@"company"]){
        
        switch (model.typeId.integerValue) {
            case 0:
            {
                //列表页（一行两张图collectiview）
                List_2ViewController *listVc = [[List_2ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];
                
            }
                break;
            case 1:
            {
                //列表页(无菜单）
                List_1ViewController *listVc = [[List_1ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];
                
            }
                break;
            case 2501:
            {
                //和1一致，详情页添加预订功能
                List_1ViewController *listVc = [[List_1ViewController alloc] init];
                listVc.model = model;
                [self.navigationController pushViewController:listVc animated:YES];
                
            }
                break;
            default:
                break;
        }

        
    }else if ([model.type isEqualToString:@"txt"]){
            //(超链接。直接进入H5页面。地址为)
//            NSLog(@"%@", model.content);
        DetailWebViewController *web = [[DetailWebViewController alloc] init];
        web.url = [NSURL URLWithString:model.content];
        [self.navigationController pushViewController:web animated:YES];
        
    }else if ([model.type isEqualToString:@"show"]){
        //列表页（无菜单）
        List_1ViewController *listVc = [[List_1ViewController alloc] init];
        listVc.model = model;
        [self.navigationController pushViewController:listVc animated:YES];
        
    }else if ([model.type isEqualToString:@"needs"]){
        //列表页（无菜单）

        List_1ViewController *listVc = [[List_1ViewController alloc] init];
        listVc.model = model;
        [self.navigationController pushViewController:listVc animated:YES];

    }else if ([model.type isEqualToString:@"blog"]){
        //列表页（无菜单）
        
        List_1ViewController *listVc = [[List_1ViewController alloc] init];
        listVc.model = model;
        [self.navigationController pushViewController:listVc animated:YES];

        
    }else if ([model.type isEqualToString:@"product"]){
        //列表页（一行两张图collectiview）
        List_2ViewController *listVc = [[List_2ViewController alloc] init];
        listVc.model = model;
        [self.navigationController pushViewController:listVc animated:YES];

    }else if ([model.type isEqualToString:@"group"]){
        //列表页（一行两张图collectiview）
        List_2ViewController *listVc = [[List_2ViewController alloc] init];
        listVc.model = model;
        [self.navigationController pushViewController:listVc animated:YES];

    }else{
        [SVProgressHUD showErrorWithStatus:@"找不到对应类型，无法进入列表页"];
    }

}


#pragma mark ----------------首页banner代理

/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    AdvModel *model = _bannerData[index];
    DetailWebViewController *detailVc = [[DetailWebViewController alloc] init];
    detailVc.url = [ShareBusinessManager.advManager getAdvDetailUrlWithID:model.ID];
    [self.navigationController pushViewController:detailVc animated:YES];
}


#pragma mark ----------------collection代理

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _downData.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.imgName = _downData[indexPath.row][@"img"];
    return cell;
}


#pragma mark ----------------实例

- (UIScrollView *)contentView{
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT - TabBar_HEIGHT)];
        _contentView.backgroundColor = WHITECOLOR;
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.showsVerticalScrollIndicator = NO;
    }
    return _contentView;
}

- (UIImageView *)topBackIv{
    if (!_topBackIv) {
        _topBackIv = [[UIImageView alloc] init];
        _topBackIv.image = [UIImage imageNamed:@"bg_banner"];
    }
    return _topBackIv;
}

- (UIImageView *)indicatorIv{
    if (!_indicatorIv) {
        _indicatorIv = [[UIImageView alloc] init];
        _indicatorIv.image = [UIImage imageNamed:@"classify10"];
        [_indicatorIv setBackgroundColor: [UIColor redColor]];
    }
    return _indicatorIv;
}

- (UIImageView *)noticeIv{
    if (!_noticeIv) {
        _noticeIv = [[UIImageView alloc] init];
        _noticeIv.image = [UIImage imageNamed:@"classify12"];
    }
    return _noticeIv;
}

- (SDCycleScrollView *)scorllView{
    if (!_scorllView) {
        _scorllView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 205 *KHeight_Scale) delegate:self placeholderImage:Placeholder_big];
//        _scorllView.autoScroll = NO;//关闭自动轮播
        _scorllView.showPageControl = NO;
        [_scorllView setShowPageControl:YES];
        _scorllView.delegate = self;
    }
    return _scorllView;
}

- (UICollectionView *)downCollectionView{
    if (!_downCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        CGFloat width = 65 *KWidth_Scale;
        CGFloat height = 150 *KHeight_Scale;
        layout.itemSize = CGSizeMake(width, height);
        layout.minimumInteritemSpacing = 5;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _downCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _downCollectionView.delegate = self;
        _downCollectionView.dataSource = self;
        _downCollectionView.backgroundColor = WHITECOLOR;
        [_downCollectionView registerClass:[HomeCollectionViewCell class] forCellWithReuseIdentifier:cellId];
        _downCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _downCollectionView;
}

@end
