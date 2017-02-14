//
//  STL_TextField.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/28.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "STL_TextField.h"

@interface STL_TextField ()
/** 输入框标题*/
@property (nonatomic, strong) UILabel *titleLb;
/** 输入框*/
@property (nonatomic, strong) UITextField *textField;

@end

@implementation STL_TextField


- (instancetype)initWithTitle:(NSString *)title placeHolder:(NSString *)placeHolder{
    self = [super init];
    if (self) {
        [self addSubview:self.titleLb];
        [self addSubview:self.textField];
        _titleLb.text = title;
        _textField.placeholder = placeHolder;
        
        _titleLb.sd_layout
        .centerYEqualToView(self)
        .leftSpaceToView(self, 0)
        .widthIs(95)
        .heightRatioToView(self, 1);
        
        _textField.sd_layout
        .leftSpaceToView(_titleLb, 0)
        .rightSpaceToView(self, 0)
        .centerYEqualToView(self)
        .heightRatioToView(self, 1);
    }
    return self;
}

- (NSString *)text{
    return self.textField.text;
}

/** 重写第一响应方法*/
- (BOOL)becomeFirstResponder{
    [_textField becomeFirstResponder];
    return YES;
}

/** 重写tag方法*/
- (void)setTag:(NSInteger)tag{
    _textField.tag = tag;
}

/** 设置安全输入*/
- (void)setSecrityBOOL:(BOOL)ret{
    _textField.secureTextEntry = ret;
}

#pragma mark ----------------设置输入框文本

- (void)setTfText:(NSString *)text{
    _textField.text = text;
}

- (void)setDelegate:(id<UITextFieldDelegate>)delegate{
    _textField.delegate = delegate;
}


#pragma mark ----------------实例

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc] init];
        _titleLb.font = FONT(16);
        _titleLb.textColor = BLACKTEXTCOLOR;
        _titleLb.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLb;
}

- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.font = FONT(16);
        _textField.textColor = BLACKTEXTCOLOR;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textField.returnKeyType = UIReturnKeyDone;
        _textField.rightView = [[UIImageView alloc] initWithImage:IMAGE(@"start")];
    }
    return _textField;
}

@end
