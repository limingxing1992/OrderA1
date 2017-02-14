//
//  TypeDef.h
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef TypeDef_h
#define TypeDef_h

typedef void(^NILBlock)(void);//空block

typedef void(^STRBlock)(NSString *str);//参数为字符串类型的block

typedef void(^OBJBlock)(id responObject);//参数为id类型的block

typedef void(^ERRORBlock)(NSError *error);//参数为error的block

typedef void (^ERRORCODEBlock)(NSInteger errCode,NSString *errorMsg);//参数为解析后error的block

typedef NS_ENUM(NSInteger, ListType) {
    ListType0,
    ListType1,
    ListType2,
    ListType3,
    ListType4,
    ListType5,
    ListType6,
    ListType7,
    ListType8,
    ListType9,
    ListType10
};


#define LoginTextPostName @"logintextPostName"//
#define LoginTextReceiveName @"logintextreceiveName"

#define RegisterTextPostName @"RegistertextPostName"
#define RegisterTextReceiveName @"RegistertextreceiveName"


#define ReplaceTextPostName @"ReplacetextPostName"
#define ReplaceTextReceiveName @"ReplacetextreceiveName"





#endif /* TypeDef_h */
