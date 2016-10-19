//
//  DrawLine.m
//  Quartz 2D
//
//  Created by ZhouYong on 16/10/18.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "DrawLine.h"

@implementation DrawLine

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


//在视图即将出现的时候调用这个方法
- (void)drawRect:(CGRect)rect
{
    //[self drawStatus];
    [self drawQuadline];
}

- (void)baseUIBezierPath{
    //利用UIBezierPath这个类进行绘制   贝塞尔曲线法
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:CGPointMake(20, 70)];
    
    [bezierPath addLineToPoint:CGPointMake(370, 665)];
    
    [bezierPath stroke];

}

- (void)drawLine1{
    //  利用Quartz 2D里面的方法分为四个步骤: 1.获取图形上下文  2.创建路径  3.将路径添加到图形上下文  4.渲染上下文
    
    //获取图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10, 100);
    CGPathAddLineToPoint(path, NULL, 300, 500);
    
    //路径添加
    CGContextAddPath(ctx, path);
    
    //渲染上下文
    CGContextStrokePath(ctx);
}

- (void)drawLine2{
    CGContextRef ref = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ref, 350, 600);
    CGContextAddLineToPoint(ref, 20, 88);
    
    CGContextStrokePath(ref);
    NSLog(@"%s",__func__);
}

- (void)drawStatus{
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    [path1 moveToPoint:CGPointMake(30, 35)];
    [path1 addLineToPoint:CGPointMake(100, 300)];
    [path1 setLineWidth:15];
    [[UIColor redColor] setStroke];
    [path1 stroke];
    
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    [path2 moveToPoint:CGPointMake(100, 300)];
    [path2 addLineToPoint:CGPointMake(200, 600)];
    [path2 setLineWidth:10];
    [[UIColor cyanColor] setStroke];
    [path2 stroke];
}


//UIKit框架没有帮我们封装画曲线的方法,只能通过原声的方法进行曲线绘制
- (void)drawQuadline{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 40, 200); //曲线的起点
    [[UIColor redColor] setStroke];
    CGContextAddQuadCurveToPoint(ctx, 140, 400, 240, 200);
    CGContextSetLineWidth(ctx, 10);
    CGContextStrokePath(ctx);
    
}





@end
