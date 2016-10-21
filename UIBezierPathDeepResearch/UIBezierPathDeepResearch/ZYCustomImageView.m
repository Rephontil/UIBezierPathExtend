//
//  ZYCustomImageView.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/21.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ZYCustomImageView.h"

@implementation ZYCustomImageView

//模仿UIImageView这个类提供的初始化方法,这个初始化方法创建出来的图片尺寸和提供的图片尺寸一样大小
- (instancetype)initWithImage:(UIImage *)image
{
    NSLog(@"%s",__func__);
    if (self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)]) {
        _image = image;
    }
    return self;
}

- (void)setImage:(UIImage *)image
{
    NSLog(@"%s",__func__);
    _image = image;
    [self setNeedsDisplay];
}


//这个方法里面可以获取图形上下文
- (void)drawRect:(CGRect)rect
{
    NSLog(@"%s",__func__);
    [_image drawInRect:rect];

    
}
- (void)awakeFromNib
{
    NSLog(@"%s",__func__);
    [super awakeFromNib];
}


@end
