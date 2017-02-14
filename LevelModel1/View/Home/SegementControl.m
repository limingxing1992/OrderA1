//
//  SegementControl.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/26.
//  Copyright © 2016年 TSou. All rights reserved.
//


#import "SegementControl.h"

@interface SegementControl ()

/** 背景滚动菜单*/
@property (nonatomic, strong) UIScrollView *scrollView;
/** 菜单标题*/
@property (nonatomic, strong) NSArray *titles;
/** 保存标题视图*/
@property (nonatomic, strong) NSMutableArray *titleLbs;

/** 当前选中位置*/
@property (nonatomic, assign) NSInteger currentIndex;//默认选中标题 -- 0--
/** 上次选中位置*/
@property (nonatomic, assign) NSInteger lastIndex;

@end

@implementation SegementControl

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (self) {
        _titles = [NSArray arrayWithArray:titles];
        _lastIndex = 0;
        _titleLbs = [[NSMutableArray alloc] init];
        [self addSubview:self.scrollView];
        [self setUpFrame];
    }
    return self;
}

- (void)setUpFrame{
    CGFloat itemHeight = self.frame.size.height;
    CGFloat itemWidth;
    if (_titles.count <= 4) {
        itemWidth = SCREEN_WIDTH / _titles.count;
    }else{
        itemWidth = SCREEN_WIDTH / 4;
    }
    
    for (NSInteger i = 0; i < _titles.count; i++) {
        
        UIButton *btn = [[UIButton alloc] init];
        btn.frame = CGRectMake(i *itemWidth, 0, itemWidth, itemHeight);
        btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [btn setTitle:_titles[i] forState:UIControlStateNormal];
        [btn setTitleColor:SHENTEXTCOLOR forState:UIControlStateNormal];
        btn.tag = i;
        [btn setBackgroundColor:BACKColor];
        [btn addTarget:self action:@selector(menuTapped:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [btn setBackgroundColor:IndicatorColor];
        }
        [self.scrollView addSubview:btn];
        
        [_titleLbs addObject:btn];
    }
    
    [self.scrollView setContentSize:CGSizeMake(itemWidth *_titles.count, itemHeight)];
}

#pragma mark ----------------点击手势

- (void)menuTapped:(UIButton *)tap{
    NSInteger tag = tap.tag;
    if (tag == _lastIndex) {
        return;
    }else{
        UIButton *last = _titleLbs[_lastIndex];
        last.backgroundColor = BACKColor;
        UIButton *current = _titleLbs[tag];
        current.backgroundColor = IndicatorColor;
        if (self.delegate) {
            [self.delegate selectCurrentIndex:tag lastIndex:_lastIndex];
        }
        _lastIndex = tag;
    }
}



#pragma mark ----------------实例

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor = BACKColor;
    }
    return _scrollView;
}


@end
