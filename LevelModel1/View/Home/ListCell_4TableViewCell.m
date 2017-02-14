//
//  ListCell_4TableViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/29.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "ListCell_4TableViewCell.h"

@interface ListCell_4TableViewCell ()

/** 标题*/
@property (nonatomic, strong) UILabel *titleLb;
/** 主办方*/
@property (nonatomic, strong) UILabel *shortLb;
/** 时间标题*/
@property (nonatomic, strong) UILabel *timeLb;
/** 图片*/
@property (nonatomic, strong) UIImageView *logoIv;
/** 展会状态*/
@property (nonatomic, strong) UILabel *styleLb;



@end

@implementation ListCell_4TableViewCell

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
        [self.contentView sd_addSubviews:@[self.titleLb, self.shortLb, self.logoIv, self.styleLb, self.timeLb]];
        
        _logoIv.sd_layout
        .topSpaceToView(self.contentView, 15)
        .leftSpaceToView(self.contentView, 15)
        .bottomSpaceToView(self.contentView, 40)
        .widthIs(70);
        
        
        self.titleLb.sd_layout
        .topSpaceToView(self.contentView, 15)
        .rightSpaceToView(self.contentView, 30)
        .leftSpaceToView(_logoIv, 10)
        .autoHeightRatio(0);
        [_titleLb setMaxNumberOfLinesToShow:1];
        
        _styleLb.sd_layout
        .topSpaceToView(_logoIv, 10)
        .centerXEqualToView(_logoIv)
        .autoHeightRatio(0);
        [_styleLb setSingleLineAutoResizeWithMaxWidth:200];
        
        
        _shortLb.sd_layout
        .centerYEqualToView(self.contentView)
        .leftEqualToView(_titleLb)
        .rightEqualToView(_titleLb)
        .autoHeightRatio(0);
        [_shortLb setMaxNumberOfLinesToShow:1];
        
        _timeLb.sd_layout
        .centerYEqualToView(_styleLb)
        .leftEqualToView(_titleLb)
        .rightEqualToView(_titleLb)
        .autoHeightRatio(0);
        [_timeLb setMaxNumberOfLinesToShow:1];
    
        
    }
    return self;
}


- (void)setModel:(ShowModel *)model{
    _model  = model;
    _titleLb.text = model.title;
    _shortLb.text = [NSString stringWithFormat:@"主办方：%@", model.master];
    _timeLb.text = [NSString stringWithFormat:@"参展时间：%@至%@", model.starttime, _model.endtime];
    [_logoIv sd_setImageWithURL:LOGOURL(model.logo) placeholderImage:Placeholder_middle];
    
    _styleLb.text = model.status;

    if ([model.status isEqualToString:@"未开始"]) {
        _styleLb.textColor = [UIColor redColor];
    }else{
        _styleLb.textColor = RGBColor(72, 253, 75);
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

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.textColor = SHENTEXTCOLOR;
        _timeLb.font = FONT(13);
    }
    return _timeLb;
}

- (UILabel *)styleLb{
    if (!_styleLb) {
        _styleLb = [[UILabel alloc] init];
        _styleLb.font = FONT(13);
        _styleLb.textColor = RGBColor(72, 253, 75);
    }
    return _styleLb;
}



@end
