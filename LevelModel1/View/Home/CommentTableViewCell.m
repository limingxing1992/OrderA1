//
//  CommentTableViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2017/1/4.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "CommentTableViewCell.h"

@interface CommentTableViewCell ()

@property (nonatomic, strong) UIImageView *logoIv;

@property (nonatomic, strong) UILabel *titleLb;

@property (nonatomic, strong) UILabel *contentLb;

@property (nonatomic, strong) UILabel *timeLb;




@end

@implementation CommentTableViewCell

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
        [self.contentView addSubview:self.logoIv];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.contentLb];
        [self.contentView addSubview:self.timeLb];
        [self autoLayoutSubViews];
    }
    return self;
}

- (void)autoLayoutSubViews{
    
    _logoIv.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(self.contentView, 15)
    .heightIs(50)
    .widthEqualToHeight();
    [_logoIv setSd_cornerRadiusFromWidthRatio:@0.5];
    
    _titleLb.sd_layout
    .topSpaceToView(self.contentView, 15)
    .leftSpaceToView(_logoIv, 15)
    .autoHeightRatio(0);
    [_titleLb setSingleLineAutoResizeWithMaxWidth:SCREEN_WIDTH];
    
    _contentLb.sd_layout
    .topSpaceToView(_titleLb, 15)
    .leftEqualToView(_titleLb)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    
    _timeLb.sd_layout
    .centerYEqualToView(_titleLb)
    .rightSpaceToView(self.contentView, 15)
    .autoHeightRatio(0);
    [_timeLb setSingleLineAutoResizeWithMaxWidth:300];
    
    [self setupAutoHeightWithBottomView:_contentLb bottomMargin:5];

}

- (void)setModel:(DiscussModel *)model{
    //更新用户头型
    WeakObj(self);
    [ShareBusinessManager.userManager showUserLogoWithDictionary:@{@"id":model.uid}
                                                         success:^(id object) {
                                                             
                                                             NSData *data = [AONEShareBusinessManager.userManager getImageDataByEncodingString:object];
                                                             UIImage *img = [UIImage imageWithData:data];
                                                             [weakself.logoIv setImage:img];                                                             
                                                         } failure:^(NSInteger errCode, NSString *errorMsg) {
                                                             [SVProgressHUD showErrorWithStatus:@"头像加载失败"];
                                                         }];
    
    _timeLb.text = model.regtime;
    _contentLb.text = model.content;
    _titleLb.text = model.userInfoModel.realname;
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
        _titleLb.font = FONT(15);
        _titleLb.textColor = RGBColor(1, 139, 248);
    }
    return _titleLb;
}

- (UILabel *)timeLb{
    if (!_timeLb) {
        _timeLb = [[UILabel alloc] init];
        _timeLb.font = FONT(15);
        _timeLb.textColor = BLACKTEXTCOLOR;
    }
    return _timeLb;
}

- (UILabel *)contentLb{
    if (!_contentLb) {
        _contentLb = [[UILabel alloc] init];
        _contentLb.font = FONT(15);
        _contentLb.textColor = BLACKTEXTCOLOR;
    }
    return _contentLb;
}



@end
