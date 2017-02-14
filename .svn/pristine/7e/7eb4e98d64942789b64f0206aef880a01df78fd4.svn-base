//
//  SettingViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "SettingViewController.h"
#import "QRCodeViewController.h"
#import "SettingSearchViewController.h"




@interface SettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** 设置数据源*/
@property (nonatomic, strong) NSArray *data;


@end

static NSString *cellId = @"settingId";

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.name = @"设置";
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
}


#pragma mark ----------------数据处理

- (void)initData{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Setting" ofType:@"plist"];
    _data = [NSArray arrayWithContentsOfFile:path];
}


#pragma mark ----------------界面逻辑

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WeakObj(self);
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {//进入关于我们
                [ShareBusinessManager.helpManager getUserHelpsWithDictionary:@{@"cid":APPCID}
                                                                     success:^(NSArray *helpsArray) {
                                                                         [weakself intoAboutUsByModel:helpsArray.firstObject];
                                                                     } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                         [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                     }];
            }
                break;
            case 1:
            {//进入新手帮助
                [ShareBusinessManager.helpManager getUserHelpsWithDictionary:@{@"cid":APPCID}
                                                                     success:^(NSArray *helpsArray) {
                                                                         NSLog(@"%@", helpsArray);
                                                                         [weakself intoHelpByModel:helpsArray[1]];
                                                                     } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                                         [SVProgressHUD showErrorWithStatus:errorMsg];
                                                                     }];
            }
                break;
                
            default:
                break;
        }
    }else if (indexPath.section == 1){
        switch (indexPath.row) {
            case 0:
            {//分享
                [self shareAction];
            }
                break;
            case 1:
            {//进入意见反馈
                if (!IsLogin) {
                    [SVProgressHUD showErrorWithStatus:@"请先登录"];
                    return;
                }
                
                IdeaAboutEditViewController *ideaVc = [[IdeaAboutEditViewController alloc] init];
                [self.navigationController pushViewController:ideaVc animated:YES];
            }
                break;
            case 2:
            {//进入二维码扫描
                [self qrCodeAction];
            }
                break;
            case 3:
            {//进入搜索
                SettingSearchViewController *searchVc = [[SettingSearchViewController alloc] init];
                [self.navigationController pushViewController:searchVc animated:YES];
            }
                break;
            default:
                break;
        }
    }
}

/** 进入新手帮助*/
- (void)intoHelpByModel:(HelpModel *)model{
   NSURL *url =[ShareBusinessManager.helpManager getHelpsDetailUrlWithID:model.ID];
    DetailWebViewController *webVc = [[DetailWebViewController alloc] init];
    webVc.name = @"新手帮助";
    webVc.url = url;
    [self.navigationController pushViewController:webVc animated:YES];
}
/** 进入关于我们*/
- (void)intoAboutUsByModel:(HelpModel *)model{
    NSURL *url =[ShareBusinessManager.helpManager getHelpsDetailUrlWithID:model.ID];
    DetailWebViewController *webVc = [[DetailWebViewController alloc] init];
    webVc.name = @"关于我们";
    webVc.url = url;
    [self.navigationController pushViewController:webVc animated:YES];
}
/** 分享*/
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
/** 二维码扫描*/
- (void)qrCodeAction{
    QRCodeViewController *qrVc = [[QRCodeViewController alloc] init];
    [self.navigationController pushViewController:qrVc animated:YES];
}



#pragma mark ----------------tableview代理

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _data.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_data[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    cell.textLabel.font = FONT(18);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.imageView.image = IMAGE(_data[indexPath.section][indexPath.row][@"img"]);
    cell.textLabel.text = _data[indexPath.section][indexPath.row][@"title"];
    cell.accessoryView = [[UIImageView alloc] initWithImage:IMAGE(@"classify8-1")];
    return cell;
}

#pragma mark ----------------实例

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT - TabBar_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
    }
    return _tableView;
}


@end
