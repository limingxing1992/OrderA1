//
//  ListCell_0CollectionViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/29.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "ListCell_0CollectionViewCell.h"

@interface ListCell_0CollectionViewCell ()
/** 图片*/
@property (nonatomic, strong) UIImageView *logoIv;

/** 标题*/
@property (nonatomic, strong) UILabel *titleLb;

@end

@implementation ListCell_0CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = WHITECOLOR;
        [self.contentView addSubview:self.logoIv];
        [self.contentView addSubview:self.titleLb];
        
        self.logoIv.sd_layout
        .topSpaceToView(self.contentView, 5)
        .leftSpaceToView(self.contentView, 5)
        .rightSpaceToView(self.contentView, 5)
        .heightIs(110);
        
        _titleLb.sd_layout
        .centerXEqualToView(_logoIv)
        .topSpaceToView(_logoIv, 10)
        .heightIs(16);
        [_titleLb setSingleLineAutoResizeWithMaxWidth:frame.size.width];
        
    }
    return self;
}


#pragma mark ----------------数据处理

- (void)setNewsModel:(NewsModel *)newsModel{
    _newsModel = newsModel;
    _titleLb.text = newsModel.title;
    [_logoIv sd_setImageWithURL:LOGOURL(newsModel.logo) placeholderImage:Placeholder_middle];
}

- (void)setCompanyModel:(CompanyModel *)companyModel{
    _companyModel = companyModel;
    _titleLb.text = companyModel.title;
    [_logoIv sd_setImageWithURL:LOGOURL(companyModel.logo) placeholderImage:Placeholder_middle];
}


#pragma mark ----------------实例

- (UIImageView *)logoIv{
    if (!_logoIv) {
        _logoIv = [[UIImageView alloc] init];
    }
    return _logoIv;
}


- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(16);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _logoIv.layer.shadowOffset = CGSizeMake(5, 5);
        _logoIv.layer.shadowColor = BLACKCOLOR.CGColor;
        _logoIv.layer.shadowRadius = 5;
        _logoIv.layer.shadowOpacity = 1.0;

    }
    return _titleLb;
}


@end
