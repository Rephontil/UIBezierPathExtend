//
//  WaterTextViewController.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//  给图片添加水印

#import "WaterTextViewController.h"

@interface WaterTextViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WaterTextViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

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
