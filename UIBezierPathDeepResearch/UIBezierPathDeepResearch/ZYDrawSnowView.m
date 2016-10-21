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
    NSLog(@"%s",__func__);

    // Drawing code
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
    CADisplayLink *linkTimer = [CADisplayLink displayLinkWithTarget:self selector:@selector(snowing)];
    [linkTimer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)snowing{
    NSLog(@"%s",__func__);

    [self setNeedsDisplay];
}


@end
