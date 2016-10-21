//
//  ZYDrawSnowView.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ZYDrawSnowView.h"

static CGFloat heigth = 0;

@implementation ZYDrawSnowView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame: frame]) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
//    NSLog(@"%s",__func__);
    heigth += 10;
    CGFloat width = arc4random_uniform(375);
    UIImage *image = [UIImage imageNamed:@"snow"];
    [image drawAtPoint:CGPointMake(width, heigth)];
   
    if (heigth > rect.size.height) {
        heigth = 0;
    }
}

// 只加载一次
- (void)awakeFromNib
{
    [super awakeFromNib];
//    这个定时器每秒钟执行60次
    CADisplayLink *linkTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(snowing)];
    [linkTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

//这个方法在每次刷新屏幕的时候执行，和setNeedsDisplay保持步调一致，这样屏幕图画就不会出现卡顿的现象。
- (void)snowing{
//    NSLog(@"%s",__func__);
//这个方法不会马上调用- (void)drawRect:(CGRect)rect方法，只会先添加一个刷新的标记，等到下次刷新屏幕的时候系统再调用- (void)drawRect:(CGRect)rect方法。
    [self setNeedsDisplay];
}


@end
