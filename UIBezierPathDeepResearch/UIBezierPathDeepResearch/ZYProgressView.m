//
//  ZYProgressView.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/19.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ZYProgressView.h"

@implementation ZYProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

    }
    return self;
}

- (void)setProgressValue:(CGFloat)progressValue
{
    _progressValue = progressValue;
    [self setNeedsDisplay];
}

//drawrect方法不能手动调用,因为图形上下文我们自己创建不了,只能由系统帮我们创建.并且由系统传递给我们.
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
      NSLog(@"%s",__func__);
    CGPoint center = CGPointMake(rect.size.width/2, rect.size.height/2);
    CGFloat startAngle = - M_PI * 0.5;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:70 startAngle:startAngle endAngle:startAngle + _progressValue *2*M_PI clockwise:YES];
    if (_progressValue == 1.00) {
        [[UIColor redColor] setStroke];
        [path setLineWidth:5];
    }
    [path stroke];

}

@end




