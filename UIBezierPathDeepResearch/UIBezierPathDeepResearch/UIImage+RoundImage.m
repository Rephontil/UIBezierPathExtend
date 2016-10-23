//
//  UIImage+RoundImage.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/23.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "UIImage+RoundImage.h"

@implementation UIImage (RoundImage)

//裁剪圆形图片，带border宽度和颜色设置
+ (UIImage *)drawOvalPictureWithImage:(UIImage *)image borderWidth:(CGFloat)borderWidth borderColour:(UIColor *)borderColour
{
    //  UIImage *image = [UIImage imageNamed:@"WechatIMG"];
    CGFloat imageWH = image.size.width;
    CGFloat borderWH = borderWidth;
    CGFloat ovalWH = imageWH + 2 * borderWH;

    //    开启图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);

    //    画底板大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];

    [borderColour set];
    //   填充大圆
    [path fill];

    //    设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWH, borderWH, imageWH, imageWH)];

    [clipPath addClip];

    //    绘制图片
    [image  drawAtPoint:CGPointMake(borderWH, borderWH)];

    //    获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();

    //    结束图形上下文
    UIGraphicsEndImageContext();
    
    return clipImage;
}

//屏幕view截图并保存到文件夹路径filePath中
+ (void)imageWithScreenShotView:(UIView *)view saveToFilePath:(NSString *)filePath
{
    //    1 开启上下文
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0);

    //    2 获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    //    3. 将控件上面的图层渲染到上下文
    [view.layer renderInContext:ctx];

//       4.  获取当前的视图
    UIImage *obtainImage = UIGraphicsGetImageFromCurrentImageContext();

    //   5. 转换成二进制流文件
    NSData *imageData = UIImagePNGRepresentation(obtainImage);

    [imageData writeToFile:[NSString stringWithFormat:@"%@",filePath] atomically:YES];

    //    关闭图形上下文
    UIGraphicsEndImageContext();
    
}



@end
