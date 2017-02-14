//
//  MyCommentTableViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/29.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "MyCommentTableViewCell.h"

@interface MyCommentTableViewCell ()


@property (nonatomic, strong) UIImageView *indicatorIv;

@property (nonatomic, strong) UILabel *timeLb;

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UIImageView *commentBackIv;

@property (nonatomic, strong) UILabel *contentLb;


@end

@implementation MyCommentTableViewCell

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
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.indicatorIv];
        [self.contentView addSubview:self.commentBackIv];
        [self.contentView addSubview:self.timeLb];
        
        _titleLb.sd_layout
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 35)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        
        _indicatorIv.sd_layout
        .centerYEqualToView(_titleLb)
        .leftSpaceToView(self.contentView, 15)
        .heightIs(10)
        .widthEqualToHeight();
        
        
        _commentBackIv.sd_layout
        .topSpaceToView(_titleLb, 0)
        .leftEqualToView(_titleLb)
        .rightEqualToView(_titleLb);
        
        _contentLb.sd_layout
        .topSpaceToView(_commentBackIv, 20)
        .leftSpaceToView(_commentBackIv, 5)
        .rightSpaceToView(_commentBackIv, 5)
        .autoHeightRatio(0);
        [_commentBackIv setupAutoHeightWithBottomView:_contentLb bottomMargin:10];
        

        _timeLb.sd_layout
        .topSpaceToView(_commentBackIv, 10)
        .leftEqualToView(_commentBackIv)
        .rightEqualToView(_commentBackIv)
        .autoHeightRatio(0);

        
        
        
        [self setupAutoHeightWithBottomView:_timeLb bottomMargin:10];
        
    }
    return self;
}


- (void)setModel:(DiscussModel *)model{
    _timeLb.text = model.regtime;
    _titleLb.text = model.title;
    _contentLb.text= model.content;
}

#pragma mark ----------------实例

- (UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [[UILabel alloc] init];
        _contentLb.font = FONT(14);
        _contentLb.textColor = BLACKTEXTCOLOR;
    }
    return _contentLb;
}


- (UIImageView *)commentBackIv{
    if (!_commentBackIv) {
        _commentBackIv = [[UIImageView alloc] init];
        _commentBackIv.image = IMAGE(@"dt_commentBubble");
        [_commentBackIv addSubview:self.contentLb];
    }
    return _commentBackIv;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(16);
        _titleLb.textColor= BLACKTEXTCOLOR;
    }
    return _titleLb;
}

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(14);
        _timeLb.textColor = SHENTEXTCOLOR;
    }
    return _timeLb;
}

- (UIImageView *)indicatorIv{
    if (!_indicatorIv) {
        _indicatorIv = [[UIImageView alloc] init];
        _indicatorIv.image = IMAGE(@"dt_commentRedPoint");
    }
    return _indicatorIv;
}

@end
