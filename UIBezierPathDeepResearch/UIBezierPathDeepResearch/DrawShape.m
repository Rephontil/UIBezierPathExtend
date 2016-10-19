//
//  DrawShape.m
//  Quartz 2D
//
//  Created by ZhouYong on 16/10/19.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "DrawShape.h"

@implementation DrawShape

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

//只有画曲线的时候才会使用原始的方法quartz 2D  其他的都是用UIBezier Path
//drawrect方法不能手动调用,因为图形上下文我们自己创建不了,只能由系统帮我们创建.并且由系统传递给我们.
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIBezierPath *path = [UIBezierPath bezierPath];
    path =  [UIBezierPath bezierPathWithRect:CGRectMake(100, 100, 100, 100)];
    [path stroke];
    
    UIBezierPath *path1 = [UIBezierPath bezierPath];
    path1 =  [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 300, 50, 50) cornerRadius:20];
    path1.lineWidth = 3;
    [[UIColor redColor] setStroke];
    [path1 stroke];
    [path1 fill];
    
    //画直线
    UIBezierPath *pathline1 = [UIBezierPath bezierPath];
    [pathline1 moveToPoint:CGPointMake(20, 360)];
    [pathline1 addLineToPoint:CGPointMake(100, 360)];
    [[UIColor redColor] setStroke];
    [pathline1 stroke];
    
    //画椭圆
    UIBezierPath *pathOval = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 360, 100, 80)];
    [[UIColor grayColor] setStroke];
    [pathOval stroke];
    
    //画矩形
    UIBezierPath *pathRect = [UIBezierPath bezierPath];
    pathRect =  [UIBezierPath bezierPathWithRect:CGRectMake(100, 360, 100, 80)];
    [pathRect stroke];
    
    //画圆弧
    UIBezierPath *pathCircle = [UIBezierPath bezierPathWithArcCenter:CGPointMake(187.5, 500) radius:50 startAngle:0 endAngle:M_PI*1.7 clockwise:YES];
    [pathCircle addLineToPoint:CGPointMake(187.5, 500)];
    [pathCircle closePath];
    [[UIColor yellowColor] setStroke];
    [pathCircle setLineWidth:8];
    [pathCircle fill];
    [pathCircle stroke];


}

@end
