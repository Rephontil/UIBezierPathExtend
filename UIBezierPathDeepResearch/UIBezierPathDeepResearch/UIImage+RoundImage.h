//
//  UIImage+RoundImage.h
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/23.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (RoundImage)

//裁剪圆形图片，带border宽度和颜色设置
+ (UIImage *)drawOvalPictureWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColour:(UIColor *)borderColour;

//屏幕view截图并保存到文件夹路径filePath中
+ (void)imageWithScreenShotView:(UIView *)view saveToFilePath:(NSString *)filePath;


@end
