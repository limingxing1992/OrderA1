//
//  SegementControl.h
//  LevelModel1
//
//  Created by 李明星 on 2016/12/26.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SegementControlDelegate <NSObject>

- (void)selectCurrentIndex:(NSInteger)index lastIndex:(NSInteger)lastIndex;

@end

@interface SegementControl : UIView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@property (nonatomic, assign) id<SegementControlDelegate> delegate;

@end
