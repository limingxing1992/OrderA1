//
//  TravelCommentView.m
//  YSSCIOS
//
//  Created by 李明星 on 16/8/22.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import "TravelCommentView.h"

@interface TravelCommentView ()

@property (nonatomic, strong) UIView *lineView;//区分先



@end

@implementation TravelCommentView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineView];
        [self addSubview:self.commentTf];
        [self addSubview:self.commentLb];
        
        self.lineView.sd_layout
        .topSpaceToView(self, 0)
        .leftSpaceToView(self, 0)
        .rightSpaceToView(self, 0)
        .heightIs(0.5);
        
        self.commentTf.sd_layout
        .centerYEqualToView(self)
        .leftSpaceToView(self, 15)
        .rightSpaceToView(self, 70)
        .heightIs(36);
        
        self.commentLb.sd_layout
        .centerYEqualToView(self)
        .leftSpaceToView(self.commentTf, 5)
        .autoHeightRatio(0);
        [self.commentLb setSingleLineAutoResizeWithMaxWidth:200];
    }
    return self;
}


#pragma mark ----------------点击事件

- (void)gotoJugeTableAction{
    if (self.block) {
        self.block();
    }
}

#pragma mark ----------------实例化

- (UITextField *)commentTf{
    if (_commentTf == nil) {
        _commentTf = [[UITextField alloc] init];
        _commentTf.placeholder = @"   写评论";
        _commentTf.font = FONT(12);
        _commentTf.returnKeyType = UIReturnKeySend;
        _commentTf.textColor = BLACKTEXTCOLOR;
        _commentTf.borderStyle = UITextBorderStyleNone;
        _commentTf.layer.borderColor = GRAYCOLOR.CGColor;
        _commentTf.layer.borderWidth = 0.5;
        _commentTf.layer.cornerRadius = 2.5;
        _commentTf.clearButtonMode = UITextFieldViewModeWhileEditing;
    }
    return _commentTf;
}


- (UILabel *)commentLb{
    if (_commentLb == nil) {
        _commentLb = [[UILabel alloc] init];
        _commentLb.userInteractionEnabled = YES;
        _commentLb.textColor = LIGHTTEXTCOLOR;
        _commentLb.font = FONT(12);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gotoJugeTableAction)];
        [_commentLb addGestureRecognizer:tap];

    }
    return _commentLb;

}

- (UIView *)lineView{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor =GRAYCOLOR;
    }
    return _lineView;
}


@end
