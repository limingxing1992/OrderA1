//
//  SearchTableViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/30.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "SearchTableViewCell.h"

@interface SearchTableViewCell ()
/** 关键词*/
@property (nonatomic, strong) UILabel *keyLb;
/** 被搜索次数*/
@property (nonatomic, strong) UILabel *clickLb;

@end

@implementation SearchTableViewCell

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
        self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
        self.selectedBackgroundView.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:self.placeLb];
        [self.contentView addSubview:self.keyLb];
        [self.contentView addSubview:self.clickLb];
        
        _placeLb.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(self.contentView, 15)
        .heightIs(20)
        .widthEqualToHeight();
        [_placeLb setSd_cornerRadiusFromHeightRatio:@0.5];
        
        _keyLb.sd_layout
        .centerYEqualToView(self.contentView)
        .leftSpaceToView(_placeLb, 10)
        .heightIs(18);
        [_keyLb setSingleLineAutoResizeWithMaxWidth:300];
        
        _clickLb.sd_layout
        .centerYEqualToView(self.contentView)
        .rightSpaceToView(self.contentView, 15)
        .autoHeightRatio(0);
        [_clickLb setSingleLineAutoResizeWithMaxWidth:300];
        
    }
    return self;
}


- (void)setModel:(KeyModel *)model{
    _keyLb.text = model.str;
    _clickLb.text = model.click;
}

#pragma mark ----------------实例

- (UILabel *)keyLb{
    if (!_keyLb) {
        _keyLb = [[UILabel alloc] init];
        _keyLb.font = FONT(18);
        _keyLb.textColor = BLACKTEXTCOLOR;
    }
    return _keyLb;
}

- (UILabel *)placeLb{
    if (!_placeLb) {
        _placeLb  = [[UILabel alloc] init];
        _placeLb.backgroundColor = GRAYCOLOR;
        _placeLb.textColor = WHITECOLOR;
        _placeLb.font = FONT(16);
        _placeLb.textAlignment = NSTextAlignmentCenter;
    }
    return _placeLb;
}

- (UILabel *)clickLb{
    if (!_clickLb) {
        _clickLb = [[UILabel alloc] init];
        _clickLb.font = FONT(14);
        _clickLb.textColor = [UIColor redColor];
    }
    return _clickLb;
}

@end
