//
//  HomeCollectionViewCell.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell ()

@property (nonatomic, strong) UIImageView *contentIv;


@end

@implementation HomeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.contentIv];
    }
    return self;
}

- (void)setImgName:(NSString *)imgName{
    _imgName = imgName;
    _contentIv.image = IMAGE(imgName);
}

#pragma mark ----------------shili 

- (UIImageView *)contentIv{
    if (!_contentIv) {
        _contentIv = [[UIImageView alloc] initWithFrame:self.bounds];
    }
    return _contentIv;
}


@end
