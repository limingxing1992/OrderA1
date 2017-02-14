//
//  DetailWebViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/30.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "DetailWebViewController.h"
#import <WebKit/WebKit.h>

@interface DetailWebViewController ()<WKNavigationDelegate, UITextFieldDelegate>
/** h5页面*/
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation DetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isAutoBack = NO;
    [self.view addSubview:self.webView];
    
    [SVProgressHUD show];
    [self.webView loadRequest:[NSURLRequest requestWithURL:_url]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark ----------------wkWebView代理

/// 2 页面开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
/// 4 开始获取到网页内容时返回
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}
/// 5 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
}
/// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
    [SVProgressHUD dismiss];
}

#pragma mark ----------------实例化

- (WKWebView *)webView{
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - NaviBar_HEIGHT)];
        _webView.navigationDelegate = self;
    }
    return _webView;
}

@end
