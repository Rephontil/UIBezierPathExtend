//
//  ZYPieChartView.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/20.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ZYPieChartView.h"

@implementation ZYPieChartView

- (UIColor *)colourArandom{
    CGFloat red = arc4random_uniform(256)/255.0;
    CGFloat green = arc4random_uniform(256)/255.0;
    CGFloat blue = arc4random_uniform(256)/255.0;
    NSLog(@"%f %f %f",red,green,blue);
    return  [UIColor colorWithRed:red green:green blue:blue alpha:1];

}

- (NSArray *)integerArandom{
    NSArray *array = [NSMutableArray arrayWithCapacity:0];
    NSUInteger numA = arc4random_uniform(50);
    NSUInteger numB = arc4random_uniform(50);
    NSUInteger numC = 100 - numA - numB;
    array = @[@(numA),@(numB),@(numC)];
    NSLog(@"%lu %lu %lu",(unsigned long)numA,(unsigned long)numB,(unsigned long)
          numC);
    return array;

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGFloat radius = rect.size.width/2;
    CGPoint center = CGPointMake(radius, radius);

    NSArray *arr = [self integerArandom];
    CGFloat startAngle = 0;
    CGFloat angle = 0;
    CGFloat endAngle = 0;
    for (int i = 0 ; i < 3; i++) {
        startAngle = endAngle;
        angle = [arr[i] doubleValue]/100.0;

        endAngle = startAngle + angle * M_PI *2;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES ];
        [path addLineToPoint:center];
        [[self colourArandom] set];
        [path fill];


        NSLog(@"%d",i);
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];
}

@end
