//
//  SearchResultListViewController.h
//  LevelModel1
//
//  Created by 李明星 on 2016/12/30.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "BaseViewController.h"

@interface SearchResultListViewController : BaseViewController

@property (nonatomic, copy) NSString *keyWord;

/** 搜索类型。不传为全部*/
@property (nonatomic, copy) NSString *type;

/** 搜索分类id, 不传为全部*/
@property (nonatomic, copy) NSNumber *Id;


@end
