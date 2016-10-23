//
//  DrawOvalAndTransformViewController.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "DrawOvalAndTransformViewController.h"

@interface DrawOvalAndTransformViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *eraseImageView;
@property (nonatomic, assign)CGPoint startPoint;
@property (nonatomic, weak)UIView *clipView;
@end

@implementation DrawOvalAndTransformViewController

- (UIView *)clipView
{
    if (_clipView == nil) {
        UIView *view = [[UIView alloc] init];
        _clipView = view;
//        view.backgroundColor = [[UIColor clearColor] colorWithAlphaComponent:0.5];
        [self.view addSubview:view];

    }
    return _clipView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

//    图片截取
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:pan];


//    图片擦除
    UIPanGestureRecognizer *erasePan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(erasePan:)];
    [self.view addGestureRecognizer:erasePan];


}

// 图片截取（截图手指移动的范围内部视图）
- (void)pan:(UIPanGestureRecognizer *)pan
{
    NSLog(@"%s",__func__);
    CGPoint endPoint = CGPointZero;
    if (pan.state == UIGestureRecognizerStateBegan) {
        //    获取手指当前点的坐标
        _startPoint = [pan locationInView:self.view];

    }else if (pan.state == UIGestureRecognizerStateChanged){
//        手指移动过程中的位置，一直变化的位置
        endPoint = [pan locationInView:self.view];

        CGFloat clipWidth = endPoint.x - _startPoint.x;
        CGFloat clipHeight = endPoint.y - _startPoint.y;
        self.clipView.frame = CGRectMake(_startPoint.x, _startPoint.y, clipWidth, clipHeight);

    }else if (pan.state == UIGestureRecognizerStateEnded){

//        开启图形上下文
        UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
//        设置裁剪区域
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:_clipView.frame];

        [path addClip];

        CGContextRef ctx = UIGraphicsGetCurrentContext();

//        控件上的内容渲染到图形上下文
        [_imageView.layer renderInContext:ctx];

        _imageView.image = UIGraphicsGetImageFromCurrentImageContext();

        [_clipView removeFromSuperview];

        _clipView = nil;

    }

}


// 图片擦除（擦除手指移动的范围内部视图）
//图片擦除的思路：
- (void)erasePan:(UIPanGestureRecognizer *)erasePan
{
    NSLog(@"%s",__func__);
//    开启图形上下文
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
//    当前的位置
    CGPoint currentPoint = [erasePan locationInView:self.view];
//    设置擦除的矩形大小
    CGFloat eraseRectWH = 30;
    CGFloat startPoint_X = currentPoint.x - 0.5 * eraseRectWH;
    CGFloat startPoint_Y = currentPoint.y - 0.5 * eraseRectWH;
//计算擦除的路径大小和位置
    CGRect rect = CGRectMake(startPoint_X, startPoint_Y, eraseRectWH, eraseRectWH);
//获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
//渲染
    [self.eraseImageView.layer renderInContext:ctx];
//擦除移动的矩形
    CGContextClearRect(ctx, rect);
//将当前的图片添加到相框中
    self.eraseImageView.image = UIGraphicsGetImageFromCurrentImageContext();
//关闭图形上下文
    UIGraphicsEndImageContext();

}




@end
