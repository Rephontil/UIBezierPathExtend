//
//  DrawOvalViewAndTransformIt.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "DrawOvalViewAndTransformIt.h"

@implementation DrawOvalViewAndTransformIt


- (void)drawRect:(CGRect)rect {
    NSLog(@"%s",__func__);

    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor cyanColor] set];
    
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 200, 200, 100)];
    
    CGContextTranslateCTM(ctx, 350, 200);
    
    CGContextRotateCTM(ctx, M_PI_4 + M_PI * _scaleAngle);
    
    CGContextSetLineWidth(ctx, 8);
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
    
}


- (void)setScaleAngle:(CGFloat)scaleAngle
{
    NSLog(@"%s",__func__);
    _scaleAngle = scaleAngle;
    [self setNeedsDisplay];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.scaleAngle = arc4random_uniform(101)/100.0;  // 0~1
    NSLog(@"%s %f",__func__, _scaleAngle);
}


@end
