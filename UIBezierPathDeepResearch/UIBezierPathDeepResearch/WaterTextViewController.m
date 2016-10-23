//
//  WaterTextViewController.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//  给图片添加水印

#import "WaterTextViewController.h"
#import "UIImage+RoundImage.h"

@interface WaterTextViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIImageView *haedImageView;

@end

@implementation WaterTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

//    [self drawOvalPicture];
//    [self drawOvalPictureWithBorder];
    _haedImageView.image = [UIImage drawOvalPictureWithImage:[UIImage imageNamed:@"WechatIMG"] borderWidth:2 borderColour:[UIColor purpleColor]];
}


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

- (void)drawOvalPictureWithBorder
{
    UIImage *image = [UIImage imageNamed:@"WechatIMG"];
    CGFloat imageWH = image.size.width;
    CGFloat borderWH = 5;
    CGFloat ovalWH = imageWH + 2 * borderWH;

//    开启图形上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(ovalWH, ovalWH), NO, 0);

//    画底板大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, ovalWH, ovalWH)];

    [[UIColor yellowColor] set];
//   填充大圆
    [path fill];

//    设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWH, borderWH, imageWH, imageWH)];

    [clipPath addClip];

//    绘制图片
    [image  drawAtPoint:CGPointMake(borderWH, borderWH)];

//    获取图片
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();

    _haedImageView.image = clipImage;

//    结束图形上下文
    UIGraphicsEndImageContext();

}


- (void)drawOvalPicture
{
    UIImage *image = [UIImage imageNamed:@"logo_IconGreen"];

    //开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);

    CGFloat center_X = _haedImageView.frame.size.width/2;

    //设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, image.size.width, image.size.height) cornerRadius:center_X];

    //先设定裁剪区域，然后再绘画
    [path addClip];

    [image drawAtPoint:CGPointZero];

    _haedImageView.image =  UIGraphicsGetImageFromCurrentImageContext();
//    关闭图形上下文
    UIGraphicsEndImageContext();

}



//给图片添加水印效果
- (void)drawWaterText
{
    UIImage *image = [UIImage imageNamed:@"icon_lock_insect"];
    //   1. 开启图形上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);

    //   2. 绘制原生的图片
    [image drawAtPoint:CGPointZero];

    //   3. 给图片添加水印
    NSString *str = @"Designed By Rephontil In China,Designed By Rephontil In China,Designed By Rephontil In China";
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    dic[NSForegroundColorAttributeName] = [UIColor cyanColor];
    // drawAtPoint:方法不会自动换行，drawInRect会自动换行。
    //    [str drawAtPoint:CGPointZero withAttributes:dic];
    [str drawInRect:CGRectMake(0, 0, image.size.width, image.size.height) withAttributes:dic];

    //   4.拿到图形上下文
    UIImage *imageV = UIGraphicsGetImageFromCurrentImageContext();

    //    将图形上下文展示在imageView上面
    _imageView.image = imageV;

    // 5. 结束图形上下文，减轻内存消耗
    UIGraphicsEndImageContext();

}


@end
