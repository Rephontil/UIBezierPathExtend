//
//  UIImage+RoundImage.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/23.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "UIImage+RoundImage.h"

@implementation UIImage (RoundImage)

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

    //    _haedImageView.image = clipImage;

    //    结束图形上下文
    UIGraphicsEndImageContext();
    
    return clipImage;
}


@end
