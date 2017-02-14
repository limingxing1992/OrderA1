//
//  KeyModel.h
//  ZYLAONE
//
//  Created by 张永亮 on 2016/12/29.
//  Copyright © 2016年 zzz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyModel : NSObject

@property (nonatomic, copy) NSString *chid;    //栏目ID
@property (nonatomic, copy) NSString *cid;     //应用ID
@property (nonatomic, copy) NSString *click;   //点击量
@property (nonatomic, copy) NSString *ID;      //关键字ID
@property (nonatomic, copy) NSString *str;     //关键字

@end
