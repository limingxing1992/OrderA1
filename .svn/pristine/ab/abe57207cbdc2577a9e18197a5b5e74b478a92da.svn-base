//
//  ListCell_0TableViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/29.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "ListCell_0TableViewCell.h"

@interface ListCell_0TableViewCell ()

/** 标题*/
@property (nonatomic, strong) UILabel *titleLb;
/** 简介*/
@property (nonatomic, strong) UILabel *shortLb;
/** 图片*/
@property (nonatomic, strong) UIImageView *logoIv;


@end

@implementation ListCell_0TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView sd_addSubviews:@[self.titleLb, self.shortLb, self.logoIv]];
        
        
        _logoIv.sd_layout
        .topSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 15)
        .heightIs(70)
        .widthIs(70);
        
        
        self.titleLb.sd_layout
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 15)
        .rightSpaceToView(_logoIv, 10)
        .autoHeightRatio(0);
        [_titleLb setMaxNumberOfLinesToShow:2];
        
        
        _shortLb.sd_layout
        .topSpaceToView(_titleLb, 15)
        .leftEqualToView(_titleLb)
        .rightEqualToView(_titleLb)
        .autoHeightRatio(0);
        [_shortLb setMaxNumberOfLinesToShow:2];
        
    }
    return self;
}


- (void)setModel:(NewsModel *)model{
    _model  = model;
    _titleLb.text = model.title;
    _shortLb.text = model.des;
    
    if (model.logo.length == 0 || [model.logo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        [_logoIv sd_setImageWithURL:LOGOURL(model.logo) placeholderImage:Placeholder_middle];
    }
    
}

- (void)setFavoModel:(FavModel *)favoModel{
    _favoModel = favoModel;
    
    _titleLb.text = favoModel.infotitle;
    _shortLb.text = [NSString stringWithFormat:@"收藏时间：%@", favoModel.regtime];
    
    
    
    if (favoModel.infologo.length == 0 || [favoModel.infologo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        if ([favoModel.infotype isEqualToString:@"needs"]) {
            NSString *url = [NSString stringWithFormat:@"https://appserver.1035.mobi/MobiSoft/upload/%@", favoModel.infologo];
            [_logoIv sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:Placeholder_middle];
        }else{
            [_logoIv sd_setImageWithURL:LOGOURL(favoModel.infologo) placeholderImage:Placeholder_middle];
        }
    }
    
}


- (void)setSearchModel:(SearchModel *)searchModel{
    _searchModel = searchModel;
    _titleLb.text = _searchModel.title;
    _shortLb.text = _searchModel.des;
    
    if (_searchModel.logo.length == 0 || [_searchModel.logo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        if ([_searchModel.type isEqualToString:@"needs"]) {
            NSString *url = [NSString stringWithFormat:@"https://appserver.1035.mobi/MobiSoft/upload/%@", _searchModel.logo];
            [_logoIv sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:Placeholder_middle];
        }else{
            [_logoIv sd_setImageWithURL:LOGOURL(_searchModel.logo) placeholderImage:Placeholder_middle];
        }
    }

}

- (void)setCompanyModel:(CompanyModel *)companyModel{
    _companyModel = companyModel;
    _titleLb.text = _companyModel.title;
    _shortLb.text = _companyModel.des;
    
    if (_companyModel.logo.length == 0 || [_companyModel.logo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        [_logoIv sd_setImageWithURL:LOGOURL(_companyModel.logo) placeholderImage:Placeholder_middle];
    }

}

- (void)setNeedModel:(NeedsModel *)needModel{
    _needModel = needModel;
    _titleLb.text = _needModel.title;
    _shortLb.text = _needModel.regtime;
    
    if (_needModel.logo.length == 0 || [_needModel.logo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        NSString *url = [NSString stringWithFormat:@"https://appserver.1035.mobi/MobiSoft/upload/%@", _needModel.logo];
        [_logoIv sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:Placeholder_middle];
    }

}

- (void)setBlogModel:(BlogModel *)blogModel{
    _blogModel = blogModel;
    _titleLb.text = _blogModel.title;
    _shortLb.text = _blogModel.content;
    
    if (_blogModel.logo.length == 0 || [_blogModel.logo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        [_logoIv sd_setImageWithURL:LOGOURL(_blogModel.logo) placeholderImage:Placeholder_middle];
    }

}

- (void)setProductModel:(ProductModel *)productModel{
    _productModel = productModel;
    _titleLb.text = _productModel.title;
    _shortLb.text = _productModel.des1;
    
    if (_productModel.logo.length == 0 || [_productModel.logo isEqualToString:@"0.gif"]) {
        _logoIv.sd_layout
        .widthIs(0);
    }else{
        _logoIv.sd_layout
        .widthIs(70);
        [_logoIv sd_setImageWithURL:LOGOURL(_productModel.logo) placeholderImage:Placeholder_middle];
    }
}

#pragma mark ----------------实例

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb  = [[UILabel alloc] init];
        _titleLb.font = FONT(15);
        _titleLb.textColor = BLACKTEXTCOLOR;
    }
    return _titleLb;
}

- (UILabel *)shortLb{
    if (!_shortLb) {
        _shortLb = [[UILabel alloc] init];
        _shortLb.font = FONT(13);
        _shortLb.textColor = SHENTEXTCOLOR;
    }
    return _shortLb;
}

- (UIImageView *)logoIv{
    if (!_logoIv) {
        _logoIv = [[UIImageView alloc] init];
    }
    return _logoIv;
}

@end
