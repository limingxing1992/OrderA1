//
//  QRCodeViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "QRCodeViewController.h"

#define Lance 260 *KHeight_Scale

@interface QRCodeViewController ()
/** 背景框*/
@property (nonatomic, strong) UIImageView *frameIv;
/** 上条*/
@property (nonatomic, strong) UIImageView *upIv;
/** 下条*/
@property (nonatomic, strong) UIImageView *downIv;



@end

@implementation QRCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.name = @"二维码扫描";
    
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.isAutoBack = NO;
    [self.view addSubview:self.frameIv];
    
    self.frameIv.sd_layout
    .centerXEqualToView(self.view)
    .centerYEqualToView(self.view)
    .heightIs(260 *KHeight_Scale)
    .widthEqualToHeight();
    
    [self.frameIv addSubview:self.upIv];
    [self.frameIv addSubview:self.downIv];
    //设置起始位置
    self.upIv.frame = CGRectMake(0, 0, Lance, 15);
//    self.downIv.frame = CGRectMake(0, Lance - 17, Lance, 17);

    
    
    [[YB_QRCodeTool shareInstance] setIsDrawQRCodeRect:NO];
    [[YB_QRCodeTool shareInstance] setInsteretRect:self.view.bounds];
    [[YB_QRCodeTool shareInstance] beginScanInView:self.view result:^(NSArray<NSString *> *resultStrs) {
        
    }];
    
    [self upAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ----------------动画


- (void)upAnimation{
    self.upIv.image = IMAGE(@"greenbar2");
    [UIView animateWithDuration:3.0f animations:^{
        self.upIv.frame = CGRectMake(0, Lance - 17, Lance, 15);
    } completion:^(BOOL finished) {
        [self downAnimaiton];
    }];
}

- (void)downAnimaiton{
    self.upIv.image = IMAGE(@"greenbar1");
    [UIView animateWithDuration:3.0f animations:^{
        self.upIv.frame = CGRectMake(0, 0, Lance, 15);
    } completion:^(BOOL finished) {
        [self upAnimation];
    }];
}

#pragma mark ----------------实例

- (UIImageView *)frameIv{
    if (!_frameIv) {
        _frameIv = [[UIImageView alloc] init];
        _frameIv.image = IMAGE(@"frame");
    }
    return _frameIv;
}

- (UIImageView *)upIv{
    if (!_upIv) {
        _upIv = [[UIImageView alloc] init];
        _upIv.image = IMAGE(@"greenbar2");
    }
    return _upIv;
}

- (UIImageView *)downIv{
    if (!_downIv) {
        _downIv = [[UIImageView alloc] init];
        _downIv.image = IMAGE(@"greenbar1");
    }
    return _downIv;
}



@end
