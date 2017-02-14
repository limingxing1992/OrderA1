//
//  RegisterRuleViewController.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "RegisterRuleViewController.h"

@interface RegisterRuleViewController ()

@property (nonatomic, strong) UILabel *ruleLb;


@end

@implementation RegisterRuleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.name = @"条款和隐私保护政策";
    self.isAutoBack = NO;
    [self.view addSubview:self.ruleLb];
    self.ruleLb.sd_layout
    .topSpaceToView(self.view, 10)
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .autoHeightRatio(0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ----------------实例

- (UILabel *)ruleLb{
    if (!_ruleLb) {
        _ruleLb = [[UILabel alloc] init];
        _ruleLb.font = FONT(14);
        _ruleLb.textColor = BLACKTEXTCOLOR;
        _ruleLb.text = @"1、隐私权保护声明\n     本应用注重保护用户个人信息及个人隐私。本隐私权保护声明解释了用户个人信息收集和使用的有关情况，本隐私权保护声明适用于本应用的所有相关服务。\n\n2、您个人信息的收集\n     本应用为用户提供多种类型的互联网服务，包括但不限于网络资讯、信息发布等。在您注册、使用本应用服务时，经您的同意，我们收集与个人身份有关的信息，例如姓名、住址、手机号码等。如果您无法提供此类信息，可能会不能使用对应服务。\n\n3、您个人信息的管理\n     本应用会在如下情形使用您的个人信息：(1)符合法律法规的要求；（2）根据您的授权；（3）符合本应用相关服务条款、软件许可使用协议的约定；\n     本应用不会未经允许向第三方披露您的个人信息。除非满足下述情形之一： (1)根据法律法规的规定；（2）符合您与本应用之间的相关服务条款、软件许可使用协议的约定；\n\n4、您个人信息的安全\n     本应用严格保护您的个人信息安全。我们使用各种制度、安全技术和程序等措施来保护您的个人信息不被未经授权的访问、使用或泄漏。如果您对我们的个人信息保护有任何疑问，请联系我们。\n\n5、访问您的个人信息\n     如果您注册了本应用相关服务，您可以查阅或编辑您提交给本应用的个人信息。一般情况下，您可随时浏览、修改自己提交的信息，但出于安全性和身份识别（如号码申诉服务）的考虑，您可能无法修改注册时提供的初始注册信息及其他验证信息。\n\n     本应用会不时更新本隐私权保护声明。我们会在应用商店内更新对隐私权声明所做的变更内容。";
    }
    return _ruleLb;
}

@end
