//
//  CommenIdea.m
//  LevelModel1
//
//  Created by 李明星 on 2016/12/27.
//  Copyright © 2016年 TSou. All rights reserved.
//

#import "CommenIdea.h"

@implementation CommenIdea

+ (UINavigationController *)loginNavi{
    LoginViewController *loginVc = [[LoginViewController alloc] init];
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:loginVc];
    [navi.navigationBar setBackgroundImage:[UIImage imageNamed:@"bg_header_small"] forBarMetrics:UIBarMetricsDefault];
    return navi;
}

+ (BOOL)isLogin{
    
    if ([UserDefault objectForKey:@"userId"]) {
        return YES;
    }
    return NO;
}

+ (NSURL *)imgUrl:(NSString *)str{
    NSString *fillStr = [NSString stringWithFormat:@"https://appserver.1035.mobi/MobiSoftManage/upload/%@",str];
    return [NSURL URLWithString:fillStr];
}


+ (NSString*)image2ByteStr:(UIImage*)image
{
    UIImage *newImg = [CommenIdea scaleToSize:CGSizeMake(300, 300) byImage:image];
    
    NSData *imageData = UIImagePNGRepresentation(newImg);
    Byte *imageByte = (Byte *)[imageData bytes];
    NSMutableString *imageStr = [[NSMutableString alloc] init];
    for(int i=0;i<[imageData length];i++)
        [imageStr appendFormat:@",%d",imageByte[i]];
    
    [imageStr deleteCharactersInRange:NSMakeRange(0, 1)];
    return imageStr;
}

+ (UIImage*)scaleToSize:(CGSize)size byImage:(UIImage *)img
{
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}

@end
