//
//  ZYProgressView.m
//  UIBezierPathDeepResearch
//
//  Created by ZhouYong on 16/10/19.
//  Copyright © 2016年 Rephontil/Yong Zhou. All rights reserved.
//

#import "ZYProgressView.h"

#define width   self.frame.size.width
#define height  self.frame.size.height

@implementation ZYProgressView

- (void)setProgressValue:(CGFloat)progressValue{
    _progressValue = progressValue;
    [self setNeedsDisplay];
    NSLog(@"%s",__func__);
}



//drawrect方法不能手动调用,因为图形上下文我们自己创建不了,只能由系统帮我们创建.并且由系统传递给我们.
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
      NSLog(@"%s",__func__);

}

@end




