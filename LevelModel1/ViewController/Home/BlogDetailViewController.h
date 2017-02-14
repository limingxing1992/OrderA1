//
//  BlogDetailViewController.h
//  LevelModel1
//
//  Created by 李明星 on 2017/1/5.
//  Copyright © 2017年 TSou. All rights reserved.
//

#import "BaseViewController.h"

@interface BlogDetailViewController : BaseViewController
/** 当前网页标题必传，。否则评论消息会丢失*/
@property (nonatomic, copy) NSString *titleText;
/** 必穿，当前网页类型*/
@property (nonatomic, copy) NSString *type;
/** 必穿，当前网页id*/
@property (nonatomic, strong) NSNumber *Id;

@property (nonatomic, strong) BlogModel *model;

@end
